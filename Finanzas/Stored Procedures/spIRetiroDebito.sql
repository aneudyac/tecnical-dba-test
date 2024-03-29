create   proc [Finanzas].[spIRetiroDebito](
	@IDTarjetaDebito int,
	@Monto decimal(18,2)
) as
	declare 
		@ESTATUS_TARJETA_BLOQUEADA int = 3,
		@ESTATUS_CUENTA_BLOQUEADA int = 3,
		@LIMITE_DE_RETIRO decimal(18,2) = 5000.00,

		@IDEstatusActualTarjeta int,
		@IDCliente int,
		@IDCuenta int,
		@Saldo	decimal(18,2)		
	;

	select 
		@IDCliente = c.IDCliente,
		@IDCuenta = c.IDCuenta,
		@Saldo = c.Saldo
	from [Finanzas].[tblTarjetasDebito] td
		inner join [Finanzas].[tblCuentas] c on c.IDCuenta = td.IDCuenta
	where td.IDTarjetaDebito = @IDTarjetaDebito	

	if (@IDEstatusActualTarjeta = @ESTATUS_TARJETA_BLOQUEADA)
	begin
		raiserror('La tarjeta está bloqueada.', 16, 1);
		return
	end
	
	if (@Monto > @LIMITE_DE_RETIRO)
	begin
		update [Finanzas].[tblTarjetasDebito]
			set 
				IDEstatusTarjeta = @ESTATUS_TARJETA_BLOQUEADA
		where IDTarjetaDebito = @IDTarjetaDebito	

		update [Finanzas].[tblCuentas]
			set 
				IDEstatusCuenta = @ESTATUS_CUENTA_BLOQUEADA
		where IDCuenta = @IDCuenta	

		exec [Clientes].[spValidarEstatusCliente] @IDCliente = @IDCliente

		raiserror('Tarjeta bloqueada por intentar retiro mayor al monto permitido.', 16, 1);
		return
	end

	if (@Monto > @Saldo)
	begin
		raiserror('Saldo insuficiente para esta transacción.', 16, 1);
		return
	end

	insert [Finanzas].[tblMovimientos](IDCuenta, IDTarjetaDebito, Cargo)
	values(@IDCuenta, @IDTarjetaDebito, @Monto)
create   proc [Finanzas].[spIAbonoDebito](
	@IDTarjetaDebito int,
	@Monto decimal(18,2)
) as
	declare 
		@ESTATUS_TARJETA_BLOQUEADA int = 3,

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
	
	insert [Finanzas].[tblMovimientos](IDCuenta, IDTarjetaDebito, Abono)
	values(@IDCuenta, @IDTarjetaDebito, @Monto)
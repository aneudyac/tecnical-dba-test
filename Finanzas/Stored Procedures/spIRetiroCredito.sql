

create   proc [Finanzas].[spIRetiroCredito](
	@IDTarjetaCredito int,
	@Monto decimal(18,2)
) as
	declare 
		@ESTATUS_TARJETA_BLOQUEADA int = 3,

		@IDEstatusActualTarjeta int,
		@LimiteCredito	decimal(18,2),
		@Credito		decimal(18,2)
	;

	select 
		@LimiteCredito	= tc.LimiteCredito,	
		@Credito		= tc.Credito,
		@IDEstatusActualTarjeta = tc.IDEstatusTarjeta
	from [Finanzas].[tblTarjetasCredito] tc
	where tc.IDTarjetaCredito = @IDTarjetaCredito

	if (@IDEstatusActualTarjeta = @ESTATUS_TARJETA_BLOQUEADA)
	begin
		raiserror('La tarjeta está bloqueada.', 16, 1);
		return
	end

	if ((isnull(@Monto, 0) + isnull(@Credito, 0)) > @LimiteCredito)
	begin
		update [Finanzas].[tblTarjetasCredito]
			set 
				IDEstatusTarjeta = @ESTATUS_TARJETA_BLOQUEADA
		where IDTarjetaCredito = @IDTarjetaCredito

		raiserror('No tiene crédito suficiente para esta transacción.', 16, 1);
		return
	end

	insert [Finanzas].[tblMovimientos](IDTarjetaCredito, Cargo)
	values(@IDTarjetaCredito, @Monto)
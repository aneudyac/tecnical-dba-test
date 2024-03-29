
create   proc [Clientes].[spValidarEstatusCliente](
	@IDCliente int
) as
begin
	declare 
		@ESTATUS_CLIENTE_BLOQUEADO int = 4,
		@MINIMO_TARJETAS_BLOQUEADAS_PERMITIDAS int = 2,
		@ESTATUS_TARJETA_BLOQUEADA int = 3,

		@TotalTarjetasBloqueadas int,
		@MontoCuentas decimal(18,2)
	;

	select @TotalTarjetasBloqueadas = count(IDEstatusTarjeta) 
	from [Finanzas].[tblTarjetasCredito]
	where IDCliente = @IDCliente and IDEstatusTarjeta = @ESTATUS_TARJETA_BLOQUEADA

	select @TotalTarjetasBloqueadas = count(IDEstatusTarjeta) + @TotalTarjetasBloqueadas
	from [Finanzas].[tblCuentas] c
		inner join [Finanzas].[tblTarjetasDebito] td on td.IDCuenta = c.IDCuenta
	where c.IDCliente = @IDCliente

	if (@TotalTarjetasBloqueadas >= @MINIMO_TARJETAS_BLOQUEADAS_PERMITIDAS)
	begin
		update [Clientes].[tblClientes]
			set
				IDEstatusCliente = @ESTATUS_CLIENTE_BLOQUEADO
		where IDCliente = @IDCliente

		return
	end

	select @MontoCuentas = sum(c.Saldo)
	from [Finanzas].[tblCuentas] c
		inner join [Finanzas].[tblTarjetasDebito] td on td.IDCuenta = c.IDCuenta
	where c.IDCliente = @IDCliente

	if (@MontoCuentas = 0)
	begin
		update [Clientes].[tblClientes]
			set
				IDEstatusCliente = @ESTATUS_CLIENTE_BLOQUEADO
		where IDCliente = @IDCliente

		return
	end

end
declare 
	@IDCliente int,
	@IDTarjetaDebito int,
	@NumeroCuenta bigint,
	@NumeroTarjeta bigint,
	@SaldoCuenta decimal(18,2),
	@LimiteCredito decimal(18,2),
	@DiaDeCorte int,
	@IDEstatusCuenta int,
	@IDEstatusTarjeta int,

	@ESTATUS_CUENTA_ACTIVA int = 1,	
	@ESTATUS_TARJETA_ACTIVA int = 1	
;

-- Declaración de variables para el bucle
select @IDCliente = min(IDCliente) from [Clientes].[tblClientes]

if not exists(select top 1 1 from [Finanzas].[tblCuentas])
begin
	while exists(select top 1 1 
				from [Clientes].[tblClientes]
				where IDCliente >= @IDCliente
			)
	begin
		-- Generar número de cuenta aleatorio (solo números)
		set @NumeroCuenta = abs(convert(bigint, hashbytes('md5', cast(newid() as varchar(36))))) % 1000000000000000000;

		-- Generar número de tarjeta aleatorio (solo números)
		set @NumeroTarjeta = abs(convert(bigint, hashbytes('md5', cast(newid() as varchar(36))))) % 10000000000000000;

		-- Generar límite de crédito aleatorio (solo como ejemplo, deberías ajustar esto según tus necesidades)
		set @LimiteCredito = cast(rand() * 100000 as decimal(18,2));
		set @SaldoCuenta = cast(rand() * 50000 as decimal(18,2));
	

		-- Generar día de corte aleatorio (solo como ejemplo, deberías ajustar esto según tus necesidades)
		set @DiaDeCorte = cast(rand() * 28 + 1 as int); -- Suponiendo que el día de corte puede ser del 1 al 28

		-- Seleccionar un estado de cuenta y estado de tarjeta aleatorio (solo como ejemplo, deberías ajustar esto según tus necesidades)
		select top 1 @IDEstatusCuenta = IDEstatusCuenta from [Catalogos].[tblEstatusCuentas] order by newid();
		select top 1 @IDEstatusTarjeta = IDEstatusTarjeta from [Catalogos].[tblEstatusTarjetas] order by newid();

		-- Insertar cuenta
		insert into [Finanzas].[tblCuentas] (IDCliente, NumeroCuenta, Saldo, IDEstatusCuenta)
		values (@IDCliente, @NumeroCuenta, 0.00, @IDEstatusCuenta);

		-- Insertar tarjeta de débito
		insert into [Finanzas].[tblTarjetasDebito] (IDCuenta, NumeroTarjeta, IDEstatusTarjeta, FechaHoraRegistro)
		values ((select IDCuenta from [Finanzas].[tblCuentas] where IDCliente = @IDCliente and NumeroCuenta = @NumeroCuenta), @NumeroTarjeta, @IDEstatusTarjeta, getdate());

		set @IDTarjetaDebito = SCOPE_IDENTITY()

		if ((@IDEstatusCuenta = @ESTATUS_CUENTA_ACTIVA) and (@IDEstatusTarjeta = @ESTATUS_TARJETA_ACTIVA))
		begin
			exec [Finanzas].[spIAbonoDebito] @IDTarjetaDebito=@IDTarjetaDebito, @Monto = @SaldoCuenta;
		end

		-- Insertar tarjeta de crédito
		insert into [Finanzas].[tblTarjetasCredito] (IDCliente, NumeroTarjeta, LimiteCredito, Credito, DiaDeCorte, IDEstatusTarjeta, FechaHoraRegistro)
		values (@IDCliente, @NumeroTarjeta, @LimiteCredito, 0.00, @DiaDeCorte, @IDEstatusTarjeta, getdate());

		-- Obtener el siguiente ID de cliente
		select @IDCliente = min(IDCliente) 
		from [Clientes].[tblClientes]
		where IDCliente > @IDCliente;
	end
end
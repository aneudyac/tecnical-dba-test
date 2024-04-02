declare 
	@IDCliente int,
	@IDTarjetaDebito int,
	@NumeroCuenta bigint,
	@NumeroTarjeta bigint,
	@NumeroTarjetaCredito bigint,
	@SaldoCuenta decimal(18,2),
	@LimiteCredito decimal(18,2),
	@DiaDeCorte int,
	@IDEstatusCuenta int,
	@IDEstatusTarjeta int,
	@IDEstatusTarjetaCredito int,

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

		declare
			@TotalCuentas int,
			@IdxCuenta int = 0,
			@IDNuevaCuenta int,
			@AsignarTarjetaDebito int, /* 1 = SI - 2 = NO */
			@AsignarTarjetaCredito int /* 1 = SI - 2 = NO */
		;

		set @TotalCuentas = cast(rand() * 5 + 1 as int);

		while (@IdxCuenta < @TotalCuentas)
		begin
				-- Generar número de cuenta aleatorio (solo números)
			set @NumeroCuenta = abs(convert(bigint, hashbytes('md5', cast(newid() as varchar(36))))) % 1000000000000000000;

			set @SaldoCuenta = cast(rand() * 500000 as decimal(18,2));

			-- Seleccionar un estado de cuenta y estado de tarjeta aleatorio (solo como ejemplo, deberías ajustar esto según tus necesidades)
			--select top 1 @IDEstatusCuenta = IDEstatusCuenta from [Catalogos].[tblEstatusCuentas] order by newid();
			set @IDEstatusCuenta = @ESTATUS_CUENTA_ACTIVA

			-- Insertar cuenta
			insert into [Finanzas].[tblCuentas] (IDCliente, NumeroCuenta, Saldo, IDEstatusCuenta)
			values (@IDCliente, @NumeroCuenta, 0.00, @IDEstatusCuenta);

			set @IDNuevaCuenta = SCOPE_IDENTITY()

			set @AsignarTarjetaDebito = cast(rand() * 2 + 1 as int)

			--if (@AsignarTarjetaDebito = 1)
			begin
				-- Insertar tarjeta de débito
				-- Generar número de tarjeta aleatorio (solo números)
				set @NumeroTarjeta = abs(convert(bigint, hashbytes('md5', cast(newid() as varchar(36))))) % 10000000000000000;
				--select top 1 @IDEstatusTarjeta = IDEstatusTarjeta from [Catalogos].[tblEstatusTarjetas] order by newid();
				set @IDEstatusTarjeta = @ESTATUS_TARJETA_ACTIVA

				insert into [Finanzas].[tblTarjetasDebito] (IDCuenta, NumeroTarjeta, IDEstatusTarjeta, FechaHoraRegistro)
				values (@IDNuevaCuenta, @NumeroTarjeta, @IDEstatusTarjeta, getdate());

				set @IDTarjetaDebito = SCOPE_IDENTITY()

				if ((@IDEstatusCuenta = @ESTATUS_CUENTA_ACTIVA) and (@IDEstatusTarjeta = @ESTATUS_TARJETA_ACTIVA))
				begin
					exec [Finanzas].[spIAbonoDebito] @IDTarjetaDebito=@IDTarjetaDebito, @Monto = @SaldoCuenta;
				end
			end

			set @IdxCuenta += 1;
		end
		
		set @AsignarTarjetaCredito = cast(rand() * 2 + 1 as int)

		--if (@AsignarTarjetaCredito = 1)
		begin
			
			set @NumeroTarjetaCredito = abs(convert(bigint, hashbytes('md5', cast(newid() as varchar(36))))) % 10000000000000000;
			
			--select top 1 @IDEstatusTarjetaCredito = IDEstatusTarjeta from [Catalogos].[tblEstatusTarjetas] order by newid();
			set @IDEstatusTarjetaCredito = @ESTATUS_TARJETA_ACTIVA

			-- Generar límite de crédito aleatorio (solo como ejemplo, deberías ajustar esto según tus necesidades)
			set @LimiteCredito = cast(rand() * 150000 as decimal(18,2));

			-- Generar día de corte aleatorio (solo como ejemplo, deberías ajustar esto según tus necesidades)
			set @DiaDeCorte = cast(rand() * 28 + 1 as int); -- Suponiendo que el día de corte puede ser del 1 al 28

			-- Insertar tarjeta de crédito
			insert into [Finanzas].[tblTarjetasCredito] (IDCliente, NumeroTarjeta, LimiteCredito, Credito, DiaDeCorte, IDEstatusTarjeta, FechaHoraRegistro)
			values (@IDCliente, @NumeroTarjeta, @LimiteCredito, 0.00, @DiaDeCorte, @IDEstatusTarjetaCredito, getdate());

		end

		-- Obtener el siguiente ID de cliente
		select @IDCliente = min(IDCliente) 
		from [Clientes].[tblClientes]
		where IDCliente > @IDCliente;
	end
end
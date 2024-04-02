


declare 
	@IDCuenta int,
	@IDTarjeta int,
	@SaldoInicial decimal(18,2),
	@SaldoActual decimal(18,2),
	@CantidadRetiro int,
	@PorcentajeRetiro decimal(18, 2),
	@MontoRetiro decimal(18, 2),
	@Continue bit,

	@ID_ESTATUS_CLIENTE_ACTIVO int = 1,
	@ID_ESTATUS_CUENTA_ACTIVA int = 1,
	@ID_ESTATUS_TARJETA_ACTIVA int = 1
;

if object_id('tempdb..#tempTarjetasDebito') is not null drop table #tempTarjetasDebito;

select 
	t.IDCuenta,
	t.IDTarjetaDebito,
	cu.Saldo
INTO #tempTarjetasDebito
from [Clientes].tblClientes c
	join [Finanzas].[tblCuentas] cu on cu.IDCliente = c.IDCliente and cu.IDEstatusCuenta = @ID_ESTATUS_CUENTA_ACTIVA
	join [Finanzas].[tblTarjetasDebito] t on t.IDCuenta = cu.IDCuenta and t.IDEstatusTarjeta = @ID_ESTATUS_TARJETA_ACTIVA
	--join [Finanzas].[tblTarjetasCredito] tc on tc.IDCliente = c.IDCliente and tc.IDEstatusTarjeta = @ID_ESTATUS_TARJETA_ACTIVA
where c.IDEstatusCliente = @ID_ESTATUS_CLIENTE_ACTIVO

 select @IDTarjeta = min(IDTarjetaDebito)
 from #tempTarjetasDebito

 while exists(select top 1 1 from #tempTarjetasDebito where IDTarjetaDebito >= @IDTarjeta)
 begin
	select
		@IDCuenta = IDCuenta,
		@SaldoInicial = Saldo,
		@SaldoActual = Saldo
	from #tempTarjetasDebito
	where IDTarjetaDebito = @IDTarjeta 

	select 
		@Continue = 1,
		@CantidadRetiro = 0
	;

	while (@Continue = 1)
	begin
		begin try
			set @PorcentajeRetiro = (rand() * 5 + 1) / 100.00;
			set @MontoRetiro = @SaldoActual * @PorcentajeRetiro
	
			exec [Finanzas].[spIRetiroDebito] @IDTarjetaDebito=@IDTarjeta, @Monto=@MontoRetiro

			select @SaldoActual = @SaldoActual - @MontoRetiro
			set @CantidadRetiro = @CantidadRetiro + 1

			if (@SaldoActual <= (@SaldoInicial * 0.10))
			begin
				set @Continue = 0
			end

			if (@CantidadRetiro >= 10)
			begin
				set @Continue = 0
			end
		end try
		begin catch
			set @Continue = 0
			SELECT ERROR_MESSAGE()
		end catch

	end

	select @IDTarjeta = min(IDTarjetaDebito)
	from #tempTarjetasDebito
	where IDTarjetaDebito > @IDTarjeta

 end
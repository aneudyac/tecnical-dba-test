


declare 
	@IDCuenta int,
	@IDTarjeta int,
	@SaldoActual decimal(18,2),
	@LimiteCredito decimal(18,2),
	@Credito decimal(18,2),
	@CantidadRetiro int,
	@PorcentajeRetiro decimal(18, 2),
	@MontoRetiro decimal(18, 2),
	@Continue bit,

	@ID_ESTATUS_CLIENTE_ACTIVO int = 1,
	@ID_ESTATUS_CUENTA_ACTIVA int = 1,
	@ID_ESTATUS_TARJETA_ACTIVA int = 1
;

if object_id('tempdb..#tempTarjetasCredito') is not null drop table #tempTarjetasCredito;

select 
	t.IDTarjetaCredito,
	t.LimiteCredito,
	t.Credito
INTO #tempTarjetasCredito
from [Clientes].tblClientes c
	join [Finanzas].[tblTarjetasCredito] t on t.IDCliente = c.IDCliente and t.IDEstatusTarjeta = @ID_ESTATUS_TARJETA_ACTIVA
where c.IDEstatusCliente = @ID_ESTATUS_CLIENTE_ACTIVO

 select @IDTarjeta = min(IDTarjetaCredito)
 from #tempTarjetasCredito

 while exists(select top 1 1 from #tempTarjetasCredito where IDTarjetaCredito >= @IDTarjeta)
 begin
	select 
		@LimiteCredito = LimiteCredito,
		@Credito = Credito
	from #tempTarjetasCredito
	where IDTarjetaCredito = @IDTarjeta 

	select 
		@Continue = 1,
		@CantidadRetiro = 0
	;

	set @SaldoActual = (@LimiteCredito - @Credito)
	while (@Continue = 1)
	begin
		begin try
			set @PorcentajeRetiro = (rand() * 5 + 1) / 100.00;
			set @MontoRetiro = @SaldoActual * @PorcentajeRetiro
	
			exec [Finanzas].[spIRetiroCredito] @IDTarjetaCredito=@IDTarjeta, @Monto=@MontoRetiro

			set @Credito = @Credito + @MontoRetiro;
			set @SaldoActual = (@LimiteCredito - (@Credito))
			set @CantidadRetiro = @CantidadRetiro + 1

			if (@SaldoActual <= (@LimiteCredito * 0.10))
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

	select @IDTarjeta = min(IDTarjetaCredito)
	from #tempTarjetasCredito
	where IDTarjetaCredito > @IDTarjeta

 end
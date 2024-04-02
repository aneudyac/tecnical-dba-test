


declare 
	@CREDITO_IDTarjeta int,
	@CREDITO_SaldoActual decimal(18,2),
	@CREDITO_LimiteCredito decimal(18,2),
	@CREDITO_Credito decimal(18,2),
	@CREDITO_CantidadRetiro int,
	@CREDITO_PorcentajeRetiro decimal(18, 2),
	@CREDITO_MontoRetiro decimal(18, 2),
	@CREDITO_Continue bit,
	 
	@CREDITO_ID_ESTATUS_CLIENTE_ACTIVO int = 1,
	@CREDITO_ID_ESTATUS_CUENTA_ACTIVA int = 1,
	@CREDITO_ID_ESTATUS_TARJETA_ACTIVA int = 1
;

if object_id('tempdb..#tempTarjetasCredito') is not null drop table #tempTarjetasCredito;

select 
	t.IDTarjetaCredito,
	t.LimiteCredito,
	t.Credito
INTO #tempTarjetasCredito
from [Clientes].tblClientes c
	join [Finanzas].[tblTarjetasCredito] t on t.IDCliente = c.IDCliente and t.IDEstatusTarjeta = @CREDITO_ID_ESTATUS_TARJETA_ACTIVA
where c.IDEstatusCliente = @CREDITO_ID_ESTATUS_CLIENTE_ACTIVO

 select @CREDITO_IDTarjeta = min(IDTarjetaCredito)
 from #tempTarjetasCredito

 while exists(select top 1 1 from #tempTarjetasCredito where IDTarjetaCredito >= @CREDITO_IDTarjeta)
 begin
	select 
		@CREDITO_LimiteCredito = LimiteCredito,
		@CREDITO_Credito = Credito
	from #tempTarjetasCredito
	where IDTarjetaCredito = @CREDITO_IDTarjeta 

	select 
		@CREDITO_Continue = 1,
		@CREDITO_CantidadRetiro = 0
	;

	set @CREDITO_SaldoActual = (@CREDITO_LimiteCredito - @CREDITO_Credito)
	while (@CREDITO_Continue = 1)
	begin
		begin try
			set @CREDITO_PorcentajeRetiro = (rand() * 5 + 1) / 100.00;
			set @CREDITO_MontoRetiro = @CREDITO_SaldoActual * @CREDITO_PorcentajeRetiro
	
			exec [Finanzas].[spIRetiroCredito] @CREDITO_IDTarjetaCredito=@CREDITO_IDTarjeta, @Monto=@CREDITO_MontoRetiro

			set @CREDITO_Credito = @CREDITO_Credito + @CREDITO_MontoRetiro;
			set @CREDITO_SaldoActual = (@CREDITO_LimiteCredito - (@CREDITO_Credito))
			set @CREDITO_CantidadRetiro = @CREDITO_CantidadRetiro + 1

			if (@CREDITO_SaldoActual <= (@CREDITO_LimiteCredito * 0.10))
			begin
				set @CREDITO_Continue = 0
			end

			if (@CREDITO_CantidadRetiro >= 10)
			begin
				set @CREDITO_Continue = 0
			end
		end try
		begin catch
			set @CREDITO_Continue = 0
			SELECT ERROR_MESSAGE()
		end catch

	end

	select @CREDITO_IDTarjeta = min(IDTarjetaCredito)
	from #tempTarjetasCredito
	where IDTarjetaCredito > @CREDITO_IDTarjeta

 end
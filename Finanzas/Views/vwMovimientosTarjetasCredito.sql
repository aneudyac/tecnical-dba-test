create   view [Finanzas].[vwMovimientosTarjetasCredito] as
	select 
		 m.IDMovimiento
		,m.IDTarjetaCredito
		,tb.NumeroTarjeta
		,m.Cargo
		,m.Abono
		,m.SaldoActual
		,m.FechaHoraRegistro
	from [Finanzas].tblMovimientos m
		join [Finanzas].[tblTarjetasCredito] tb on tb.IDTarjetaCredito = m.IDTarjetaCredito
	where m.IDTarjetaCredito is not null
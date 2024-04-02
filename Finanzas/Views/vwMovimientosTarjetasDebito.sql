create   view [Finanzas].[vwMovimientosTarjetasDebito] as
	select 
		 m.IDMovimiento
		,m.IDCuenta
		,m.IDTarjetaDebito
		,tb.NumeroTarjeta
		,m.Cargo
		,m.Abono
		,m.SaldoActual
		,m.FechaHoraRegistro
	from [Finanzas].tblMovimientos m
		join [Finanzas].[tblTarjetasDebito] tb on tb.IDTarjetaDebito = m.IDTarjetaDebito
	where m.IDCuenta is not null and m.IDTarjetaDebito is not null
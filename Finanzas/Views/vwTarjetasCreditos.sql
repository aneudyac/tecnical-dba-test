create   view [Finanzas].[vwTarjetasCreditos] as
	select 
		 tc.IDTarjetaCredito
		,tc.IDCliente
		,tc.NumeroTarjeta
		,tc.LimiteCredito
		,tc.DiaDeCorte
		,tc.IDEstatusTarjeta
		,et.Nombre as [Estatus Tarjetas]
		,tc.FechaHoraRegistro
		,tc.Credito
	from [Finanzas].[tblTarjetasCredito] tc
		join [Catalogos].[tblEstatusTarjetas] et on et.IDEstatusTarjeta = tc.IDEstatusTarjeta
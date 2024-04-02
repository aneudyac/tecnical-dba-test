create   view [Finanzas].[vwTarjetasDebito] as
	select 
		c.IDCliente
		,c.Cliente
		,c.[Estatus Cliente]
		,td.IDTarjetaDebito
		,td.IDCuenta
		,c.[Numero Cuenta]
		,c.[Estatus Cuenta]
		,c.Saldo
		,td.NumeroTarjeta as [Numero Tarjeta]
		,td.IDEstatusTarjeta
		,et.Nombre as [Estatus Tarjetas]
		,td.FechaHoraRegistro
	from [Finanzas].[tblTarjetasDebito] td
		join [Catalogos].[tblEstatusTarjetas] et on et.IDEstatusTarjeta = td.IDEstatusTarjeta
		join [Finanzas].[vwCuentas] c on c.IDCuenta = td.IDCuenta

--select *
--from [Finanzas].[vwTarjetasCreditos]
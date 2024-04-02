create   view [Finanzas].[vwCuentas] as
	select 
		c.IDCuenta
		,c.IDCliente
		,cli.Cliente
		,cli.[Estatus Cliente]
		,c.NumeroCuenta as [Numero Cuenta]
		,c.Saldo
		,c.IDEstatusCuenta
		,ec.Nombre as [Estatus Cuenta]
	from [Finanzas].[tblCuentas] c
		join [Clientes].[vwListadoClientes] cli on cli.IDCliente = c.IDCliente
		join [Catalogos].[tblEstatusCuentas] ec on ec.IDEstatusCuenta = c.IDEstatusCuenta
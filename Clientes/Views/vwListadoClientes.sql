
create    view [Clientes].[vwListadoClientes] as

/*
	@ID_ESTATUS_CLIENTE_ACTIVO int = 1
	@ID_ESTATUS_CUENTA_ACTIVA int = 1
	@ID_ESTATUS_TARJETA_ACTIVA int = 1
*/
	select 
		 c.IDCliente
		,c.Nombre
		,c.SegundoNombre
		,c.ApellidoPaterno
		,c.ApellidoMaterno
		,c.NombreCompleto as Cliente
		,c.RFC
		,c.IDEstatusCliente
		,ec.Nombre as [Estatus Cliente]
		,c.FechaNacimiento
		,CONVERT (int, DATEDIFF(DAY,isnull(c.FechaNacimiento,'1900-01-01'),getdate()) / 365.25 ) AS Edad
		,c.FechaHoraRegistro
		,c.IDUsuarioCreador
		,PhotoUrl
		,(select count(td.IDTarjetaDebito) 
			from [Finanzas].[tblTarjetasDebito] td
				join [Finanzas].[tblCuentas] ccc on ccc.IDCuenta = td.IDCuenta
			where ccc.IDCliente = c.IDCliente
		) as TDebitoActivas
		,(select count(tc.IDTarjetaCredito)
			from [Finanzas].[tblTarjetasCredito] tc
			where tc.IDCliente = c.IDCliente
		) as TCreditoActivas
		,(select count(cu.IDCuenta)
			from [Finanzas].[tblCuentas] cu
			where cu.IDCliente = c.IDCliente
		) as TCuentasActivas
	from [Clientes].[tblClientes] c
		join [Catalogos].[tblEstatusClientes] ec on ec.IDEstatusCliente = c.IDEstatusCliente
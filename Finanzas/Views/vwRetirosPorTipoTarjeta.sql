--create table [Catalogos].[tblTiposTarjetas](
--	IDTipoTarjeta int not null constraint Pk_CatalogosTblTiposTarjetas_IDTarjeta primary key,
--	Nombre varchar(20) not null
----)


--select * from [Finanzas].[vwRetirosPorTipoTarjeta] 
--GO

create   view [Finanzas].[vwRetirosPorTipoTarjeta] as
	select 
		c.IDCliente
		,1 AS IDTipoTarjeta
		,m.IDMovimiento
		,m.IDTarjetaDebito as IDTarjeta
		,t.NumeroTarjeta
		,m.Cargo
		,m.SaldoActual
		,m.FechaHoraRegistro
	from [Finanzas].[tblMovimientos] m
		join [Finanzas].[tblTarjetasDebito] t on t.IDTarjetaDebito = m.IDTarjetaDebito
		join [Finanzas].[tblCuentas] c on c.IDCuenta = t.IDCuenta
	where m.IDCuenta is not null and m.IDTarjetaDebito is not null and isnull(m.Cargo, 0) > 0
	UNION ALL
	select 
		t.IDCliente
		,2 AS IDTipoTarjeta
		,m.IDMovimiento
		,m.IDTarjetaCredito as IDTarjeta
		,t.NumeroTarjeta
		,m.Cargo
		,m.SaldoActual
		,m.FechaHoraRegistro
	from [Finanzas].[tblMovimientos] m
		join [Finanzas].[tblTarjetasCredito] t on t.IDTarjetaCredito = m.IDTarjetaCredito
	where m.IDTarjetaCredito is not null and isnull(m.Cargo, 0) > 0
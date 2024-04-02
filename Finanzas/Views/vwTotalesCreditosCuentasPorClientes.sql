
create view [Finanzas].[vwTotalesCreditosCuentasPorClientes] as

--declare 
--	@ID_ESTATUS_CLIENTE_ACTIVO int = 1,
--	@ID_ESTATUS_CUENTA_ACTIVA int = 1,
--	@ID_ESTATUS_TARJETA_ACTIVA int = 1
--;


select 
	c.IDCliente,
	sum(tc.Credito) as TotalCredito,
	sum(cu.Saldo) as TotalCuentas
from [Clientes].tblClientes c
	join [Finanzas].[tblTarjetasCredito] tc on tc.IDCliente = c.IDCliente and tc.IDEstatusTarjeta = 1
	join [Finanzas].[tblCuentas] cu on c.IDCliente = cu.IDCliente and cu.IDEstatusCuenta = 1
where c.IDEstatusCliente = 1
group by c.IDCliente
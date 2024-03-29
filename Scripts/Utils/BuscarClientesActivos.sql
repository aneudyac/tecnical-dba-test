
select *
from [Finanzas].[tblCuentas] c
	join [Clientes].[tblClientes] cli on cli.IDCliente = c.IDCliente
	join [Finanzas].[tblTarjetasDebito] tb on tb.IDCuenta = c.IDCuenta
	join [Catalogos].[tblEstatusCuentas] ec on ec.IDEstatusCuenta = c.IDEstatusCuenta
where c.IDEstatusCuenta = 1 and tb.IDEstatusTarjeta = 1 and  cli.IDEstatusCliente = 1
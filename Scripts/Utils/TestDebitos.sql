-- DÉBITO
declare 
	@IDCliente			int = 17,
	@IDCuenta			int = 17,
	@IDTarjetaDebito	int = 17
;


--select * from [Catalogos].[tblEstatusTarjetas]

select * 
from [Clientes].[tblClientes] c
	join [Catalogos].[tblEstatusClientes] ec on ec.IDEstatusCliente = c.IDEstatusCliente
where c.IDCliente = @IDCliente

select *
from [Finanzas].[tblTarjetasDebito]
where IDTarjetaDebito = @IDTarjetaDebito  
	--and IDEstatusTarjeta = 1

select *
from [Finanzas].[tblCuentas] c
	join [Finanzas].[tblTarjetasDebito] tb on tb.IDCuenta = c.IDCuenta
	join [Catalogos].[tblEstatusCuentas] ec on ec.IDEstatusCuenta = c.IDEstatusCuenta
where c.IDCliente = @IDCliente


exec [Finanzas].[spIRetiroDebito]
	@IDTarjetaDebito=@IDTarjetaDebito,
	@Monto = 2404.05

select *
from [Finanzas].[tblCuentas] c
	join [Finanzas].[tblTarjetasDebito] tb on tb.IDCuenta = c.IDCuenta
	join [Catalogos].[tblEstatusCuentas] ec on ec.IDEstatusCuenta = c.IDEstatusCuenta
where c.IDCliente = @IDCliente

select *
from [Finanzas].[tblMovimientos]
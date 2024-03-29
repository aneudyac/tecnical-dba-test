-- CRÉDITO
declare 
	@IDCliente int = 2,
	@IDTarjetaCredito int = 2
;


--select * from [Catalogos].[tblEstatusTarjetas]

select * from [Clientes].[tblClientes] where IDCliente = @IDCliente

select *
from [Finanzas].[tblTarjetasCredito]
where IDTarjetaCredito = @IDTarjetaCredito  
	--and IDEstatusTarjeta = 1

exec [Finanzas].[spIRetiroCredito]
	@IDTarjetaCredito=@IDTarjetaCredito,
	@Monto = 4000.00

select *
from [Finanzas].[tblTarjetasCredito]
where IDTarjetaCredito = @IDTarjetaCredito  

select *
from [Finanzas].[tblMovimientos]
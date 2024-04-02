delete [Finanzas].[tblMovimientos]
delete [Finanzas].[tblTarjetasCredito]
delete [Finanzas].[tblTarjetasDebito]
delete [Finanzas].[tblCuentas]
delete [Clientes].[tblClientes]


DBCC CHECKIDENT ('[Finanzas].[tblMovimientos]', RESEED, 0);
DBCC CHECKIDENT ('[Finanzas].[tblTarjetasCredito]', RESEED, 0);
DBCC CHECKIDENT ('[Finanzas].[tblTarjetasDebito]', RESEED, 0);
DBCC CHECKIDENT ('[Finanzas].[tblCuentas]', RESEED, 0);
DBCC CHECKIDENT ('[Clientes].[tblClientes]', RESEED, 0);
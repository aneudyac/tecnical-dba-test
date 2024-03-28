CREATE TABLE [Finanzas].[tblCuentas] (
    [IDCuenta]        INT             IDENTITY (1, 1) NOT NULL,
    [IDCliente]       INT             NOT NULL,
    [NumeroCuenta]    VARCHAR (18)    NOT NULL,
    [Saldo]           DECIMAL (18, 2) CONSTRAINT [D_FinanzasTblCuentas_Saldo] DEFAULT ((0.00)) NOT NULL,
    [IDEstatusCuenta] INT             NOT NULL,
    CONSTRAINT [Pk_FinanzasTblCuentas_IDCuenta] PRIMARY KEY CLUSTERED ([IDCuenta] ASC),
    CONSTRAINT [Fk_FinanzasTblCuentas_CatalogosTblEstatusCuentas_IDEstatusCuenta] FOREIGN KEY ([IDEstatusCuenta]) REFERENCES [Catalogos].[tblEstatusCuentas] ([IDEstatusCuenta]),
    CONSTRAINT [Fk_FinanzasTblCuentas_ClientesTblClientes_IDCliente] FOREIGN KEY ([IDCliente]) REFERENCES [Clientes].[tblClientes] ([IDCliente])
);


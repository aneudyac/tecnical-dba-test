CREATE TABLE [Finanzas].[tblMovientos] (
    [IDMoviento]        INT             IDENTITY (1, 1) NOT NULL,
    [IDCuenta]          INT             NULL,
    [IDTarjetaDebito]   INT             NULL,
    [IDTarjetaCredito]  INT             NULL,
    [Cargo]             DECIMAL (18, 2) CONSTRAINT [D_FinanzasTblMovientos_Cargo] DEFAULT ((0.00)) NOT NULL,
    [Abono]             DECIMAL (18, 2) CONSTRAINT [D_FinanzasTblMovientos_Abono] DEFAULT ((0.00)) NOT NULL,
    [SaldoActual]       DECIMAL (18, 2) CONSTRAINT [D_FinanzasTblMovientos_SaldoActual] DEFAULT ((0.00)) NOT NULL,
    [FechaHoraRegistro] DATETIME        CONSTRAINT [D_FinanzasTblMovimientos_FechaHoraRegistro] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [Pk_FinanzasTblMovientos_IDMoviento] PRIMARY KEY CLUSTERED ([IDMoviento] ASC),
    CONSTRAINT [Fk_FinanzasTblMovientos_FinanzasTblTarjetasCredito_IDTarjetaCredito] FOREIGN KEY ([IDTarjetaCredito]) REFERENCES [Finanzas].[tblTarjetasCredito] ([IDTarjetaCredito]),
    CONSTRAINT [Fk_FinanzasTblMovientos_FinanzasTblCuentas_IDCuenta] FOREIGN KEY ([IDCuenta]) REFERENCES [Finanzas].[tblCuentas] ([IDCuenta]),
    CONSTRAINT [Fk_FinanzasTblMovientos_FinanzasTblTarjetasDebito_IDTarjetaDebito] FOREIGN KEY ([IDTarjetaDebito]) REFERENCES [Finanzas].[tblTarjetasDebito] ([IDTarjetaDebito])
);


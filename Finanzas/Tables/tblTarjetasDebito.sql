CREATE TABLE [Finanzas].[tblTarjetasDebito] (
    [IDTarjetaDebito]   INT          IDENTITY (1, 1) NOT NULL,
    [IDCuenta]          INT          NOT NULL,
    [NumeroTarjeta]     VARCHAR (16) NOT NULL,
    [IDEstatusTarjeta]  INT          NOT NULL,
    [FechaHoraRegistro] DATETIME     CONSTRAINT [D_FinanzasTblTarjetasDebito_FechaHoraRegistro] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [Pk_FinanzasTblTarjetasDebito_IDTarjetaDebito] PRIMARY KEY CLUSTERED ([IDTarjetaDebito] ASC),
    CONSTRAINT [Fk_FinanzasTblTarjetasDebito_CatalogosTblEstatusTarjetas_IDEstatusTarjeta] FOREIGN KEY ([IDEstatusTarjeta]) REFERENCES [Catalogos].[tblEstatusTarjetas] ([IDEstatusTarjeta]),
    CONSTRAINT [Fk_FinanzasTblTarjetasDebito_FinanzasTblCuentas_IDCuenta] FOREIGN KEY ([IDCuenta]) REFERENCES [Finanzas].[tblCuentas] ([IDCuenta])
);


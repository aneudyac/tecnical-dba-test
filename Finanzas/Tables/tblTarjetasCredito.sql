﻿CREATE TABLE [Finanzas].[tblTarjetasCredito] (
    [IDTarjetaCredito]  INT             IDENTITY (1, 1) NOT NULL,
    [IDCliente]         INT             NOT NULL,
    [NumeroTarjeta]     VARCHAR (16)    NOT NULL,
    [LimiteCredito]     DECIMAL (18, 2) CONSTRAINT [D_FinanzasTblTarjetasCredito_LimiteCredito] DEFAULT ((0.00)) NOT NULL,
    [DiaDeCorte]        INT             NOT NULL,
    [IDEstatusTarjeta]  INT             NOT NULL,
    [FechaHoraRegistro] DATETIME        CONSTRAINT [D_FinanzasTblTarjetasCredito_FechaHoraRegistro] DEFAULT (getdate()) NOT NULL,
    [Credito]           DECIMAL (18, 2) NULL,
    CONSTRAINT [Pk_FinanzasTblTarjetasCredito_IDTarjetaCredito] PRIMARY KEY CLUSTERED ([IDTarjetaCredito] ASC),
    CONSTRAINT [Fk_FinanzasTblTarjetasCredito_CatalogosTblEstatusTarjetas_IDEstatusTarjeta] FOREIGN KEY ([IDEstatusTarjeta]) REFERENCES [Catalogos].[tblEstatusTarjetas] ([IDEstatusTarjeta]),
    CONSTRAINT [Fk_FinanzasTblTarjetasCredito_ClientesTblClientes_IDCliente] FOREIGN KEY ([IDCliente]) REFERENCES [Clientes].[tblClientes] ([IDCliente])
);




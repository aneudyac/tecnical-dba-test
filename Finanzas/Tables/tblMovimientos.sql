CREATE TABLE [Finanzas].[tblMovimientos] (
    [IDMovimiento]      INT             IDENTITY (1, 1) NOT NULL,
    [IDCuenta]          INT             NULL,
    [IDTarjetaDebito]   INT             NULL,
    [IDTarjetaCredito]  INT             NULL,
    [Cargo]             DECIMAL (18, 2) CONSTRAINT [D_FinanzasTbMovimientos_Cargo] DEFAULT ((0.00)) NOT NULL,
    [Abono]             DECIMAL (18, 2) CONSTRAINT [D_FinanzasTbMovimientos_Abono] DEFAULT ((0.00)) NOT NULL,
    [SaldoActual]       DECIMAL (18, 2) CONSTRAINT [D_FinanzasTbMovimientos_SaldoActual] DEFAULT ((0.00)) NOT NULL,
    [FechaHoraRegistro] DATETIME        CONSTRAINT [D_FinanzasTblMovimientos_FechaHoraRegistro] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [Pk_FinanzasTblMovimientos_IDMovimiento] PRIMARY KEY CLUSTERED ([IDMovimiento] ASC),
    CONSTRAINT [Fk_FinanzasTblMovimientos_FinanzasTblCuentas_IDCuenta] FOREIGN KEY ([IDCuenta]) REFERENCES [Finanzas].[tblCuentas] ([IDCuenta]),
    CONSTRAINT [Fk_FinanzasTblMovimientos_FinanzasTblTarjetasCredito_IDTarjetaCredito] FOREIGN KEY ([IDTarjetaCredito]) REFERENCES [Finanzas].[tblTarjetasCredito] ([IDTarjetaCredito]),
    CONSTRAINT [Fk_FinanzasTblMovimientos_FinanzasTblTarjetasDebito_IDTarjetaDebito] FOREIGN KEY ([IDTarjetaDebito]) REFERENCES [Finanzas].[tblTarjetasDebito] ([IDTarjetaDebito])
);




GO
CREATE TRIGGER Finanzas.trActualizarCuentaMonto
ON Finanzas.tblMovimientos
AFTER INSERT
AS
BEGIN
    DECLARE 
		@IDCuenta INT, 
		@IDTarjetaDebito INT, 
		@Cargo DECIMAL(18, 2),
		@IDCliente INT
	;

    SELECT 
		@IDCuenta = IDCuenta, 
		@IDTarjetaDebito = IDTarjetaDebito, 
		@Cargo = Cargo
    FROM inserted;

    IF @IDCuenta IS NOT NULL AND @IDTarjetaDebito IS NOT NULL AND @Cargo > 0
    BEGIN
        UPDATE [Finanzas].[tblCuentas]
			SET Saldo = Saldo - @Cargo
        WHERE IDCuenta = @IDCuenta;
    END;

    -- Ejecutar procedimiento almacenado para validar estatus del cliente
    SELECT @IDCliente = IDCliente
    FROM [Finanzas].tblCuentas
    WHERE IDCuenta = @IDCuenta;

    IF @IDCliente IS NOT NULL
    BEGIN
        EXEC [Clientes].[spValidarEstatusCliente] @IDCliente = @IDCliente;
    END;
END;
GO

CREATE TRIGGER Finanzas.trActualizarCreditoTarjeta
ON Finanzas.tblMovimientos
AFTER INSERT
AS
BEGIN
    DECLARE 
		@IDTarjetaCredito INT, 
		@IDCliente INT,
		@Abono DECIMAL(18, 2)
	;

    SELECT 
		@IDTarjetaCredito = IDTarjetaCredito, 
		@Abono = Abono
    FROM inserted;

    IF @IDTarjetaCredito IS NOT NULL AND @Abono > 0
    BEGIN
        UPDATE Finanzas.tblTarjetasCredito
			SET Credito = Credito + @Abono
        WHERE IDTarjetaCredito = @IDTarjetaCredito;
    END;

    -- Ejecutar procedimiento almacenado para validar estatus del cliente
    SELECT @IDCliente = IDCliente
    FROM [Finanzas].tblTarjetasCredito
    WHERE IDTarjetaCredito = @IDTarjetaCredito;

    IF @IDCliente IS NOT NULL
    BEGIN
        EXEC [Clientes].[spValidarEstatusCliente] @IDCliente = @IDCliente;
    END;
END;
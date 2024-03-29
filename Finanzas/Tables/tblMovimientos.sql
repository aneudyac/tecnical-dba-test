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
		@IDMovimiento INT, 
        @Saldo DECIMAL(18, 2),
		@IDCuenta INT, 
		@IDTarjetaDebito INT, 
		@Cargo DECIMAL(18, 2),
		@Abono DECIMAL(18, 2),
		@IDCliente INT
	;

    SELECT 
        @IDMovimiento = IDMovimiento,
		@IDCuenta = IDCuenta, 
		@IDTarjetaDebito = IDTarjetaDebito, 
		@Cargo = Cargo,
		@Abono = Abono
    FROM inserted;

    IF @IDCuenta IS NOT NULL AND @IDTarjetaDebito IS NOT NULL
    BEGIN
        IF (@Cargo > 0)
        BEGIN
            SELECT @Saldo  = Saldo - @Cargo
            FROM [Finanzas].[tblCuentas]
            WHERE IDCuenta = @IDCuenta;
        END

        IF (@Abono > 0)
        BEGIN
            SELECT @Saldo  = Saldo + @Abono
            FROM [Finanzas].[tblCuentas]
            WHERE IDCuenta = @IDCuenta;
        END

        UPDATE [Finanzas].[tblCuentas]
			SET Saldo = @Saldo
        WHERE IDCuenta = @IDCuenta;

        UPDATE [Finanzas].[tblMovimientos]
			SET SaldoActual = @Saldo
        WHERE IDMovimiento = @IDMovimiento
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
        @IDMovimiento INT, 
        @Credito DECIMAL(18, 2),
		@IDTarjetaCredito INT, 
		@IDCliente INT,
		@Cargo DECIMAL(18, 2),
        @Abono DECIMAL(18, 2)
	;

    SELECT 
        @IDMovimiento = IDMovimiento,
		@IDTarjetaCredito = IDTarjetaCredito, 
		@Cargo = Cargo,
		@Abono = Abono
    FROM inserted;

    IF @IDTarjetaCredito IS NOT NULL
    BEGIN
        IF (@Cargo > 0)
        BEGIN
            SELECT @Credito = Credito + @Cargo
            FROM Finanzas.tblTarjetasCredito
            WHERE IDTarjetaCredito = @IDTarjetaCredito;
        END

        IF (@Abono > 0)
        BEGIN
            SELECT @Credito = Credito - @Abono
            FROM Finanzas.tblTarjetasCredito
            WHERE IDTarjetaCredito = @IDTarjetaCredito;
        END

        UPDATE Finanzas.tblTarjetasCredito
			SET Credito = @Credito
        WHERE IDTarjetaCredito = @IDTarjetaCredito;

        UPDATE [Finanzas].[tblMovimientos]
			SET SaldoActual = @Credito
        WHERE IDMovimiento = @IDMovimiento
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
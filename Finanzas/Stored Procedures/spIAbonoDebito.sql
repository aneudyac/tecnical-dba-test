CREATE   PROCEDURE [Finanzas].[spIAbonoDebito](
    @IDTarjetaDebito INT,
    @Monto DECIMAL(18,2)
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @ESTATUS_TARJETA_BLOQUEADA INT = 3,
        @IDEstatusActualTarjeta INT,
        @IDCliente INT,
        @IDCuenta INT,
        @Saldo DECIMAL(18,2);

    -- Obtener el IDCliente, IDCuenta y Saldo de la tarjeta de débito
    SELECT 
        @IDCliente = c.IDCliente,
        @IDCuenta = c.IDCuenta,
        @Saldo = c.Saldo,
        @IDEstatusActualTarjeta = td.IDEstatusTarjeta
    FROM [Finanzas].[tblTarjetasDebito] td
    INNER JOIN [Finanzas].[tblCuentas] c ON c.IDCuenta = td.IDCuenta
    WHERE td.IDTarjetaDebito = @IDTarjetaDebito;

    -- Verificar si la tarjeta está bloqueada
    IF (@IDEstatusActualTarjeta = @ESTATUS_TARJETA_BLOQUEADA)
    BEGIN
        RAISERROR('La tarjeta está bloqueada.', 16, 1);
        RETURN;
    END;

    -- Realizar el abono en la cuenta
    BEGIN TRY
        BEGIN TRANSACTION;
        
        UPDATE [Finanzas].[tblCuentas]
			SET Saldo = Saldo + @Monto
        WHERE IDCuenta = @IDCuenta;

        INSERT INTO [Finanzas].[tblMovimientos] (IDCuenta, IDTarjetaDebito, Abono)
        VALUES (@IDCuenta, @IDTarjetaDebito, @Monto);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        -- Manejar el error adecuadamente
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
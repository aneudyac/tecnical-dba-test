/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

:r .\Catalogos\EstatusClientes.sql
:r .\Catalogos\EstatusCuentas.sql
:r .\Catalogos\EstatusTarjetas.sql

BEGIN -- SEEDS
    :r .\Seeds\Usuarios.sql
    :r .\Seeds\Clientes.sql
    :r .\Seeds\CuentasDebitosCreditos.sql
END
BEGIN /* Inserts [Catalogos].[tblEstatusCuentas] */
	BEGIN TRY
		BEGIN TRAN TransEstatusCuentas
			if object_id('tempdb..#TempCatEstatusCuentas') is not null
				drop table #TempCatEstatusCuentas

			create table #TempCatEstatusCuentas(
				IDEstatusTarjeta int not null,
				Nombre varchar(50) COLLATE database_default not null
			)
			/*Agregar EstatusClientes en este segmento*/
			insert into #TempCatEstatusCuentas(IDEstatusTarjeta, Nombre)
			values(1,'ACTIVA')
			     ,(2,'INACTIVA')
			     ,(3,'BLOQUEADA')
			/*Agregar EstatusClientes en este segmento*/

			MERGE [Catalogos].[tblEstatusCuentas] AS TARGET
			USING #TempCatEstatusCuentas as SOURCE
			on TARGET.IDEstatusTarjeta = SOURCE.IDEstatusTarjeta
				WHEN MATCHED THEN
					update
					 set TARGET.Nombre = SOURCE.Nombre
			WHEN NOT MATCHED BY TARGET THEN
				INSERT(IDEstatusTarjeta, Nombre)
				values(SOURCE.IDEstatusTarjeta, SOURCE.Nombre)
			--WHEN NOT MATCHED BY SOURCE THEN
			--DELETE
			OUTPUT $action,
			INSERTED.*;
			SELECT @@ROWCOUNT;
		COMMIT TRAN TransEstatusCuentas
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN TransEstatusCuentas
		select ERROR_MESSAGE() as Error
	END CATCH
END;
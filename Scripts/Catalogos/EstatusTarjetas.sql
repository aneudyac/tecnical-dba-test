BEGIN /* Inserts [Catalogos].[tblEstatusTarjetas] */
	BEGIN TRY
		BEGIN TRAN TransEstatusTarjetas
			if object_id('tempdb..#TempCatEstatusTarjetas') is not null
				drop table #TempCatEstatusTarjetas

			create table #TempCatEstatusTarjetas(
				IDEstatusTarjeta int not null,
				Nombre varchar(50) COLLATE database_default not null
			)
			/*Agregar EstatusClientes en este segmento*/
			insert into #TempCatEstatusTarjetas(IDEstatusTarjeta, Nombre)
			values(1,'ACTIVA')
			     ,(2,'INACTIVA')
			     ,(3,'BLOQUEADA')
			/*Agregar EstatusClientes en este segmento*/

			MERGE [Catalogos].[tblEstatusTarjetas] AS TARGET
			USING #TempCatEstatusTarjetas as SOURCE
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
		COMMIT TRAN TransEstatusTarjetas
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN TransEstatusTarjetas
		select ERROR_MESSAGE() as Error
	END CATCH
END;
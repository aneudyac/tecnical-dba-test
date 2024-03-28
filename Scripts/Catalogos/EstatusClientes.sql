BEGIN /* Inserts [Catalogos].[tblEstatusClientes] */
	BEGIN TRY
		BEGIN TRAN TransEstatusClientes
			if object_id('tempdb..#TempCatEstatusClientes') is not null
				drop table #TempCatEstatusClientes

			create table #TempCatEstatusClientes(
				IDEstatusCliente int not null,
				Nombre varchar(50) COLLATE database_default not null
			)
			/*Agregar EstatusClientes en este segmento*/
			insert into #TempCatEstatusClientes(IDEstatusCliente, Nombre)
			values(1,'ACTIVO')
			     ,(2,'INACTIVO')
			     ,(3,'SUSPENDIDO')
			/*Agregar EstatusClientes en este segmento*/

			MERGE [Catalogos].[tblEstatusClientes] AS TARGET
			USING #TempCatEstatusClientes as SOURCE
			on TARGET.IDEstatusCliente = SOURCE.IDEstatusCliente
				WHEN MATCHED THEN
					update
					 set TARGET.Nombre = SOURCE.Nombre
			WHEN NOT MATCHED BY TARGET THEN
				INSERT(IDEstatusCliente, Nombre)
				values(SOURCE.IDEstatusCliente, SOURCE.Nombre)
			--WHEN NOT MATCHED BY SOURCE THEN
			--DELETE
			OUTPUT $action,
			INSERTED.*;
			SELECT @@ROWCOUNT;
		COMMIT TRAN TransEstatusClientes
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN TransEstatusClientes
		select ERROR_MESSAGE() as Error
	END CATCH
END;
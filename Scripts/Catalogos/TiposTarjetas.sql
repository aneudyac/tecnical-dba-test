BEGIN /* Inserts [Catalogos].[tblTiposTarjetas] */
	BEGIN TRY
		BEGIN TRAN TransTiposTarjetas
			if object_id('tempdb..#TempCatTiposTarjetas') is not null
				drop table #TempCatTiposTarjetas

			create table #TempCatTiposTarjetas(
				IDTipoTarjeta int not null,
				Nombre varchar(50) COLLATE database_default not null
			)
			/*Agregar Tipos en este segmento*/
			insert into #TempCatTiposTarjetas(IDTipoTarjeta, Nombre)
			values(1,'DÉBITO')
			     ,(2,'CRÉDITO')
			/*Agregar Tipos en este segmento*/

			MERGE [Catalogos].[tblTiposTarjetas] AS TARGET
			USING #TempCatTiposTarjetas as SOURCE
			on TARGET.IDTipoTarjeta = SOURCE.IDTipoTarjeta
				WHEN MATCHED THEN
					update
					 set TARGET.Nombre = SOURCE.Nombre
			WHEN NOT MATCHED BY TARGET THEN
				INSERT(IDTipoTarjeta, Nombre)
				values(SOURCE.IDTipoTarjeta, SOURCE.Nombre)
			--WHEN NOT MATCHED BY SOURCE THEN
			--DELETE
			OUTPUT $action,
			INSERTED.*;
			SELECT @@ROWCOUNT;
		COMMIT TRAN TransTiposTarjetas
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN TransTiposTarjetas
		select ERROR_MESSAGE() as Error
	END CATCH
END;
CREATE TABLE [Catalogos].[tblEstatusCuentas] (
    [IDEstatusCuenta] INT          NOT NULL,
    [Nombre]          VARCHAR (50) NOT NULL,
    CONSTRAINT [Pk_CatalogosTblEstatusCuentas_IDEstatusCuenta] PRIMARY KEY CLUSTERED ([IDEstatusCuenta] ASC)
);


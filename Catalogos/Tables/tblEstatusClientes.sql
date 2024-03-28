CREATE TABLE [Catalogos].[tblEstatusClientes] (
    [IDEstatusCliente] INT          NOT NULL,
    [Nombre]           VARCHAR (50) NOT NULL,
    CONSTRAINT [Pk_CatalogosTblEstatusClientes_IDEstatusCliente] PRIMARY KEY CLUSTERED ([IDEstatusCliente] ASC)
);


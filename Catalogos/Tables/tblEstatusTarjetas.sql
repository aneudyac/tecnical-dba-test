CREATE TABLE [Catalogos].[tblEstatusTarjetas] (
    [IDEstatusTarjeta] INT          NOT NULL,
    [Nombre]           VARCHAR (50) NOT NULL,
    CONSTRAINT [Pk_CatalogosTblEstatusTarjetas_IDEstatusTarjeta] PRIMARY KEY CLUSTERED ([IDEstatusTarjeta] ASC)
);


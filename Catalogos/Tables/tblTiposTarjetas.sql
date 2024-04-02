CREATE TABLE [Catalogos].[tblTiposTarjetas] (
    [IDTipoTarjeta] INT          NOT NULL,
    [Nombre]        VARCHAR (20) NOT NULL,
    CONSTRAINT [Pk_CatalogosTblTiposTarjetas_IDTarjeta] PRIMARY KEY CLUSTERED ([IDTipoTarjeta] ASC)
);


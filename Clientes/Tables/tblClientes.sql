CREATE TABLE [Clientes].[tblClientes] (
    [IDCliente]         INT           IDENTITY (1, 1) NOT NULL,
    [Nombre]            VARCHAR (100) NOT NULL,
    [SegundoNombre]     VARCHAR (100) NULL,
    [ApellidoPaterno]   VARCHAR (100) NULL,
    [ApellidoMaterno]   VARCHAR (100) NULL,
    [NombreCompleto]    AS            ((((((coalesce([Nombre],'')+' ')+coalesce([SegundoNombre],''))+' ')+coalesce([ApellidoPaterno],''))+' ')+coalesce([ApellidoMaterno],'')),
    [RFC]               VARCHAR (13)  NOT NULL,
    [IDEstatusCliente]  INT           NOT NULL,
    [FechaNacimiento]   DATE          NOT NULL,
    [FechaHoraRegistro] DATETIME      CONSTRAINT [D_ClientesTblClientes_FechaHoraRegistro] DEFAULT (getdate()) NOT NULL,
    [IDUsuarioCreador]  INT           NOT NULL,
    CONSTRAINT [Pk_ClientesTblClientes_IDCliente] PRIMARY KEY CLUSTERED ([IDCliente] ASC),
    CONSTRAINT [Fk_ClientesTblClientes_CatalogosTblEstatusClientes_IDEstatusCliente] FOREIGN KEY ([IDEstatusCliente]) REFERENCES [Catalogos].[tblEstatusClientes] ([IDEstatusCliente]),
    CONSTRAINT [Fk_ClientesTblClientes_SeguridadTblUsuarioss_IDUsuarioCreador] FOREIGN KEY ([IDUsuarioCreador]) REFERENCES [Seguridad].[tblUsuarios] ([IDUsuario])
);


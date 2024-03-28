CREATE TABLE [Seguridad].[tblUsuarios] (
    [IDUsuario]         INT           IDENTITY (1, 1) NOT NULL,
    [Nombre]            VARCHAR (100) NOT NULL,
    [SegundoNombre]     VARCHAR (100) NULL,
    [ApellidoPaterno]   VARCHAR (100) NULL,
    [ApellidoMaterno]   VARCHAR (100) NULL,
    [NombreCompleto]    AS            ((((((coalesce([Nombre],'')+' ')+coalesce([SegundoNombre],''))+' ')+coalesce([ApellidoPaterno],''))+' ')+coalesce([ApellidoMaterno],'')),
    [Email]             VARCHAR (225) NOT NULL,
    [Password]          VARCHAR (500) NOT NULL,
    [Activo]            BIT           CONSTRAINT [D_SeguridadTblUsuarios_Activo] DEFAULT ((0)) NOT NULL,
    [FechaHoraRegistro] DATETIME      CONSTRAINT [D_SeguridadTblUsuarios_FechaHoraRegistro] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [Pk_SeguridadTblUsuarios_IDUsuario] PRIMARY KEY CLUSTERED ([IDUsuario] ASC),
    CONSTRAINT [Chk_SeguridadTblUsuarios_Email] CHECK ([Email] like '%_@__%.__%')
);


﻿
if not exists(select top 1 1 from [Clientes].[tblClientes])
begin
	declare
		@IDUsuarioCreadorCliente int,
        @IDCliente int
	;

	select top 1 @IDUsuarioCreadorCliente=IDUsuario from [Seguridad].[tblUsuarios] where Activo = 1
	
    INSERT INTO Clientes.tblClientes (Nombre, SegundoNombre, ApellidoPaterno, ApellidoMaterno, RFC, IDEstatusCliente, FechaNacimiento, Sexo, IDUsuarioCreador)
    VALUES 
        ('Juan',        'Carlos',       'Gómez',        'Hernández',    'GOHJ890123ABC', 1, '1980-05-15', 'M', @IDUsuarioCreadorCliente),
        ('María',       'Isabel',       'Martínez',     'López',        'MIML900512DEF', 1, '1990-12-25', 'F', @IDUsuarioCreadorCliente),
        ('Pedro',       'Pablo',        'Rodríguez',    'García',       'PRGG880726GHI', 1, '1988-07-26', 'M', @IDUsuarioCreadorCliente),
        ('Ana',         'Luisa',        'Sánchez',      'Pérez',        'ALSP950318JKL', 1, '1995-03-18', 'F', @IDUsuarioCreadorCliente),
        ('José',        'Antonio',      'Fernández',    'González',     'JAFG910719MNO', 1, '1991-07-19', 'M', @IDUsuarioCreadorCliente),
        ('Laura',       'Elena',        'Díaz',         'Ruíz',         'LEDR840603PQR', 1, '1984-06-03', 'F', @IDUsuarioCreadorCliente),
        ('Francisco',   'Javier',       'Torres',       'Vázquez',      'FJTV930510STU', 1, '1993-05-10', 'M', @IDUsuarioCreadorCliente),
        ('Luis',        'Miguel',       'González',     'Martínez',     'LIGM881122XYZ', 1, '1988-11-22', 'M', @IDUsuarioCreadorCliente),
        ('Ana',         'María',        'García',       'Hernández',    'AMGH900101ABC', 1, '1990-01-01', 'F', @IDUsuarioCreadorCliente),
        ('María',       'Guadalupe',    'Martínez',     'López',        'MGML920509PQR', 1, '1992-05-09', 'F', @IDUsuarioCreadorCliente),
        ('Carlos',      'Alberto',      'Jiménez',      'Ramírez',      'CAJR891212XYZ', 1, '1989-12-12', 'M', @IDUsuarioCreadorCliente),
        ('Verónica',    'Patricia',     'Fernández',    'Gómez',        'VEFG930415ABC', 1, '1993-04-15', 'F', @IDUsuarioCreadorCliente),
        ('Fernando',    'Luis',         'Hernández',    'Pérez',        'FLHP910803DEF', 1, '1991-08-03', 'M', @IDUsuarioCreadorCliente),
        ('Diana',       'Laura',        'Martínez',     'Sánchez',      'DLMS900610GHI', 1, '1990-06-10', 'F', @IDUsuarioCreadorCliente),
        ('Roberto',     'Antonio',      'González',     'Ramírez',      'RAGR891218JKL', 1, '1989-12-18', 'M', @IDUsuarioCreadorCliente),
        ('Gabriela',    'Alejandra',    'Torres',       'Vargas',       'GATV930704MNO', 1, '1993-07-04', 'F', @IDUsuarioCreadorCliente),
        ('Daniel',      'Alejandro',    'Ruíz',         'Sánchez',      'DARS900421PQR', 1, '1990-04-21', 'M', @IDUsuarioCreadorCliente),
        ('Sofía',       'Fernanda',     'Sosa',         'López',        'SFSL921003STU', 1, '1992-10-03', 'F', @IDUsuarioCreadorCliente),
        ('Miguel',      'Ángel',        'Gómez',        'Hernández',    'MAGH900528ABC', 1, '1990-05-28', 'M', @IDUsuarioCreadorCliente),
        ('Ana',         'Karen',        'López',        'Torres',       'AKLT921208DEF', 1, '1992-12-08', 'F', @IDUsuarioCreadorCliente),
        ('Eduardo',     'Arturo',       'Martínez',     'García',       'EAMG910502GHI', 1, '1991-05-02', 'M', @IDUsuarioCreadorCliente),
        ('Luis',        'Fernando',     'González',     'Hernández',    'LFGH900220JKL', 1, '1990-02-20', 'M', @IDUsuarioCreadorCliente),
        ('Carolina',    'Elizabeth',    'Hernández',    'Martínez',     'CEHM910705MNO', 1, '1991-07-05', 'F', @IDUsuarioCreadorCliente),
        ('Jesús',       'Manuel',       'Rodríguez',    'Gómez',        'JMRG880320PQR', 1, '1988-03-20', 'M', @IDUsuarioCreadorCliente),
        ('Paula',       'Gabriela',     'Torres',       'López',        'PGTL920623STU', 1, '1992-06-23', 'F', @IDUsuarioCreadorCliente),
        ('Alejandro',   'Fernando',     'Hernández',    'García',       'AFHG911024ABC', 1, '1991-10-24', 'M', @IDUsuarioCreadorCliente),
        ('Ana',         'Victoria',     'Martínez',     'Sánchez',      'AVMS930615DEF', 1, '1993-06-15', 'F', @IDUsuarioCreadorCliente),
        ('Francisco',   'Javier',       'Gómez',        'Torres',       'FJGT920418MNO', 1, '1992-04-18', 'M', @IDUsuarioCreadorCliente),
        ('Valeria',     'Fernanda',     'Sosa',         'Hernández',    'VFSH911201PQR', 1, '1991-12-01', 'F', @IDUsuarioCreadorCliente),
        ('David',       'Alejandro',    'Rodríguez',    'Martínez',     'DARM920311STU', 1, '1992-03-11', 'M', @IDUsuarioCreadorCliente),
        ('Fernanda',    'Paola',        'Gómez',        'López',        'FPGL920713ABC', 1, '1992-07-13', 'F', @IDUsuarioCreadorCliente),
        ('Gabriel',     'Alejandro',    'Torres',       'Hernández',    'GATH900418DEF', 1, '1990-04-18', 'M', @IDUsuarioCreadorCliente),
        ('Ana',         'Sofía',        'Sánchez',      'Martínez',     'ASSM940102MNO', 1, '1994-01-02', 'F', @IDUsuarioCreadorCliente),
        ('Javier',      'Antonio',      'López',        'Gómez',        'JALG890725PQR', 1, '1989-07-25', 'M', @IDUsuarioCreadorCliente),
        ('Daniela',     'Montserrat',   'Hernández',    'Torres',       'DMHT910620STU', 1, '1991-06-20', 'F', @IDUsuarioCreadorCliente),
        ('Alejandro',   'Gustavo',      'Martínez',     'Sánchez',      'AGMS911204ABC', 1, '1991-12-04', 'M', @IDUsuarioCreadorCliente),
        ('Andrea',      'Victoria',     'García',       'Hernández',    'AVGH920217DEF', 1, '1992-02-17', 'F', @IDUsuarioCreadorCliente),
        ('Roberto',     'Carlos',       'López',        'Gómez',        'RCLG930506MNO', 1, '1993-05-06', 'M', @IDUsuarioCreadorCliente),
        ('María',       'Fernanda',     'Sánchez',      'Martínez',     'MFMM911120PQR', 1, '1991-11-20', 'F', @IDUsuarioCreadorCliente),
        ('Jesús',       'Manuel',       'Torres',       'Hernández',    'JMTH900315STU', 1, '1990-03-15', 'M', @IDUsuarioCreadorCliente),
        ('Fernanda',    'Valentina',    'Gómez',        'López',        'FVGL920403ABC', 1, '1992-04-03', 'F', @IDUsuarioCreadorCliente),
        ('José',        'Luis',         'Martínez',     'Sánchez',      'JLMS891208DEF', 1, '1989-12-08', 'M', @IDUsuarioCreadorCliente),
        ('Mariana',     'Gabriela',     'Hernández',    'Torres',       'MGHT911010MNO', 1, '1991-10-10', 'F', @IDUsuarioCreadorCliente),
        ('Antonio',     'Fernando',     'López',        'Martínez',     'AFLM920519PQR', 1, '1992-05-19', 'M', @IDUsuarioCreadorCliente),
        ('Ana',         'Paulina',      'Sánchez',      'Gómez',        'APSG930315STU', 1, '1993-03-15', 'F', @IDUsuarioCreadorCliente),
        ('Rodrigo',     'Ismael',       'García',       'Hernández',    'RIGH920613ABC', 1, '1992-06-13', 'M', @IDUsuarioCreadorCliente),
        ('Carolina',    'Fernanda',     'Martínez',     'López',        'CFML910803DEF', 1, '1991-08-03', 'F', @IDUsuarioCreadorCliente),
        ('Luis',        'Ángel',        'Torres',       'Sánchez',      'LATS900411PQR', 1, '1990-04-11', 'M', @IDUsuarioCreadorCliente),
        ('Ana',         'Cecilia',      'Hernández',    'Gómez',        'ACHG920216STU', 1, '1992-02-16', 'F', @IDUsuarioCreadorCliente),
        ('Carlos',      'Manuel',       'Martínez',     'Hernández',    'CMMH890510ABC', 1, '1989-05-10', 'M', @IDUsuarioCreadorCliente),
	    ('Luis',        'Roberto',      'García',       'Hernández',    'LRGH891112ABC', 1, '1989-11-12', 'M', @IDUsuarioCreadorCliente),
        ('Elena',       'Gabriela',     'Martínez',     'Gómez',        'EGMG930625DEF', 1, '1993-06-25', 'F', @IDUsuarioCreadorCliente),
        ('Miguel',      'Ángel',        'López',        'Torres',       'MALT910204GHI', 1, '1991-02-04', 'M', @IDUsuarioCreadorCliente),
        ('Diana',       'Patricia',     'Hernández',    'Sánchez',      'DPHS890713JKL', 1, '1989-07-13', 'F', @IDUsuarioCreadorCliente),
        ('José',        'Ricardo',      'Gómez',        'Martínez',     'JRGH900625MNO', 1, '1990-06-25', 'M', @IDUsuarioCreadorCliente),
        ('Verónica',    'Guadalupe',    'Torres',       'Hernández',    'VGTH911212PQR', 1, '1991-12-12', 'F', @IDUsuarioCreadorCliente),
        ('Fernando',    'José',         'Sánchez',      'López',        'FJSL920101STU', 1, '1992-01-01', 'M', @IDUsuarioCreadorCliente),
        ('Gabriela',    'Victoria',     'Martínez',     'García',       'GVMG900412ABC', 1, '1990-04-12', 'F', @IDUsuarioCreadorCliente),
        ('Ricardo',     'Javier',       'López',        'Torres',       'RJLT910719DEF', 1, '1991-07-19', 'M', @IDUsuarioCreadorCliente),
        ('Valentina',   'Alejandra',    'Hernández',    'Martínez',     'VAHM930530GHI', 1, '1993-05-30', 'F', @IDUsuarioCreadorCliente),
        ('Carlos',      'Alberto',      'García',       'Sánchez',      'CAGS891216JKL', 1, '1989-12-16', 'M', @IDUsuarioCreadorCliente),
        ('Ana',         'Laura',        'Martínez',     'López',        'ALML910205MNO', 1, '1991-02-05', 'F', @IDUsuarioCreadorCliente),
        ('Luis',        'Fernando',     'Gómez',        'Hernández',    'LFGH880320PQR', 1, '1988-03-20', 'M', @IDUsuarioCreadorCliente),
        ('Verónica',    'Patricia',     'López',        'Torres',       'VPLT900930STU', 1, '1990-09-30', 'F', @IDUsuarioCreadorCliente),
        ('Fernando',    'Miguel',       'Martínez',     'García',       'FMGG891101ABC', 1, '1989-11-01', 'M', @IDUsuarioCreadorCliente),
        ('Karla',       'Elizabeth',    'Hernández',    'Sánchez',      'KEHS930412DEF', 1, '1993-04-12', 'F', @IDUsuarioCreadorCliente),
        ('Ricardo',     'Alberto',      'Gómez',        'López',        'RAGL920528GHI', 1, '1992-05-28', 'M', @IDUsuarioCreadorCliente),
        ('Verónica',    'Fernanda',     'López',        'Martínez',     'VFLM900609JKL', 1, '1990-06-09', 'F', @IDUsuarioCreadorCliente),
        ('Sergio',      'Antonio',      'García',       'Torres',       'SAGT880813MNO', 1, '1988-08-13', 'M', @IDUsuarioCreadorCliente),
        ('María',       'José',         'Martínez',     'Sánchez',      'MJMS900115PQR', 1, '1990-01-15', 'F', @IDUsuarioCreadorCliente),
        ('Roberto',     'Carlos',       'Gómez',        'Hernández',    'RCGH911230STU', 1, '1991-12-30', 'M', @IDUsuarioCreadorCliente),
        ('Gabriela',    'Isabel',       'Torres',       'López',        'GITL920703ABC', 1, '1992-07-03', 'F', @IDUsuarioCreadorCliente),
        ('Juan',        'Manuel',       'García',       'Martínez',     'JGGM890409DEF', 1, '1989-04-09', 'M', @IDUsuarioCreadorCliente),
        ('María',       'Fernanda',     'Hernández',    'Sánchez',      'MFHS930105GHI', 1, '1993-01-05', 'F', @IDUsuarioCreadorCliente),
        ('Antonio',     'José',         'López',        'Torres',       'AJLT890316JKL', 1, '1989-03-16', 'M', @IDUsuarioCreadorCliente),
        ('Valeria',     'Fernanda',     'Martínez',     'García',       'VFMG891126MNO', 1, '1989-11-26', 'F', @IDUsuarioCreadorCliente),
        ('Carlos',      'Alberto',      'Gómez',        'López',        'CAGL920904PQR', 1, '1992-09-04', 'M', @IDUsuarioCreadorCliente),
        ('Ana',         'Karen',        'Sánchez',      'Martínez',     'AKSM920314STU', 1, '1992-03-14', 'F', @IDUsuarioCreadorCliente),
        ('Juan',        'Manuel',       'García',       'Hernández',    'JMGH900928ABC', 1, '1990-09-28', 'M', @IDUsuarioCreadorCliente),
        ('Mariana',     'Alejandra',    'Martínez',     'López',        'MAML910109DEF', 1, '1991-01-09', 'F', @IDUsuarioCreadorCliente),
        ('Luis',        'Fernando',     'Torres',       'Sánchez',      'LFTS920520GHI', 1, '1992-05-20', 'M', @IDUsuarioCreadorCliente),
        ('Fernanda',    'Elizabeth',    'Gómez',        'Torres',       'FEGT930722JKL', 1, '1993-07-22', 'F', @IDUsuarioCreadorCliente),
        ('José',        'Carlos',       'Martínez',     'Hernández',    'JCMH900314MNO', 1, '1990-03-14', 'M', @IDUsuarioCreadorCliente),
        ('Laura',       'Patricia',     'López',        'García',       'LPLG880506PQR', 1, '1988-05-06', 'F', @IDUsuarioCreadorCliente),
        ('Javier',      'Fernando',     'Sánchez',      'Martínez',     'JFSM920202STU', 1, '1992-02-02', 'M', @IDUsuarioCreadorCliente),
        ('Mónica',      'Guadalupe',    'Gómez',        'López',        'MAGL910714ABC', 1, '1991-07-14', 'F', @IDUsuarioCreadorCliente),
        ('Carlos',      'Antonio',      'Martínez',     'Torres',       'CAMT900306DEF', 1, '1990-03-06', 'M', @IDUsuarioCreadorCliente),
        ('Fernanda',    'María',        'Sánchez',      'García',       'FMSG920516GHI', 1, '1992-05-16', 'F', @IDUsuarioCreadorCliente),
        ('Jorge',       'Eduardo',      'López',        'Martínez',     'JELM900727JKL', 1, '1990-07-27', 'M', @IDUsuarioCreadorCliente),
        ('Verónica',    'Karen',        'García',       'Hernández',    'VKGH891028MNO', 1, '1989-10-28', 'F', @IDUsuarioCreadorCliente),
        ('Alberto',     'Antonio',      'Martínez',     'Torres',       'AAMT910114PQR', 1, '1991-01-14', 'M', @IDUsuarioCreadorCliente),
        ('Fernanda',    'Elizabeth',    'Sánchez',      'López',        'FESL880221STU', 1, '1988-02-21', 'F', @IDUsuarioCreadorCliente),
        ('Carlos',      'Manuel',       'Martínez',     'García',       'CMMG900719ABC', 1, '1990-07-19', 'M', @IDUsuarioCreadorCliente),
        ('María',       'Fernanda',     'López',        'Sánchez',      'MFLS910603DEF', 1, '1991-06-03', 'F', @IDUsuarioCreadorCliente),
        ('José',        'Luis',         'Martínez',     'Hernández',    'JLMH900815GHI', 1, '1990-08-15', 'M', @IDUsuarioCreadorCliente),
        ('Ana',         'Cecilia',      'Sánchez',      'López',        'ACSL920224JKL', 1, '1992-02-24', 'F', @IDUsuarioCreadorCliente),
        ('Juan',        'Carlos',       'García',       'Martínez',     'JCGM910512MNO', 1, '1991-05-12', 'M', @IDUsuarioCreadorCliente),
        ('Laura',       'Valentina',    'Hernández',    'Gómez',        'LVHG920713PQR', 1, '1992-07-13', 'F', @IDUsuarioCreadorCliente),
        ('Javier',      'Antonio',      'López',        'Torres',       'JALT900821STU', 1, '1990-08-21', 'M', @IDUsuarioCreadorCliente),
        ('María',       'Fernanda',     'Martínez',     'Sánchez',      'MFMS910907ABC', 1, '1991-09-07', 'F', @IDUsuarioCreadorCliente),
        ('Rodrigo',     'Alejandro',    'Gómez',        'López',        'RAGL900123DEF', 1, '1990-01-23', 'M', @IDUsuarioCreadorCliente),
        ('Ana',         'Karina',       'López',        'García',       'AKLG930506GHI', 1, '1993-05-06', 'F', @IDUsuarioCreadorCliente),
        ('Carlos',      'Manuel',       'Martínez',     'Hernández',    'CMMH890417JKL', 1, '1989-04-17', 'M', @IDUsuarioCreadorCliente),
	    ('Rosa',        'María',        'García',       'Hernández',    'ROMG890411ABC', 1, '1989-04-11', 'F', @IDUsuarioCreadorCliente),
        ('Mario',       'Alfredo',      'Martínez',     'Gómez',        'MAMG931019DEF', 1, '1993-10-19', 'M', @IDUsuarioCreadorCliente),
        ('Verónica',    'Patricia',     'López',        'Torres',       'VPLT910627GHI', 1, '1991-06-27', 'F', @IDUsuarioCreadorCliente),
        ('Juan',        'Carlos',       'Hernández',    'Sánchez',      'JCHS900521JKL', 1, '1990-05-21', 'M', @IDUsuarioCreadorCliente),
        ('María',       'Fernanda',     'Martínez',     'López',        'MFML910705MNO', 1, '1991-07-05', 'F', @IDUsuarioCreadorCliente),
        ('Alejandro',   'José',         'García',       'Hernández',    'AJGH890924PQR', 1, '1989-09-24', 'M', @IDUsuarioCreadorCliente),
        ('Daniela',     'Fernanda',     'López',        'Torres',       'DFLT930102STU', 1, '1993-01-02', 'F', @IDUsuarioCreadorCliente),
        ('Carlos',      'Antonio',      'Martínez',     'Sánchez',      'CAMT900212ABC', 1, '1990-02-12', 'M', @IDUsuarioCreadorCliente),
        ('Laura',       'Patricia',     'Hernández',    'Gómez',        'LPHG880705DEF', 1, '1988-07-05', 'F', @IDUsuarioCreadorCliente),
        ('José',        'Manuel',       'López',        'Martínez',     'JMLM920304GHI', 1, '1992-03-04', 'M', @IDUsuarioCreadorCliente),
        ('María',       'Guadalupe',    'García',       'Torres',       'MGGT900920JKL', 1, '1990-09-20', 'F', @IDUsuarioCreadorCliente),
        ('Francisco',   'Javier',       'Martínez',     'Sánchez',      'FJMS890714MNO', 1, '1989-07-14', 'M', @IDUsuarioCreadorCliente),
        ('Laura',       'Verónica',     'López',        'García',       'LVLG880101PQR', 1, '1988-01-01', 'F', @IDUsuarioCreadorCliente),
        ('Luis',        'Fernando',     'Martínez',     'Hernández',    'LFMH910208STU', 1, '1991-02-08', 'M', @IDUsuarioCreadorCliente),
        ('Ana',         'Gabriela',     'García',       'López',        'AGGL930320ABC', 1, '1993-03-20', 'F', @IDUsuarioCreadorCliente),
        ('Juan',        'Carlos',       'Martínez',     'Torres',       'JCMT900502DEF', 1, '1990-05-02', 'M', @IDUsuarioCreadorCliente),
        ('Verónica',    'Elizabeth',    'López',        'Sánchez',      'VELS920117GHI', 1, '1992-01-17', 'F', @IDUsuarioCreadorCliente),
        ('Miguel',      'Ángel',        'García',       'Martínez',     'MAGM910730JKL', 1, '1991-07-30', 'M', @IDUsuarioCreadorCliente),
        ('María',       'Fernanda',     'López',        'Hernández',    'MFLH890324MNO', 1, '1989-03-24', 'F', @IDUsuarioCreadorCliente),
        ('Javier',      'Alejandro',    'Martínez',     'Gómez',        'JAMG930810PQR', 1, '1993-08-10', 'M', @IDUsuarioCreadorCliente),
        ('Lorena',      'María',        'García',       'López',        'LMGL900423STU', 1, '1990-04-23', 'F', @IDUsuarioCreadorCliente),
        ('Roberto',     'Carlos',       'López',        'Martínez',     'RCLM910128ABC', 1, '1991-01-28', 'M', @IDUsuarioCreadorCliente),
        ('Ana',         'Karen',        'García',       'Torres',       'AKGT880620DEF', 1, '1988-06-20', 'F', @IDUsuarioCreadorCliente),
        ('David',       'Antonio',      'Martínez',     'Sánchez',      'DAMS910211GHI', 1, '1991-02-11', 'M', @IDUsuarioCreadorCliente),
        ('Laura',       'Isabel',       'López',        'García',       'LILG880715JKL', 1, '1988-07-15', 'F', @IDUsuarioCreadorCliente),
        ('José',        'Manuel',       'García',       'Martínez',     'JMGM930420MNO', 1, '1993-04-20', 'M', @IDUsuarioCreadorCliente),
        ('Daniela',     'Fernanda',     'López',        'Hernández',    'DFLH890806PQR', 1, '1989-08-06', 'F', @IDUsuarioCreadorCliente),
        ('Miguel',      'Ángel',        'Martínez',     'Torres',       'MAMT910515STU', 1, '1991-05-15', 'M', @IDUsuarioCreadorCliente),
        ('Verónica',    'Patricia',     'García',       'Sánchez',      'VPGS900907ABC', 1, '1990-09-07', 'F', @IDUsuarioCreadorCliente),
        ('Javier',      'Antonio',      'López',        'Martínez',     'JALM920608DEF', 1, '1992-06-08', 'M', @IDUsuarioCreadorCliente),
        ('Ana',         'Laura',        'García',       'López',        'ALGL931031GHI', 1, '1993-10-31', 'F', @IDUsuarioCreadorCliente),
        ('Roberto',     'Carlos',       'Martínez',     'Torres',       'RCMT900914JKL', 1, '1990-09-14', 'M', @IDUsuarioCreadorCliente),
        ('Karen',       'Michelle',     'López',        'García',       'KMLG890726MNO', 1, '1989-07-26', 'F', @IDUsuarioCreadorCliente),
        ('David',       'Antonio',      'Martínez',     'Hernández',    'DAMH920301PQR', 1, '1992-03-01', 'M', @IDUsuarioCreadorCliente),
        ('Verónica',    'Isabel',       'García',       'Sánchez',      'VIGS910606STU', 1, '1991-06-06', 'F', @IDUsuarioCreadorCliente),
        ('Luis',        'Ángel',        'Martínez',     'López',        'LAML910517ABC', 1, '1991-05-17', 'M', @IDUsuarioCreadorCliente),
        ('Mariana',     'Fernanda',     'García',       'Martínez',     'MFGM930702DEF', 1, '1993-07-02', 'F', @IDUsuarioCreadorCliente),
        ('José',        'Manuel',       'López',        'Torres',       'JMLT900813GHI', 1, '1990-08-13', 'M', @IDUsuarioCreadorCliente),
        ('Ana',         'María',        'Martínez',     'García',       'AMMG910918JKL', 1, '1991-09-18', 'F', @IDUsuarioCreadorCliente),
        ('Jorge',       'Antonio',      'López',        'Sánchez',      'JALS920307MNO', 1, '1992-03-07', 'M', @IDUsuarioCreadorCliente),
        ('Verónica',    'Michelle',     'García',       'Martínez',     'VMGM900303PQR', 1, '1990-03-03', 'F', @IDUsuarioCreadorCliente),
        ('David',       'Eduardo',      'López',        'Hernández',    'DELH891204STU', 1, '1989-12-04', 'M', @IDUsuarioCreadorCliente),
        ('Mariana',     'Fernanda',     'Martínez',     'Sánchez',      'MFMS920627ABC', 1, '1992-06-27', 'F', @IDUsuarioCreadorCliente),
        ('Juan',        'Manuel',       'López',        'García',       'JMLG900610DEF', 1, '1990-06-10', 'M', @IDUsuarioCreadorCliente),
        ('Ana',         'Cecilia',      'Martínez',     'Hernández',    'ACMH930701GHI', 1, '1993-07-01', 'F', @IDUsuarioCreadorCliente),
        ('Jorge',       'Antonio',      'López',        'Sánchez',      'JALS920307MNO', 1, '1992-03-07', 'M', @IDUsuarioCreadorCliente),
        ('Verónica',    'Michelle',     'García',       'Martínez',     'VMGM900303PQR', 1, '1990-03-03', 'F', @IDUsuarioCreadorCliente),
        ('David',       'Eduardo',      'López',        'Hernández',    'DELH891204STU', 1, '1989-12-04', 'M', @IDUsuarioCreadorCliente),
        ('Mariana',     'Fernanda',     'Martínez',     'Sánchez',      'MFMS920627ABC', 1, '1992-06-27', 'F', @IDUsuarioCreadorCliente),
        ('Juan',        'Manuel',       'López',        'García',       'JMLG900610DEF', 1, '1990-06-10', 'M', @IDUsuarioCreadorCliente),
        ('Ana',         'Cecilia',      'Martínez',     'Hernández',    'ACMH930701GHI', 1, '1993-07-01', 'F', @IDUsuarioCreadorCliente),
	    ('Gabriela',    'Fernanda',		'González',     'Hernández',    'GFGH920531ABC', 1, '1992-05-31', 'F', @IDUsuarioCreadorCliente),
        ('Miguel',      'Ángel',		'Rodríguez',    'Martínez',     'MARM890214DEF', 1, '1989-02-14', 'M', @IDUsuarioCreadorCliente),
        ('Daniela',     'Isabel',		'Martínez',     'Gómez',        'DIMG900611GHI', 1, '1990-06-11', 'F', @IDUsuarioCreadorCliente),
        ('Fernando',    'Alejandro',	'Gómez',        'Sánchez',      'FAGS930405JKL', 1, '1993-04-05', 'M', @IDUsuarioCreadorCliente),
        ('Isabel',      'Gabriela',		'Sánchez',      'Martínez',     'IGSM910907MNO', 1, '1991-07-19', 'F', @IDUsuarioCreadorCliente),
        ('Manuel',      'Alejandro',	'Martínez',     'García',       'MAMG840603PQR', 1, '1984-06-03', 'M', @IDUsuarioCreadorCliente),
        ('Paulina',     'Gabriela',		'García',       'Rodríguez',    'PAGR930510STU', 1, '1993-05-10', 'F', @IDUsuarioCreadorCliente),
        ('Roberto',     'Javier',		'Hernández',    'Vázquez',      'RJHV950605ABC', 1, '1995-06-05', 'M', @IDUsuarioCreadorCliente),
        ('Valentina',   'Fernanda',		'Vázquez',      'Gómez',        'VFVG920507DEF', 1, '1992-05-07', 'F', @IDUsuarioCreadorCliente),
        ('Hugo',        'Miguel',		'Gómez',        'Hernández',    'HMGH890126GHI', 1, '1989-01-26', 'M', @IDUsuarioCreadorCliente),
        ('Ana',         'Isabel',		'Hernández',    'Sánchez',      'AHSN920309JKL', 1, '1992-03-09', 'F', @IDUsuarioCreadorCliente),
        ('Jorge',       'Alejandro',	'Martínez',     'Gómez',        'JAMG910220MNO', 1, '1991-02-20', 'M', @IDUsuarioCreadorCliente),
        ('Sara',        'Fernanda',		'Gómez',        'Hernández',    'SFGH890419PQR', 1, '1989-04-19', 'F', @IDUsuarioCreadorCliente),
        ('Luis',        'Eduardo',		'Martínez',     'Sánchez',      'LEMS930710STU', 1, '1993-07-10', 'M', @IDUsuarioCreadorCliente),
        ('Alicia',      'Fernanda',		'Sánchez',      'García',       'AFSG920823ABC', 1, '1992-08-23', 'F', @IDUsuarioCreadorCliente),
        ('Mauricio',    'Antonio',		'García',       'Martínez',     'MAGM900207DEF', 1, '1990-02-07', 'M', @IDUsuarioCreadorCliente),
        ('Camila',      'Gabriela',		'Martínez',     'Gómez',        'CGMG950410GHI', 1, '1995-04-10', 'F', @IDUsuarioCreadorCliente),
        ('Arturo',      'Javier',		'Gómez',        'Hernández',    'AJGH880601JKL', 1, '1988-06-01', 'M', @IDUsuarioCreadorCliente),
        ('Montserrat',  'Isabel',		'Hernández',    'Sánchez',      'MIHS910515MNO', 1, '1991-05-15', 'F', @IDUsuarioCreadorCliente),
        ('Gustavo',     'Alejandro',	'Martínez',     'Rodríguez',    'GAMR940526PQR', 1, '1994-05-26', 'M', @IDUsuarioCreadorCliente),
        ('Carolina',    'Fernanda',		'Rodríguez',    'García',       'CFRG900509STU', 1, '1990-05-09', 'F', @IDUsuarioCreadorCliente),
        ('Andrés',      'Eduardo',		'García',       'Hernández',    'AEGH930520ABC', 1, '1993-05-20', 'M', @IDUsuarioCreadorCliente),
        ('Regina',      'Gabriela',		'Sánchez',      'Martínez',     'RGSM900723DEF', 1, '1990-07-23', 'F', @IDUsuarioCreadorCliente),
        ('Juan',        'Carlos',		'Martínez',     'Gómez',        'JCMG950731GHI', 1, '1995-07-31', 'M', @IDUsuarioCreadorCliente),
        ('Diana',       'Patricia',		'Gómez',        'Hernández',    'DPGH880704JKL', 1, '1988-07-04', 'F', @IDUsuarioCreadorCliente),
        ('Gonzalo',     'Alejandro',	'Hernández',    'Sánchez',      'GAHS900909MNO', 1, '1990-09-09', 'M', @IDUsuarioCreadorCliente),
        ('Paula',       'Fernanda',		'Martínez',     'Rodríguez',    'PFMR940212PQR', 1, '1994-02-12', 'F', @IDUsuarioCreadorCliente),
        ('Javier',      'Eduardo',		'Rodríguez',    'García',       'JERG890815STU', 1, '1989-08-15', 'M', @IDUsuarioCreadorCliente),
        ('Valeria',     'Isabel',		'García',       'Hernández',    'VIGH930918ABC', 1, '1993-09-18', 'F', @IDUsuarioCreadorCliente),
        ('Mario',       'Alberto',		'Hernández',    'Martínez',     'MAHM910601DEF', 1, '1991-06-01', 'M', @IDUsuarioCreadorCliente),
        ('Paola',       'Gabriela',		'Martínez',     'Gómez',        'PGMG940304GHI', 1, '1994-03-04', 'F', @IDUsuarioCreadorCliente),
        ('Alejandro',   'Antonio',		'Gómez',        'Sánchez',      'AAGS930107JKL', 1, '1993-01-07', 'M', @IDUsuarioCreadorCliente),
        ('Daniela',     'Fernanda',		'Sánchez',      'Hernández',    'DFSH900220MNO', 1, '1990-02-20', 'F', @IDUsuarioCreadorCliente),
        ('Fernando',    'Alejandro',	'Hernández',    'García',       'FAHG880325PQR', 1, '1988-03-25', 'M', @IDUsuarioCreadorCliente),
        ('Lucía',       'Isabel',		'García',       'Martínez',     'LIGM950408STU', 1, '1995-04-08', 'F', @IDUsuarioCreadorCliente),
        ('Emilio',      'Manuel',		'Martínez',     'Gómez',        'EMMG930511ABC', 1, '1993-05-11', 'M', @IDUsuarioCreadorCliente),
        ('María',       'Fernanda',		'Gómez',        'Hernández',    'MFGH880714DEF', 1, '1988-07-14', 'F', @IDUsuarioCreadorCliente),
        ('Carlos',      'Alberto',		'Hernández',    'Sánchez',      'CAHS910817GHI', 1, '1991-08-17', 'M', @IDUsuarioCreadorCliente),
        ('Montserrat',  'Gabriela',		'Sánchez',      'Martínez',     'MGSM950109JKL', 1, '1995-01-09', 'F', @IDUsuarioCreadorCliente),
        ('Germán',      'Antonio',		'Martínez',     'Gómez',        'GAMG910612MNO', 1, '1991-06-12', 'M', @IDUsuarioCreadorCliente),
        ('Natalia',     'Fernanda',		'Gómez',        'Hernández',    'NFGH930715PQR', 1, '1993-07-15', 'F', @IDUsuarioCreadorCliente),
        ('Luis',        'Alejandro',	'Hernández',    'García',       'LAHG890818STU', 1, '1989-08-18', 'M', @IDUsuarioCreadorCliente),
        ('Marisol',     'Isabel',		'García',       'Martínez',     'MIGM920407ABC', 1, '1992-04-07', 'F', @IDUsuarioCreadorCliente),
        ('Joaquín',     'Antonio',		'Martínez',     'Sánchez',      'JAMS910210DEF', 1, '1991-02-10', 'M', @IDUsuarioCreadorCliente),
        ('Renata',      'Fernanda',		'Sánchez',      'Gómez',        'RFSG940513GHI', 1, '1994-05-13', 'F', @IDUsuarioCreadorCliente),
        ('Erick',       'Manuel',		'Gómez',        'Hernández',    'EMGH880616JKL', 1, '1988-06-16', 'M', @IDUsuarioCreadorCliente),
        ('Estefanía',   'Fernanda',		'Hernández',    'Martínez',     'EFHM950319MNO', 1, '1995-03-19', 'F', @IDUsuarioCreadorCliente),
        ('Marco',       'Antonio',		'Martínez',     'Sánchez',      'MAMS910522PQR', 1, '1991-05-22', 'M', @IDUsuarioCreadorCliente),
        ('Valeria',     'Isabel',		'Sánchez',      'Gómez',        'VISG930725STU', 1, '1993-07-25', 'F', @IDUsuarioCreadorCliente),
        ('Federico',    'Antonio',		'Gómez',        'Hernández',    'FAGH900826ABC', 1, '1990-08-26', 'M', @IDUsuarioCreadorCliente),
        ('María',       'Fernanda',		'Hernández',    'Martínez',     'MFHM950901DEF', 1, '1995-09-01', 'F', @IDUsuarioCreadorCliente),
        ('Alejandro',   'Manuel',		'Martínez',     'Sánchez',      'AMMS910704GHI', 1, '1991-07-04', 'M', @IDUsuarioCreadorCliente),
        ('Paulina',     'Fernanda',		'Sánchez',      'Gómez',        'PFSG930807JKL', 1, '1993-08-07', 'F', @IDUsuarioCreadorCliente),
        ('Emmanuel',    'Antonio',		'Gómez',        'Hernández',    'EAGH890910MNO', 1, '1989-09-10', 'M', @IDUsuarioCreadorCliente),
        ('Daniela',     'Isabel',		'Hernández',    'Martínez',     'DIHM910513PQR', 1, '1991-05-13', 'F', @IDUsuarioCreadorCliente),
        ('Humberto',    'Manuel',		'Martínez',     'Sánchez',      'HMSM920416STU', 1, '1992-04-16', 'M', @IDUsuarioCreadorCliente),
        ('Montserrat',  'Fernanda',		'Sánchez',      'Gómez',        'MFSG940129ABC', 1, '1994-01-29', 'F', @IDUsuarioCreadorCliente),
        ('Óscar',       'Antonio',		'Gómez',        'Hernández',    'OAGH900202DEF', 1, '1990-02-02', 'M', @IDUsuarioCreadorCliente),
        ('María',       'Fernanda',		'Hernández',    'Martínez',     'MFHM950901GHI', 1, '1995-09-01', 'F', @IDUsuarioCreadorCliente),
        ('Santiago',    'Manuel',		'Martínez',     'Sánchez',      'SMSM920704JKL', 1, '1992-07-04', 'M', @IDUsuarioCreadorCliente),
        ('Montserrat',  'Fernanda',		'Sánchez',      'Gómez',        'MFSG940129MNO', 1, '1994-01-29', 'F', @IDUsuarioCreadorCliente),
        ('Óscar',       'Antonio',		'Gómez',        'Hernández',    'OAGH900202PQR', 1, '1990-02-02', 'M', @IDUsuarioCreadorCliente),
        ('María',       'Fernanda',		'Hernández',    'Martínez',     'MFHM950901STU', 1, '1995-09-01', 'F', @IDUsuarioCreadorCliente),
        ('Santiago',    'Manuel',		'Martínez',     'Sánchez',      'SMSM920704ABC', 1, '1992-07-04', 'M', @IDUsuarioCreadorCliente),
        ('Montserrat',  'Fernanda',		'Sánchez',      'Gómez',        'MFSG940129DEF', 1, '1994-01-29', 'F', @IDUsuarioCreadorCliente),
        ('Óscar',       'Antonio',		'Gómez',        'Hernández',    'OAGH900202GHI', 1, '1990-02-02', 'M', @IDUsuarioCreadorCliente),
        ('María',       'Fernanda',		'Hernández',    'Martínez',     'MFHM950901JKL', 1, '1995-09-01', 'F', @IDUsuarioCreadorCliente),
        ('Santiago',    'Manuel',		'Martínez',     'Sánchez',      'SMSM920704MNO', 1, '1992-07-04', 'M', @IDUsuarioCreadorCliente),
        ('Montserrat',  'Fernanda',		'Sánchez',      'Gómez',        'MFSG940129PQR', 1, '1994-01-29', 'F', @IDUsuarioCreadorCliente),
        ('Óscar',       'Antonio',		'Gómez',        'Hernández',    'OAGH900202STU', 1, '1990-02-02', 'M', @IDUsuarioCreadorCliente),
        ('María',       'Fernanda',		'Hernández',    'Martínez',     'MFHM950901ABC', 1, '1995-09-01', 'F', @IDUsuarioCreadorCliente),
        ('Santiago',    'Manuel',		'Martínez',     'Sánchez',      'SMSM920704DEF', 1, '1992-07-04', 'M', @IDUsuarioCreadorCliente),
        ('Montserrat',  'Fernanda',		'Sánchez',      'Gómez',        'MFSG940129GHI', 1, '1994-01-29', 'F', @IDUsuarioCreadorCliente),
        ('Óscar',       'Antonio',		'Gómez',        'Hernández',    'OAGH900202JKL', 1, '1990-02-02', 'M', @IDUsuarioCreadorCliente),
        ('María',       'Fernanda',		'Hernández',    'Martínez',     'MFHM950901MNO', 1, '1995-09-01', 'F', @IDUsuarioCreadorCliente),
        ('Santiago',    'Manuel',		'Martínez',     'Sánchez',      'SMSM920704PQR', 1, '1992-07-04', 'M', @IDUsuarioCreadorCliente)
 
    BEGIN -- PhotoUrl
        select @IDCliente = min(IDCliente) from Clientes.tblClientes

        while exists (select top 1 1
			        from Clientes.tblClientes
			        where IDCliente >= @IDCliente)
        begin

	        update Clientes.tblClientes
		        set PhotoUrl = case 
				        when Sexo = 'M' then FORMATMESSAGE('https://randomuser.me/api/portraits/med/men/%d.jpg', cast(rand() * 99 + 1 as int)) 
				        else FORMATMESSAGE('https://randomuser.me/api/portraits/med/women/%d.jpg', cast(rand() * 99 + 1 as int)) 
			        end
	        where IDCliente = @IDCliente

	        select @IDCliente = min(IDCliente) 
	        from Clientes.tblClientes
	        where IDCliente > @IDCliente

        end
    END

end

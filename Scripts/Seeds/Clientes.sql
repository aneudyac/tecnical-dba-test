
if not exists(select top 1 1 from [Clientes].[tblClientes])
begin
	declare
		@IDUsuarioCreadorCliente int
	;

	select top 1 @IDUsuarioCreadorCliente=IDUsuario from [Seguridad].[tblUsuarios] where Activo = 1

	INSERT INTO Clientes.tblClientes (Nombre, SegundoNombre, ApellidoPaterno, ApellidoMaterno, RFC, IDEstatusCliente, FechaNacimiento, IDUsuarioCreador)
	VALUES 
		('Juan',		'Carlos',		'Gómez',		'Hernández',	'GOHJ890123ABC', 1, '1980-05-15', @IDUsuarioCreadorCliente),
		('María',		'Isabel',		'Martínez',		'López',		'MIML900512DEF', 1, '1990-12-25', @IDUsuarioCreadorCliente),
		('Pedro',		'Pablo',		'Rodríguez',	'García',		'PRGG880726GHI', 2, '1988-07-26', @IDUsuarioCreadorCliente),
		('Ana',			'Luisa',		'Sánchez',		'Pérez',		'ALSP950318JKL', 1, '1995-03-18', @IDUsuarioCreadorCliente),
		('José',		'Antonio',		'Fernández',	'González',		'JAFG910719MNO', 2, '1991-07-19', @IDUsuarioCreadorCliente),
		('Laura',		'Elena',		'Díaz',			'Ruíz',			'LEDR840603PQR', 1, '1984-06-03', @IDUsuarioCreadorCliente),
		('Francisco',	'Javier',		'Torres',		'Vázquez',		'FJTV930510STU', 1, '1993-05-10', @IDUsuarioCreadorCliente),
		('Alejandra',	'Fabiola',		'Gutiérrez',	'Hernández',	'AFGH900325VWX', 2, '1990-03-25', @IDUsuarioCreadorCliente),
		('Carlos',		'Alberto',		'López',		'Gómez',		'CALG820820YZA', 1, '1982-08-20', @IDUsuarioCreadorCliente),
		('Patricia',	'Raquel',		'Méndez',		'Martínez',		'PRMM960128BCD', 1, '1996-01-28', @IDUsuarioCreadorCliente),
		('Roberto',		'Carlos',		'Herrera',		'Sánchez',		'RCHS850713EFG', 2, '1985-07-13', @IDUsuarioCreadorCliente),
		('Martha',		'Eugenia',		'Ortega',		'Álvarez',		'MEOA890925HIJ', 1, '1989-09-25', @IDUsuarioCreadorCliente),
		('Manuel',		'Felipe',		'Vega',			'Campos',		'MFVC870410KLM', 1, '1987-04-10', @IDUsuarioCreadorCliente),
		('Verónica',	'Cecilia',		'Ramos',		'Moreno',		'VCRM900802NOP', 2, '1990-08-02', @IDUsuarioCreadorCliente),
		('Héctor',		'Enrique',		'Guerrero',		'Suárez',		'HEGS930214QRS', 1, '1993-02-14', @IDUsuarioCreadorCliente),
		('Gloria',		'Estela',		'Molina',		'Dominguez',	'GEMD840605STU', 2, '1984-06-05', @IDUsuarioCreadorCliente),
		('Ricardo',		'Jesús',		'Franco',		'Vargas',		'RJFV900807ABC', 1, '1990-08-07', @IDUsuarioCreadorCliente),
		('Susana',		'Guadalupe',	'Jiménez',		'Luna',			'SGJL950401DEF', 1, '1995-04-01', @IDUsuarioCreadorCliente),
		('Roberto',		'Arturo',		'Nava',			'Cervantes',	'RANC910309GHI', 2, '1991-03-09', @IDUsuarioCreadorCliente),
		('Silvia',		'Patricia',		'Aguilar',		'Delgado',		'SPAD880727JKL', 1, '1988-07-27', @IDUsuarioCreadorCliente),
		('Juan',		'Manuel',		'Mendoza',		'Rojas',		'JMRR900512MNO', 1, '1990-05-12', @IDUsuarioCreadorCliente),
		('Laura',		'Paulina',		'Reyes',		'González',		'LPRG850819PQR', 2, '1985-08-19', @IDUsuarioCreadorCliente),
		('Hugo',		'Alberto',		'Chávez',		'Castañeda',	'HACC940625STU', 1, '1994-06-25', @IDUsuarioCreadorCliente),
		('Ana',			'Lilia',		'Aguirre',		'Mendoza',		'ALAM800310ABC', 1, '1980-03-10', @IDUsuarioCreadorCliente),
		('Francisco',	'Alejandro',	'Zamora',		'Jiménez',		'FAZJ900720DEF', 2, '1990-07-20', @IDUsuarioCreadorCliente),
		('Carmen',		'Rosa',			'Castillo',		'Hernández',	'CRCH880601GHI', 1, '1988-06-01', @IDUsuarioCreadorCliente),
		('Jorge',		'Luis',			'Bautista',		'Ríos',			'JLBR850322JKL', 2, '1985-03-22', @IDUsuarioCreadorCliente),
		('María',		'Elena',		'Rosales',		'Romero',		'MERR920515MNO', 1, '1992-05-15', @IDUsuarioCreadorCliente),
		('Rafael',		'Ignacio',		'Molina',		'Chávez',		'RIMC890727PQR', 2, '1989-07-27', @IDUsuarioCreadorCliente),
		('Sandra',		'Leticia',		'Ortiz',		'Ortega',		'SLOO930420STU', 1, '1993-04-20', @IDUsuarioCreadorCliente),
		('Javier',		'Arturo',		'Reyes',		'López',		'JARL880808ABC', 2, '1988-08-08', @IDUsuarioCreadorCliente),
		('Diana',		'Elizabeth',	'Cruz',			'Maldonado',	'DECM950122DEF', 1, '1995-01-22', @IDUsuarioCreadorCliente),
		('Arturo',		'Miguel',		'Delgado',		'Hernández',	'AMDH900713GHI', 1, '1990-07-13', @IDUsuarioCreadorCliente),
		('Verónica',	'Patricia',		'Sánchez',		'Flores',		'VPSF850705JKL', 2, '1985-07-05', @IDUsuarioCreadorCliente),
		('Daniel',		'Mauricio',		'Gómez',		'Reyes',		'DMGR930620MNO', 1, '1993-06-20', @IDUsuarioCreadorCliente),
		('Gabriela',	'Guadalupe',	'Castañeda',	'Hernández',	'GGCH940125PQR', 1, '1994-01-25', @IDUsuarioCreadorCliente),
		('Fernando',	'Alberto',		'Alvarado',		'Martínez',		'FAAM900817STU', 2, '1990-08-17', @IDUsuarioCreadorCliente),
		('Erika',		'Rosa',			'Soto',			'Jiménez',		'ERSJ840612ABC', 1, '1984-06-12', @IDUsuarioCreadorCliente),
		('Guadalupe',	'Alejandro',	'Martínez',		'Sánchez',		'GAMS930715DEF', 1, '1993-07-15', @IDUsuarioCreadorCliente),
		('Cynthia',		'Anabel',		'Méndez',		'Flores',		'CAMF850223GHI', 2, '1985-02-23', @IDUsuarioCreadorCliente),
		('Roberto',		'Carlos',		'García',		'Ortega',		'RCGO870514JKL', 1, '1987-05-14', @IDUsuarioCreadorCliente),
		('María',		'Leticia',		'Fernández',	'Castillo',		'MLFC900307MNO', 2, '1990-03-07', @IDUsuarioCreadorCliente),
		('Luis',		'Alberto',		'Hernández',	'Martínez',		'LAHM950825PQR', 1, '1995-08-25', @IDUsuarioCreadorCliente),
		('Jessica',		'Karina',		'Molina',		'Sánchez',		'JKMS920216STU', 1, '1992-02-16', @IDUsuarioCreadorCliente),
		('Jesús',		'Alberto',		'Ortega',		'Gómez',		'JAOG870703ABC', 2, '1987-07-03', @IDUsuarioCreadorCliente),
		('Laura',		'Giselle',		'Campos',		'López',		'LGCL930330DEF', 1, '1993-03-30', @IDUsuarioCreadorCliente),
		('Juan',		'Pablo',		'Martínez',		'Flores',		'JPMF920129GHI', 2, '1992-01-29', @IDUsuarioCreadorCliente),
		('Diana',		'Liliana',		'Ríos',			'Hernández',	'DLRH850812JKL', 1, '1985-08-12', @IDUsuarioCreadorCliente),
		('José',		'Guadalupe',	'Luna',			'Cruz',			'JGLC910510MNO', 1, '1991-05-10', @IDUsuarioCreadorCliente),
		('Elizabeth',	'Montserrat',	'González',		'Díaz',			'EMGD920803PQR', 2, '1992-08-03', @IDUsuarioCreadorCliente)
	;
end

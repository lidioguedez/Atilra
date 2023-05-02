create database Hospital

go

use Hospital

go

create table medicos(
matricula int not null,
nombre varchar (30),
apellido varchar (30),
sexo char (1),
estado char(2),
constraint PK_MEDICOS primary key (matricula)
)

go

create table pacientes(
dni int not null,
nombre varchar (30),
apellido varchar (30),
sexo varchar (1),
fechaNac datetime,
constraint PK_PACIENTES primary key (dni)
)

go

create table obraSocial(
sigla varchar(8) not null,
razonSocial varchar (50),
categoria char(2),
constraint PK_OBRASOCIAL primary key (sigla)
)

go

create table planes(
idPlan smallint not null,
sigla varchar(8) not null,
estado char(2),
constraint PK_PLANES primary key (idPlan)
)

go

create table institutos(
idInstituto smallint not null,
nombreInstituto varchar (30),
estado char(2),
constraint PK_INSTITUTOS primary key (idInstituto)
)

create table estudiosRealizados(
idEstudioReal smallint not null,
idEstudio smallint not null,
fecha datetime,
idInstituto smallint not null,
matricula int not null,
sigla varchar(8) not null,
dni int not null,
resultadoEstudio varchar (200),
abono varchar (3),
estado char(2),
constraint PK_ESTUDIOSREALIZADOS primary key (idEstudioReal)
)

go

create table estudios(
idEstudio smallint not null,
tipoDeEstudio varchar (30),
constraint PK_ESTUDIOS primary key (idEstudio)
)

go

create table especialidad(
idEspecialidad smallint not null ,
descripcion varchar (50),
constraint PK_ESPECIALIDAD primary key (idEspecialidad)
)


go

create table medicos_Especialidad(
idEspecialidad smallint not null,
matricula int not null,
constraint PK_MEDICOS_ESPECIALIDAD primary key (idEspecialidad, matricula)
)

go

create table especialidad_Estudios(
idEspecialidad smallint not null,
idEstudio smallint not null ,
constraint PK_ESPECIALIDAD_ESTUDIOS primary key (idEspecialidad, idEstudio)
)

go

create table estudios_Institutos(
idEstudio smallint not null,
idInstituto smallint not null,
precio float,
constraint PK_ESTUDIOS_INSTITUTOS primary key (idInstituto, idEstudio)
)

go

create table planes_cob_estudios(
idPlan smallint not null,
idEstudio smallint not null ,
porcentaje float,
constraint PK_PLANES_COB_ESTUDIOS primary key (idPlan, idEstudio)
)

go

create table pacientes_Planes(
idPlan smallint not null,
dni int not null,
constraint PK_PACIENTES_PLANES primary key (idPlan, dni)
)

go

create table historias(
idHistoria int identity(1,1) not null,
descripcion varchar(100),
dni int not null,
matricula int not null,
idEstudio smallint not null,
idInstituto smallint not null,
sigla varchar(8) not null,
fechaProgramada datetime not null,
estado char(2),
constraint PK_HISTORIAS primary key (idHistoria)
)

go

/*Tener en cuenta*/
/*a la hora de las fk , donde esta el 1 (de mi relacion 1 a m) ahi apunte mi fk. 
Y en el caso que tengo relacion m a m , la tabla intermedia va a tener una fk para una tabla y otra fk para la otra tabla*/

/*FK*/
ALTER TABLE planes
ADD CONSTRAINT plan_OOSS_fk foreign key (sigla) references obraSocial(sigla)

ALTER TABLE estudiosRealizados
ADD CONSTRAINT estReal_Med_fk foreign key (matricula) references medicos(matricula)

ALTER TABLE estudiosRealizados
ADD CONSTRAINT estReal_Pac_fk foreign key (dni) references pacientes(dni)

ALTER TABLE estudiosRealizados
ADD CONSTRAINT estReal_Estudios_fk foreign key (idEstudio) references estudios(idEstudio)

ALTER TABLE estudiosRealizados
ADD CONSTRAINT estReal_Insti_fk foreign key (idInstituto) references institutos(idInstituto)

ALTER TABLE medicos_Especialidad
ADD CONSTRAINT MediEspe_Medi_fk foreign key (matricula) references medicos(matricula)

ALTER TABLE medicos_Especialidad
ADD CONSTRAINT MediEspe_espec_fk foreign key (idEspecialidad) references especialidad(idEspecialidad)

ALTER TABLE especialidad_Estudios
ADD CONSTRAINT especEst_est_fk foreign key (idEstudio) references Estudios(idEstudio)

ALTER TABLE especialidad_Estudios
ADD CONSTRAINT especEst_espec_fk foreign key (idEspecialidad) references especialidad(idEspecialidad)

ALTER TABLE estudios_Institutos
ADD CONSTRAINT estuInsti_estu_fk foreign key (idEstudio) references estudios(idEstudio)

ALTER TABLE estudios_Institutos
ADD CONSTRAINT estuInsti_insti_fk foreign key (idInstituto) references institutos(idInstituto)

ALTER TABLE planes_cob_estudios
ADD CONSTRAINT planCobEst_estu_fk foreign key (idEstudio) references estudios(idEstudio)

ALTER TABLE planes_cob_estudios
ADD CONSTRAINT planCobEst_plan_fk foreign key (idPlan) references planes(idPlan)

ALTER TABLE pacientes_Planes
ADD CONSTRAINT pacPlan_pac_fk foreign key (dni) references pacientes(dni)

ALTER TABLE pacientes_Planes
ADD CONSTRAINT pacPlan_plan_fk foreign key (idPlan) references planes(idPlan)
-- =============
ALTER TABLE historias
ADD CONSTRAINT FK_HISTORIAS_ESTUDIOS foreign key (idEstudio) references estudios(idEstudio)

ALTER TABLE historias
ADD CONSTRAINT FK_HISTORIAS_INSTITUTOS foreign key (idInstituto) references institutos(idInstituto)

ALTER TABLE historias
ADD CONSTRAINT FK_HISTORIAS_MEDICOS foreign key (matricula) references medicos(matricula)

ALTER TABLE historias
ADD CONSTRAINT FK_HISTORIAS_OBRASOCIAL foreign key (sigla) references obraSocial(sigla)

ALTER TABLE historias
ADD CONSTRAINT FK_HISTORIAS_PACIENTES foreign key (dni) references pacientes(dni)

go

/*INSERTS*/

/*obraSocial*/
insert into obraSocial values('UMA','UMA','pp')
insert into obraSocial values('OSDE','OSDE','pp')
insert into obraSocial values('MEDI','MEDICAL','os')
insert into obraSocial values('UTGRA','UTGRA','os')

go

/*Medicos*/

insert into medicos values (1,'Juan','Pepe','m','ve')
insert into medicos values (2,'Juan','Perez','m','fa')
insert into medicos values (3,'Maria','Pepe','f','ve')

/*pacientes*/

insert into pacientes values (123456,'Roberta','Fernandez','m','02/02/1989' )
insert into pacientes values (123457,'Florencia','gaturro','m','02/04/1960' )
insert into pacientes values (123458,'Carlos','juare','m','02/05/1977' )

go

/*planes*/

insert into planes values (12,'OSDE','ve')
insert into planes values (11,'OSDE','fa')
insert into planes values (10,'UMA','ve')

go

/*especialidad*/
insert into especialidad values (1,'cardiologo')
insert into especialidad values (2,'traumatologo')
insert into especialidad values (3,'clinico')

go

/*institutos*/

insert into institutos values (1,'centro rossi','ve')
insert into institutos values (2,'centro Tomas','fa')
insert into institutos values (3,'centro maria rosa','ve')

go

/*estudios*/
insert into estudios values (1,'cardiologia')
insert into estudios values (2,'radiologia')
insert into estudios values (3,'analisis')

go

/*estudiosRealizados*/
insert into estudiosRealizados values (1,1,'01/01/2013',1,1,'OSDE',123456,'El paciente se encuentra en buen estado','ve','ve')
insert into estudiosRealizados values (2,3,'01/02/2013',3,1,'OSDE',123457,'El paciente se encuentra en buen estado','ve','fa')
insert into estudiosRealizados values (3,2,'01/03/2013',2,1,'OSDE',123458,'El paciente se encuentra en buen estado','ve','ve')

go

/*medicos_Especialidad*/
insert into medicos_Especialidad values (1,1)
insert into medicos_Especialidad values (2,2)
insert into medicos_Especialidad values (3,3)
insert into medicos_Especialidad values (1,3)

go

/*especialidad_Estudios*/
insert into especialidad_Estudios values (1,1)
insert into especialidad_Estudios values (2,2)
insert into especialidad_Estudios values (3,3)

go

/*estudios_Institutos*/
insert into estudios_Institutos values (1,1,120)
insert into estudios_Institutos values (1,2,160)
insert into estudios_Institutos values (1,3,220)
insert into estudios_Institutos values (2,1,90)
insert into estudios_Institutos values (2,2,200)
insert into estudios_Institutos values (2,3,300)
insert into estudios_Institutos values (3,1,190)
insert into estudios_Institutos values (3,2,230)
insert into estudios_Institutos values (3,3,330)

go

/*planes_cob_estudios*/
insert into planes_cob_estudios values (10,1,30)
insert into planes_cob_estudios values (10,2,30)
insert into planes_cob_estudios values (10,3,30)
insert into planes_cob_estudios values (11,1,40)
insert into planes_cob_estudios values (11,2,40)
insert into planes_cob_estudios values (11,3,40)
insert into planes_cob_estudios values (12,1,55)
insert into planes_cob_estudios values (12,2,55)
insert into planes_cob_estudios values (12,3,55)

go

/*pacientes_Planes*/
insert into pacientes_Planes values (10,123456)
insert into pacientes_Planes values (11,123457)
insert into pacientes_Planes values (12,123458)



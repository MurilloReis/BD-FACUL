create database consultorio

use consultorio

create table pessoas (
id int not null primary key identity,
data_nascimento date,
genero varchar (10),
estado_civil varchar (20),
rg varchar (10)
);

create table enderecos (
id int not null identity,
id_pessoa int not null,
logradouro varchar(50),
numero varchar(10),
cep varchar (9),
bairro varchar (50),
cidade varchar (50),
estado varchar (50),
primary key (id, id_pessoa),
foreign key (id_pessoa) references pessoas (id),
);

create table telefones(
id_pessoa int not null,
ddd varchar (3),
telefone varchar(9),
primary key (id_pessoa, ddd, telefone),
foreign key (id_pessoa) references pessoas (id)
);

create table pacientes (
id_pessoa int not null primary key,
convenio varchar (50),
foreign key (id_pessoa) references pessoas (id)
);

create table medicos (
id_pessoa int not null primary key,
crm varchar(10),
foreign key (id_pessoa) references pessoas(id),
);


create table consultas (
id int not null primary key identity,
data date,
diagnostico varchar(200),
id_medico int not null,
id_paciente int not null
foreign key (id_medico) references medicos (id_pessoa),
foreign key (id_paciente) references pacientes(id_pessoa),
);

create table exames (
id int not null primary key identity,
id_consulta int not null,
data datetime not null,
exame varchar(50),
foreign key (id_consulta) references consultas(id)
);


insert into pessoas values (getDate(), 'Feminino', 'Solteiro', 151996325);
insert into pessoas values (getDate(), 'Masculino', 'Casado', 836575441);
insert into pessoas values (getDate(), 'Feminino', 'Solteiro', 796584238);
insert into pessoas values (getDate(), 'Masculino', 'Solteiro', 155126325);
insert into pessoas values (getDate(), 'Feminino', 'Casado', 525126325);


insert into enderecos values (1, 'Belas artes',157,12456738, 'Morro Doce', 'Osasco', 'Sao Paulo');
insert into enderecos values (2, 'Sao Zacarias',983,8938515, 'Veloso', 'Osasco', 'Sao Paulo');
insert into enderecos values (3, 'Rua Santo Elias',85,19231235, 'Av. Joao de Andrade', 'Sao Paulo', 'Sao Paulo');
insert into enderecos values (4, 'Rua Nao Gostuei',258,12519259, 'Rua das Prima', 'Manaus', 'Amazonas');
insert into enderecos values (5, 'Av Lastin Brito',788,125125925, 'Paula Tejando', 'Sao Paulo', 'Sao Paulo');

insert into telefones values (1, 11, 940028922);
insert into telefones values (2, 11, 986278697);
insert into telefones values (3, 11, 915441232);
insert into telefones values (4, 11, 945125932);
insert into telefones values (5, 11, 949843532);

insert into pacientes values (1, 'Convenio 1');
insert into pacientes values (2, 'Convenio 2');
insert into pacientes values (3, 'Convenio 3');
insert into pacientes values (4, 'Convenio 4');
insert into pacientes values (5, 'Convenio 5');

insert into medicos values (1, 'CRM1');
insert into medicos values (2, 'CRM2');
insert into medicos values (3, 'CRM3');
insert into medicos values (4, 'CRM4');
insert into medicos values (5, 'CRM5');

insert into consultas values (getDate(), 'Leucemia', 1, 1);
insert into consultas values (getDate(), 'Osteoporose', 2, 2);
insert into consultas values (getDate(), 'Dengue', 3, 3);
insert into consultas values (getDate(), 'Mal estar', 4, 4);
insert into consultas values (getDate(), 'Cegueira', 5, 5);

insert into exames values (1, getDate(), 'Exame de sangue');
insert into exames values (2, getDate(), 'Raio-X');
insert into exames values (3, getDate(), 'Exame de sangue');
insert into exames values (4, getDate(), 'Exame de sangue');
insert into exames values (5, getDate(), 'Exame de vista');

select * from pacientes;
select * from consultas;
select * from pessoas;
select * from enderecos;
select * from medicos;
select * from exames;
select * from telefones;

ALTER TABLE pessoas ADD nome varchar(20)

UPDATE pessoas
	SET nome = 'Pedro'
		Where id = 1;

UPDATE pessoas
	SET nome = 'Samuel'
		Where id = 2;

UPDATE pessoas
	SET nome = 'Bahia'
		Where id = 3;

UPDATE pessoas
	SET nome = 'Rogerio'
	Where id = 4;

UPDATE pessoas
	SET nome = 'Tereza'
	Where id = 5;

SELECT * from consultas WHERE id_medico = 1

SELECT * from exames WHERE id_consulta = 4

SELECT * from telefones WHERE id_pessoa = 2


SELECT pessoas.*, pacientes.*
	FROM pessoas
		JOIN pacientes ON pessoas.id = pacientes.id_pessoa;

SELECT pessoas.*, medicos.*
	FROM pessoas
		JOIN medicos ON pessoas.id = medicos.id_pessoa;


CREATE DATABASE Consultorio;

USE Consultorio;

CREATE TABLE consultas(

  id INT NOT NULL PRIMARY KEY IDENTITY,
  data_consulta DATETIME NOT NULL,
  diagnostico VARCHAR(255) NOT NULL,
  id_medico INT NOT NULL,
  id_paciente INT NOT NULL,

  FOREIGN KEY (id_medico) REFERENCES Medicos(id_pessoa),
  FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_pessoa)
);

CREATE TABLE Exames (

  id INT NOT NULL IDENTITY,
  id_consulta INT NOT NULL,
  data_exame DATETIME NOT NULL,
  exame VARCHAR(255) NOT NULL,

  PRIMARY KEY (ID),
  FOREIGN KEY (id_consulta) REFERENCES Consultas(id)
);

CREATE TABLE Pessoas(

	id INT NOT NULL IDENTITY,
	data_nascimento DATETIME NOT NULL,
	genero VARCHAR (255) NOT NULL,
	estado_civil VARCHAR (255) NOT NULL,
	RG VARCHAR(11) NOT NULL UNIQUE, 

	PRIMARY KEY(ID)
);

CREATE TABLE Pacientes(

	id_pessoa INT,
	convenio VARCHAR(255),

	PRIMARY KEY (id_pessoa),
	FOREIGN KEY (id_pessoa) REFERENCES Pessoas(ID)
);

CREATE TABLE Medicos(

	id_pessoa INT NOT NULL ,
	CRM VARCHAR(255) NOT NULL, 


	PRIMARY KEY (id_pessoa),
	FOREIGN KEY (id_pessoa) REFERENCES Pessoas(ID)
);

CREATE TABLE Telefones(

	id_pessoa INT NOT NULL,
    DDD INT NOT NULL,
	TELEFONE INT NOT NULL

	PRIMARY KEY (id_pessoa),
	FOREIGN KEY (id_pessoa) REFERENCES Pessoas(ID)
);

CREATE TABLE Endereco(

	id INT IDENTITY,
	id_pessoa INT NOT NULL, 
	logradouro VARCHAR(255) NOT NULL,
	numero VARCHAR(255) NOT NULL,
	CEP VARCHAR(255) NOT NULL,
	bairro VARCHAR(255) NOT NULL,
	cidade VARCHAR(255) NOT NULL,
	estado VARCHAR(255) NOT NULL,

	PRIMARY KEY (id_pessoa),
	FOREIGN KEY (id_pessoa) REFERENCES Pessoas(ID)
);

use escola; -- entrar no banco de dados

-- EX01

CREATE TABLE aluno(
matricula integer primary key,
nomealuno varchar(30) not null,
sexo char(1),
dtNacimento Date
);

-- EX02

CREATE TABLE departamento(
codDept int primary key,
nomeDepto varchar(30)
);

-- EX03

CREATE TABLE curso(
codCurso integer primary key,
nomeCurso varchar(30) not null,
cargaHoraria int check(cargaHoraria > 0), 
preco real check(preco > 0),
codDepto int ,
foreign key(codDepto) references departamento (codDept)
);

-- EX04

CREATE TABLE matricula(
matricula integer,
codCurso integer,
dtMatricula date,
PRIMARY KEY (matricula, codCurso),
foreign key (matricula) references aluno (matricula),
foreign key (codCurso) references curso (Codcurso)
);

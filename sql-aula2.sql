

-- EX01
CREATE TABLE aluno(
matricula INTEGER PRIMARY KEY,
nomealuno VARCHAR(30) NOT NULL, 
sexo CHAR(1),
dtnascimento DATE
);

-- EX02
CREATE TABLE departamento(
coddepto INTEGER PRIMARY KEY,
nomedepto VARCHAR(30) NOT NULL
);

-- EX03
CREATE TABLE curso(
codcurso INTEGER PRIMARY KEY,
nomecurso VARCHAR(30) NOT NULL,
ch INTEGER CHECK (ch > 0),
preco REAL,
coddepto INTEGER,
FOREIGN KEY (coddepto) REFERENCES departamento (coddepto)
);

-- EX04-1
CREATE TABLE matricula(
matricula INTEGER,
codcurso INTEGER,
dtmatricula DATE,
PRIMARY KEY (matricula,codcurso),
FOREIGN KEY (matricula) REFERENCES aluno(matricula),
FOREIGN KEY (codcurso) REFERENCES curso(codcurso)
);


-- EX05
CREATE TABLE func(
 codfunc INTEGER PRIMARY KEY,
 nomefunc VARCHAR(20),
 city VARCHAR(20),
 cbo INTEGER,
 uf CHAR(2),
 coddepto INTEGER,
 FOREIGN KEY(coddepto) REFERENCES departamento(coddepto)
);

-- EX06
ALTER TABLE func RENAME COLUMN city TO cidade;

-- EX07
ALTER TABLE func ADD COLUMN sexo CHAR(1);

-- EX08
ALTER TABLE func MODIFY COLUMN nomefunc VARCHAR(30);

-- EX09
ALTER TABLE func DROP COLUMN cbo;

-- EX10
ALTER TABLE func ALTER COLUMN uf SET DEFAULT 'RJ';

-- EX11
ALTER TABLE func RENAME TO funcionario;

-- EX12
ALTER TABLE funcionario MODIFY COLUMN nomefunc VARCHAR(30) NOT NULL;

-- EX13
ALTER TABLE funcionario MODIFY COLUMN codfunc INTEGER AUTO_INCREMENT;

-- EX14
CREATE TABLE telefone(
 codtel SERIAL PRIMARY KEY, 
 ddd INTEGER,
 numero VARCHAR(13),
 codfunc INTEGER,
 CONSTRAINT fk_func FOREIGN KEY (codfunc)
 REFERENCES funcionario(codfunc)
);

-- EX15
-- DROP TABLE funcionario;

-- EX16 
DROP TABLE telefone;

-- EX17
INSERT INTO aluno(matricula,nomealuno,sexo,dtnascimento)
VALUES
(1,'Ana','F','1979-01-23');

SELECT * FROM aluno;

-- EX18
INSERT INTO aluno(matricula,nomealuno,sexo,dtnascimento)
VALUES
(2, 'André', 'M', '1980-11-20'),
(3, 'Andreia', 'F', '1985-05-09'),
(4, 'Bruna', 'F', '1980-11-20'),
(5, 'Bruno', 'M', '1982-01-12');

-- EX19
INSERT INTO departamento(coddepto,nomedepto)
VALUES 
(1,'TI'),
(2,'ADM');

-- EX20
INSERT INTO curso(codcurso,nomecurso,ch,preco,coddepto)
VALUES 
(1, 'Python', 40, 1200, 1),  
(2, 'Power BI', 20, 900, 1),
(3, 'Pentaho', 40, 1200, 1),
(4, 'Recursos Humanos', 60, 2000, 2),
(5, 'Marketing', 80, 2500, 1);

-- EX21
INSERT INTO matricula(matricula,codcurso,dtmatricula)
VALUES
(1,1,'2019-04-01'),
(2,1,'2019-04-01'),
(4,1,'2019-04-01'),
(4,2,'2019-04-02'),
(5,2,'2019-04-02'),
(1,2,'2019-04-02'),
(1,3,'2019-04-03'),
(5,3,'2019-04-03'),
(3,3,'2019-04-03'),
(2,3,'2019-04-03'),
(4,3,'2019-04-03'),
(5,4,'2019-04-04'),
(3,4,'2019-04-04'),
(5,5,'2019-04-06'),
(3,5,'2019-04-06'),
(2,5,'2019-04-06');

-- CRIANDO UMA VISÃO EM MATRÍCULAS
CREATE VIEW vw_matriculas AS
SELECT aluno.nomealuno, curso.nomecurso, matricula.dtmatricula 
  FROM aluno, matricula, curso
 WHERE aluno.matricula = matricula.matricula
   AND matricula.codcurso = curso.codcurso;
  
SELECT * FROM vw_matriculas;  

-- EX22
INSERT INTO funcionario(codfunc,nomefunc,cidade,uf,coddepto,sexo) 
VALUES
(1, 'Paulo', 'Duque de Caxias', 'RJ', 1, 'M'),
(2, 'Paula', 'Rio de Janeiro', 'RJ', 2, 'F'),
(3, 'José', 'Rio de Janeiro', 'RJ', 1, 'M');

select * from funcionario;

-- EX 23
update curso set preco = 1000
	where codcurso = 2;

-- EX 24
update curso set coddepto = 2
 where codcurso = 5;
 
-- EX 25
update curso set ch = 80
 where codcurso = 4;
 
-- EX 26
update curso set preco = preco * 1.2
 where coddepto = 1;
 
-- EX 27
update curso set preco = preco - 50
 where coddepto = 2;
 
 -- EX 28
update curso set preco = preco * 0.9
 where ch < 80 
 and preco > 1000;

-- EX 29 
delete from funcionario;

-- EX 30 
delete from matricula 
 where dtmatricula > '2019-04-04'
 and matricula = 3;



select * from matricula;








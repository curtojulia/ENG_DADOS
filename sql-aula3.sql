-- EX 17
select nomecliente
from cliente
where nomecliente LIKE 'A%';

-- EX 18
select nomecliente
from cliente
where nomecliente LIKE '%ana%';

-- EX 19
select nomecliente, estadocivil
from cliente
where estado IN('Rio De Janeiro','São Paulo','Espírito Santo', 'Minas Gerais ');

-- EX 20
SELECT nomecliente,
	CASE 
    WHEN estadocivil = 'S' THEN 'Solteiro'
	WHEN estadocivil = 'C' THEN 'Casado'
    WHEN estadocivil = 'D' THEN 'Divorciado'
    WHEN estadocivil = 'V' THEN 'Viúvo'
	ELSE 'Inválido'
	END AS estado_civil
 FROM cliente;
 
 -- EX 21
SELECT p1.nomeproduto, m2.nomemarca
FROM produto AS p1, marca AS m2
WHERE p1.idmarca = m2.idmarca;

-- EX 22
SELECT c.nomecliente, p.nomeproduto
FROM cliente AS c, produto AS p, compras AS ca
WHERE c.idcliente = ca.idcliente
AND p.idproduto = ca.idproduto;

-- EX 23 
SELECT c.nomecliente, c.estado, l.nomeloja, l.uf
FROM cliente AS c, loja AS l, compras AS ca
WHERE c.idcliente = ca.idcliente
AND ca.idloja = l.idloja
AND ca.qtd > 40;

-- EX 24
select p.nomeproduto, p.preco, m.nomemarca
from produto AS p
INNER JOIN marca AS m
ON p.idmarca = m.idmarca;

-- EX 25
select m.nomemarca, c.dtcompra, c.qtd
from marca AS m
INNER JOIN compras AS c
INNER JOIN produto AS P
ON c.idproduto = p.idproduto;

-- EX 26
select cl.nomecliente, pr.nomeproduto, co.qtd
from cliente AS cl
INNER JOIN compras AS co
ON cl.idcliente = co.idcliente
INNER JOIN produto AS pr
ON pr.idproduto = co.idproduto;

INSERT INTO cliente
(idcliente,nomecliente,genero,estadocivil,dtnascimento,cidade,estado)
VALUES
(501, 'Alba', 'F', 'V', '1982/10/25', 'Duque de Caxias','Rio de Janeiro'),
(502, 'Solimar', 'F', 'V', '1972/11/25', 'Niterói','Rio de Janeiro'),
(503, 'Pablo', 'M', 'C', '1999/03/01', 'Nova Iguaçu','Rio de Janeiro'),
(504, 'Solange', 'F', 'S', '1979/06/05', 'Salvador', 'Bahia'),
(505, 'Mário', 'M', 'S', '1985/07/22', 'Bragança Paulista', 'São Paulo');

-- EX 27
select cl.nomecliente, co.idcompra
from cliente AS cl
LEFT JOIN compras AS co
ON cl.idcliente = co.idcliente;


INSERT INTO marca (idmarca,nomemarca)
VALUES
(6,'Delícia de Prato'),
(7,'Pajé');

-- EX 28
select pr.nomeproduto, ma.nomemarca
from produto AS pr
RIGHT JOIN marca AS ma 
ON pr.idmarca = ma.idmarca;

insert into compras (idcompra, idcliente, idproduto, dtcompra,
idloja, qtd)
values
(1001, null, 10, '2025-05-19', 1, 15),
(1002, null, 9, '2025-05-19', 2, 5),
(1003, null, 8, '2025-05-19', 3, 25),
(1004, null, 7, '2025-05-19', 4, 13),
(1005, null, 6, '2025-05-19', 5, 12);


-- EX 29
select cl.nomecliente, co.idcompra
from cliente as cl
LEFT JOIN compras as co
ON cl.idcliente = co.idcompra
UNION
select cl.nomecliente, co.idcompra
from cliente as cl
RIGHT JOIN compras as co
ON cl.idcliente = co.idcompra;
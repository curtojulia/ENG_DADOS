-- EX 01
select nomecliente, genero
 from cliente;
 
-- EX 02
select nomeproduto, preco
 from produto;
 
-- EX 03 
select idcompra, dtcompra
 from compras;
 
-- EX 04
 select nomecliente, cidade, estadocivil
  from cliente; 
  
-- EX 05
select * from cliente; 

-- EX 06
 select nomecliente, estadocivil
  from cliente
  ORDER BY nomecliente asc;
  
-- EX 07
select nomeproduto, preco
 from produto
 order by preco desc;
 
-- EX 08
select nomecliente, estado, cidade
from cliente
order by estado, cidade asc;

-- EX 09
select distinct estado 
from cliente
order by estado;

-- EX 10
select distinct dtcompra
 from compras
 order by dtcompra;
 
-- EX 11
select nomeproduto, preco
from produto
where preco > 5.00;

-- EX 12
select nomecliente, estadocivil
from cliente
where genero = 'f'; 

-- EX 13
select nomecliente, cidade
from cliente
where estado = 'Rio de Janeiro';

-- EX 14
select nomecliente, TIMESTAMPDIFF(YEAR, dtnascimento, CURDATE()) As idade
from cliente 
where TIMESTAMPDIFF(YEAR, dtnascimento, CURDATE()) > 40;

-- EX 15
select distinct idcliente 
from compras 
where EXTRACT(YEAR FROM dtcompra) = 2021;

-- EX 16
select distinct idcliente
from compras 
where EXTRACT(YEAR FROM dtcompra) = 2020;
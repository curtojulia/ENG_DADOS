-- aula 09-06
-- ex01

select estado 
from (
select distinct estado
from cliente
union
select distinct case 
	when uf = 'RJ' then 'Rio de Janeiro'
    when uf = 'MG' then 'Minas Gerais'
    when uf = 'PA' then 'Pará'
    when uf = 'GO' then 'Goiás'
    when uf = 'RS' then 'Rio Grande do SUl'
    when uf = 'AM' then 'Amazonas'
    when uf = 'PE' then 'Pernambuco'
    when uf = 'CE' then 'Ceará'
    Else 'Não Localizado'
    end as estado
from loja) as r -- quando tem um from de uma querry vazia tem que ter um as 
order by estado;

-- ex 02

select distinct estado
	from cliente 
    where genero = 'F'
union all -- all serve para mostrar mesmo que tenha repetições
select distinct case 
	when uf = 'RJ' then 'Rio de Janeiro'
    when uf = 'MG' then 'Minas Gerais'
    when uf = 'PA' then 'Pará'
    when uf = 'GO' then 'Goiás'
    when uf = 'RS' then 'Rio Grande do SUl'
    when uf = 'AM' then 'Amazonas'
    when uf = 'PE' then 'Pernambuco'
    when uf = 'CE' then 'Ceará'
    Else 'Não Localizado'
    end as estado
from loja;

-- exercicio revisão

-- ex 01
select cl.nomecliente, cl.cidade 
from cliente as cl
inner join compras as co
 on cl.idcliente = co.idcliente
inner join produto as po
on co.idproduto = po.idproduto
where po.nomeproduto = 'Óleo';

-- ex 02

select nomecliente 
from cliente
where idcliente not in (
	select cl.idcliente
	from compras as co
	inner join cliente as cl on cl.idcliente = co.idcliente
	inner join loja as lo on co.idloja = lo.idloja
	where nomeloja = 'Vale Verde'
);

-- ex 03 
select round(avg(preco),2) as media 
from produto;
;

-- ex 04 
select count(idcompra), nomeproduto
from compras as co
inner join produto as po on co.idproduto = po.idproduto
group by nomeproduto;

-- ex 05 
select count(idcompra) as qtd , nomeproduto
from compras as co
inner join produto as po on co.idproduto = po.idproduto
group by nomeproduto
having qtd>100; -- quando tem mas, apenas, .. usa -se o having

-- ex 06 
select ma.nomemarca, pr.nomeproduto
from marca as ma 
left join produto as pr on ma.idmarca = pr.idmarca
order by ma.nomemarca asc; 

-- ex 07 
select pr.nomeproduto, sum(pr.preco * co.qtd) as faturamento
from compras as co
inner join produto as pr on co.idproduto = pr.idproduto
group by pr.nomeproduto; 
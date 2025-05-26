-- aula 26/05
use armazem;
-- ex 01
select max(preco) as maior_preco
from produto;

-- ex 02
select min(qtd) as quantidade_min
from compras;

-- ex 03
select round(avg(qtd),2) as media
from compras;

-- ex 04
select count(idcliente) as quantidade_clientes
from cliente
where estado = 'Rio de Janeiro';

-- ex 05
select round(avg(preco),2) as valor_medio
from produto;

-- ex 06
select count(*) as total_venda
from compras as co
inner join produto as pr
on co.idproduto = pr.idproduto
inner join marca as ma 
on pr.idmarca = ma.idmarca
where ma.nomemarca = 'Bom prato';

-- ex 07 – Recupere a quantidade de produtos comprados na loja Vale Verde
select count(co.qtd) as quantidade 
from compras as co
inner join produto as pr on co.idproduto = pr.idproduto
inner join marca as ma on ma.idmarca = pr.idmarca
where ma.nomemarca = 'Bom prato';

select * from marca;

-- ex 08 Recupere a soma dos produtos comprados em lojas localizadas em Minas Gerais
select sum(qtd) as total_vendas
from compras as co
inner join loja as lo on co.idloja = lo.idloja
where lo.uf = 'MG' ;

-- ex 09 Recupere o quantidade total vendida de Macarrão
update produto set nomeproduto = 'Macarrão'
where idproduto = 5;

select sum(co.qtd) as quantidade_total
from compras as co
inner join produto as po on co.idproduto = po.idproduto
where po.nomeproduto = 'Macarrão';

-- ex 10 Recupere a quantidade total de todas as vendas
select count(*) as total_vendas
from compras;

-- ex 11
select estado, count(*) as qtd
from cliente
group by estado
order by qtd desc;

-- ex 12
select uf, count(*) as total
from loja
group by uf;

-- ex 13 
select nomemarca, count(*) as qtd
from marca as ma
inner join produto as pr on ma.idmarca = pr.idmarca
group by nomemarca;

-- ex 14
select ma.nomemarca, sum(co.qtd * pr.preco) as total
from compras as co
inner join produto as pr on co.idproduto = pr.idproduto
inner join marca as ma on pr.idmarca = ma.idmarca
group by ma.nomemarca;

-- ex 15
select pr.nomeproduto, round(avg(co.qtd),2) as qtd_media
from produto as pr
inner join compras as co on pr.idproduto = co.idproduto
group by pr.nomeproduto
order by qtd_media desc;

-- ex 16
select lo.nomeloja, sum(co.qtd * pr.preco) as faturamento
from loja as lo
inner join compras as co on lo.idloja = co.idloja
inner join produto as pr on co.idproduto = pr.idproduto
group by lo.nomeloja
order by faturamento desc;

-- ex 17 
select cl.nomecliente, sum(co.qtd) as total_produto
from cliente as cl
inner join compras as co on cl.idcliente = co.idcliente
group by cl.nomecliente
order by total_produto desc;

-- ex 18
select cidade, count(*) as qtd 
from cliente
group by cidade
order by qtd desc
limit 5;

-- ex 19 
select pr.nomeproduto, sum(co.qtd) as total
from produto as pr
inner join compras as co on pr.idproduto = co.idproduto
group by pr.nomeproduto
order by total desc;

-- ex 20 
select cl.nomecliente, sum(co.qtd * pr.preco) as gastoTotal
from cliente as cl
inner join compras as co on cl.idcliente = co.idcliente
inner join produto as pr on co.idproduto = pr.idproduto
group by cl.nomecliente
order by gastoTotal desc
limit 5;
order by gastoTotal desc;
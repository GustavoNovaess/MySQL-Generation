-- Criando o banco de dados
create database db_cidade_das_carnes;

-- Referenciando o banco de dados que será utilizado
use db_cidade_das_carnes;

-- Criando a tabela de Categorias
create table tb_categoria2 (
id bigint auto_increment,
tipo_carne varchar(255),
dia_desconto varchar(225),
primary key (id)
);

-- Populando a tabela de categorias
insert into tb_categoria2(tipo_carne,dia_desconto) values
	("Bovino","Sábado e Domingo")
	,("Frango","Quarta e Quinta")
    ,("Porco","Terça")
    ,("Peixe","Segunda")
    ,("Outros","Sexta");
    
select * from tb_categoria2;

-- Criando a tabela de Produtos
create table tb_produtos2 (
id bigint auto_increment,
nome_produto varchar(255),
preco decimal (5,2),
qtdEstoque int,
categoria_id bigint,
primary key(id),
foreign key (categoria_id) references tb_categoria2 (id)
);

-- Populando a tabela de produtos
insert into tb_produtos2(nome_produto,preco,qtdEstoque,categoria_id) values
	("Picanha",21.99,100,1)
    ,("Linguiça",26.99,180,3)
    ,("Coxa de Frango",23.99,120,2)
    ,("Costela Suína", 42.99,80,3)
    ,("Bacalhau",59.99,55,4)
    ,("Presunto",19.99,300,5)
    ,("Coração de Galinha",17.99,72,2)
    ,("Fígado Bovino", 29.99, 125,1);
 
select * from tb_produtos2; 
 
-- Produtos com valor maior do que 50 reais
select * from tb_produtos2 where preco > 50.00;

-- Produtos com valor entre 3 e 60 reais
select * from tb_produtos2 where preco between 3.00 and 60.00;

-- Produtos com a letra C
select * from tb_produtos2 where nome_produto like "%c%";

-- Inner join entre as tabelas categoria e produto
select p.nome_produto,p.preco,p.qtdEstoque as "qtd_Estoque(kg)",c.tipo_carne,c.dia_desconto
	from tb_produtos2 as p inner join tb_categoria2 as c on p.categoria_id = c.id;
    
-- Trazendo todas as carnes bovinas
select p.nome_produto,p.preco,p.qtdEstoque as "qtd_Estoque(kg)",c.tipo_carne,c.dia_desconto
	from tb_produtos2 as p inner join tb_categoria2 as c on p.categoria_id = c.id where p.categoria_id = 1;


-- Criando o banco de dados
create database db_pizzaria_legal;

-- Referenciando o banco de dados que será usado
use db_pizzaria_legal;

-- Criando a tabela de categorias
create table tb_categoria(
id bigint auto_increment,
tipo varchar(255),
dia_desconto varchar(255),
primary key(id)
);

-- Inserção das categorias
insert into tb_categoria(tipo,dia_desconto) values ("Salgada","Quinta e Sábado");
insert into tb_categoria(tipo,dia_desconto) values ("Doce","Sexta e Domingo");
insert into tb_categoria(tipo,dia_desconto) values ("Mista","Segunda, Terça e Quarta");

select * from tb_categoria; 

-- Criando a tabela de pizzas
create table tb_pizza(
id bigint auto_increment,
sabor varchar(255),
tamanho char,
preco decimal(5,2),
acompanhamento boolean,
categoria_id bigint,
primary key(id),
foreign key (categoria_id) references tb_categoria(id)
);

-- Inserção dos dados das pizzas 
insert into tb_pizza(sabor,tamanho,preco,acompanhamento,categoria_id)
	values("Calabresa",'M', 35.00, true, 1);
    
insert into tb_pizza(sabor,tamanho,preco,acompanhamento,categoria_id)
	values("Calabresa",'G', 50.00, true, 1);
    
insert into tb_pizza(sabor,tamanho,preco,acompanhamento,categoria_id)
	values("Frango c/ Catupiry",'G', 50.00, true, 1);
    
insert into tb_pizza(sabor,tamanho,preco,acompanhamento,categoria_id)
	values("Brigadeiro",'P', 23.00, false, 2);
    
insert into tb_pizza(sabor,tamanho,preco,acompanhamento,categoria_id)
	values("Brigadeiro",'M', 35.00, true, 2);
    
insert into tb_pizza(sabor,tamanho,preco,acompanhamento,categoria_id)
	values("Strogonoff de Carne",'M', 35.00, true, 1);

insert into tb_pizza(sabor,tamanho,preco,acompanhamento,categoria_id)
	values("Marguerita com Brigadeiro",'M', 35.00, true, 3);
    
insert into tb_pizza(sabor,tamanho,preco,acompanhamento,categoria_id)
	values("Abacaxi",'P', 23.00, false, 2);


select * from tb_pizza;
-- Produtos com valor maior do que 45 reais
select * from tb_pizza where preco > 45.00;

-- Produtos com valor entre 29 e 60 reais
select * from tb_pizza where preco between 29.00 and 60.00 order by preco;

-- Produtos com a letra C
select * from tb_pizza where sabor like "%C%";

-- Inner Join entre as tabelas de categoria e pizza.
select tb_pizza.sabor,tb_pizza.tamanho, tb_pizza.preco, tb_pizza.acompanhamento, tb_categoria.tipo, tb_categoria.dia_desconto
	from tb_pizza inner join tb_categoria where tb_pizza.categoria_id = tb_categoria.id;

-- Select trazendo todos as pizzas salgadas
select tb_pizza.sabor,tb_pizza.tamanho, tb_pizza.preco, tb_pizza.acompanhamento, tb_categoria.tipo, tb_categoria.dia_desconto
	from tb_pizza inner join tb_categoria where tb_pizza.categoria_id = tb_categoria.id and tb_pizza.categoria_id = 1;
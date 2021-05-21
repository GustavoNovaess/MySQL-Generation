-- Criando um banco de dados
create database db_farmacia_do_bem;

-- Referenciando o banco de dados que será utilizado
use db_farmacia_do_bem;

-- Criando a tabela de categorias
create table tb_categoria(
id bigint auto_increment,
forma varchar(255),
primary key(id)
);

-- População da tabela de categoria
insert into tb_categoria(forma) values ("Comprimido"),("Capsulas"),("Liquido"),("Outros");

select * from tb_categoria;

-- Criando a tabela produto
create table tb_produto(
id bigint auto_increment,
nome varchar(255),
preco decimal(5,2),
prescricao boolean,
categoria_id bigint,
primary key(id),
foreign key(categoria_id) references tb_categoria (id)
);

-- População da tabela de produtos
insert into tb_produto(nome,preco,prescricao,categoria_id) values
("Dipirona", 10.00, false, 1),("Paracetamol", 6.62, false, 1),
("Advil", 36.90, false, 2),("Colirio", 15.59, false,3),
("Binelli",12.90,true,3),("Band-Aid", 14.79, false,4),
("Sertralina",55.00,true,1),("Eno", 7.00, false,4);

-- Produtos com valor maior que 50 reais.
select * from tb_produto where preco > 50;

-- Produtos com valor entre 3 e 60 reais.
select * from tb_produto where preco between 3 and 60;

-- Produtos com a letra B
select * from tb_produto where nome like "%b%";

-- Inner join entre as tabelas de categoria e produto
select p.nome, p.preco,p.prescricao, c.forma 
from tb_produto as p inner join tb_categoria as c on p.categoria_id = c.id;

-- Produtos da forma Comprimido
select p.nome, p.preco,p.prescricao, c.forma 
from tb_produto as p inner join tb_categoria as c on p.categoria_id = c.id and p.categoria_id = 1;
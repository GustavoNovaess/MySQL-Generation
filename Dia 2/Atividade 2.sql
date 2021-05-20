-- Criando o banco de dados
create database db_ecommerce;

-- Referenciando o banco de dados que será usado na criação da tabela
use db_ecommerce;

-- Criando a tabela
create table tb_produtos(
id bigint auto_increment,
nome varchar(255) not null,
preco decimal not null ,
marca varchar(255) not null,
promocao boolean,
primary key(id)
);

-- Inserção dos dados / População da tabela
insert into tb_produtos (nome,preco,marca,promocao) values ("Fone de Ouvido", 74.00, "Sony", true);
insert into tb_produtos (nome,preco,marca,promocao) values ("Mouse", 323.00, "Razer", false);
insert into tb_produtos (nome,preco,marca,promocao) values ("Teclado", 270.00, "Logitech" , true);
insert into tb_produtos (nome,preco,marca,promocao) values ("Cadeira Gamer", 1799.00, "DXRacer", false);
insert into tb_produtos (nome,preco,marca,promocao) values ("Playstation 5", 5000.00, "Sony", false);
insert into tb_produtos (nome,preco,marca,promocao) values ("Galaxy S20", 2159.00, "Samsung", true);
insert into tb_produtos (nome,preco,marca,promocao) values ("iPhone 12" , 5481.00, "Apple", true);
insert into tb_produtos (nome,preco,marca,promocao) values ("Hoverboard", 1299.90, "Samsung", true);

-- Visualização dos dados
select * from tb_produtos where preco > 500;
select * from tb_produtos where preco < 500;

-- Atualizando os dados
update tb_produtos set promocao = true where id = 5;




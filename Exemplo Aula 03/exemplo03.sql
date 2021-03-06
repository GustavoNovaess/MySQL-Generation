create database db_cidade_das_carnes;

use db_cidade_das_carnes;

create table tb_categoria(
id bigint(5) auto_increment,
descricao varchar(255) not null,
ativo boolean not null,
primary key (id)
);

insert tb_categoria (descricao, ativo) values ("Bovino",true);
insert tb_categoria (descricao, ativo) values ("Suino",true);
insert tb_categoria (descricao, ativo) values ("Aves",true);
insert tb_categoria (descricao, ativo) values ("pertence feijoada",true);
insert tb_categoria (descricao, ativo) values ("imbutidos",true);
insert tb_categoria (descricao, ativo) values ("outros",true);

select * from tb_categoria;

create table tb_produtos (
id bigint(5) auto_increment,
nome varchar (255) not null,
preco decimal(5,2) not null,
qtProduto int not null,
categoria_id bigint,
primary key (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categoria (id)
);

insert tb_produtos (nome, preco, qtProduto, categoria_id) values ("ASA",40.00,30,3);
insert tb_produtos (nome, preco, qtProduto, categoria_id) values ("Picanha",20.00,30,1);
insert tb_produtos (nome, preco, qtProduto, categoria_id) values ("coxa de frango",20.00,30,3);
insert tb_produtos (nome, preco, qtProduto, categoria_id) values ("Bacon",30.00,30,1);
insert tb_produtos (nome, preco, qtProduto, categoria_id) values ("hamburguer",60.00,30,5);
insert tb_produtos (nome, preco, qtProduto, categoria_id) values ("Cupim",20.00,30,1);
insert tb_produtos (nome, preco, qtProduto, categoria_id) values ("Peito de frango",25.00,30,3);
insert tb_produtos (nome, preco, qtProduto, categoria_id) values ("Orelha de porco",20.00,30,4);
insert tb_produtos (nome, preco, qtProduto, categoria_id) values ("Salame",18.00,30,5);
insert tb_produtos (nome, preco, qtProduto, categoria_id) values ("medalhao",50.00,30,3);
insert tb_produtos (nome, preco, qtProduto, categoria_id) values ("mocoto",20.00,30,2);
insert tb_produtos (nome, preco, qtProduto, categoria_id) values ("chuleta",20.00,30,1);
insert tb_produtos (nome, preco, qtProduto) values ("acendedor de churrasqueira",20.00,30);
insert tb_produtos (nome, preco, qtProduto) values ("soprador de churrasqueira",35.00,30);

-- Visualiza????o de todos os dados da tabela de produtos
select * from tb_produtos;

-- //////////////// SELECT COM ORDENA????O
-- Ordena????o dos dados na saida de maneira crescente
select * from tb_produtos order by nome;

-- Ordena????o dos dados na saida de maneira decrescente
select * from tb_produtos order by nome DESC;
-- ////////////////////////////////////////////////////////////////



-- ////////////// SELECT COM OPERADOR L??GICO
-- Visualiza????o com operador AND
select * from tb_produtos where preco > 20 and categoria_id = 1;

-- Visualiza????o com operador OR
select * from tb_produtos where preco > 20 or categoria_id = 1;
-- ////////////////////////////////////////////////////////////////




-- //////////// SELECT COM LIKE
-- Visualiza????o dos dados que come??am com a letra P no nome
select * from tb_produtos where nome like "P%";

-- Visualiza????o dos dados que terminam com a letra P no nome
select * from tb_produtos where nome like "%P";

-- Visualiza????o dos dados que tem a letra P no nome
select * from tb_produtos where preco like "%3%";
-- ////////////////////////////////////////////////////////////////




-- //////////////// SELECT COM BETWEEN E IN
-- Visualiza????o dos dados que tem(in) os par??metros passados
select * from tb_produtos where preco in (20,30,40);

-- Visualiza????o dos dados que est?? no intervalo(between) dos par??metros passados
select * from tb_produtos where preco between 20 and 40;
-- ////////////////////////////////////////////////////////////////



-- ////////////////// SELECT COM OPERA????ES MATEM??TICAS
-- Conta quantas linhas tem na tabela
select count(*) from tb_produtos;
-- Tira a m??dia aritm??tica dos elementos de uma coluna da tabela
select avg(preco) from tb_produtos;
-- Soma simples dos elementos de uma coluna da tabela
select sum(preco) from tb_produtos;
-- ////////////////////////////////////////////////////////////////

-- ///////////////// SELECT DO TIPO JOIN
-- Visualiza????o dos elementos em comum entre duas tabelas INNER JOIN
select tb_produtos.nome,tb_produtos.preco,tb_produtos.qtProduto,tb_categoria.descricao
	from tb_produtos inner join tb_categoria on tb_produtos.categoria_id = tb_categoria.id;
    
-- LEFT JOIN
select tb_produtos.nome,tb_produtos.preco,tb_produtos.qtProduto,tb_categoria.descricao
	from tb_produtos left join tb_categoria on tb_produtos.categoria_id = tb_categoria.id order by tb_categoria.descricao;
    
-- RIGHT JOIN
select tb_produtos.nome,tb_produtos.preco,tb_produtos.qtProduto,tb_categoria.descricao
	from tb_produtos right join tb_categoria on tb_produtos.categoria_id = tb_categoria.id;


-- ////////////////////////////////////////////////////////////////


-- //select tb_produtos.nome,tb_produtos.preco,tb_produtos.qtProduto,tb_categoria.descricao from tb_produtos inner join tb_categoria on tb_produtos.categoria_id = tb_categoria.id;

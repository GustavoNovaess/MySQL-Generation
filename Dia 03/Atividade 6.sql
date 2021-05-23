-- Criando o banco de dados
create database db_cursoDaMinhaVida;

-- Referenciando o banco de dados que será utilizado
use db_cursoDaMinhaVida;

-- Criando a tabela de categoria
create table tb_categoria(
id bigint auto_increment,
categoria varchar(255),
bimestre_promocao varchar(255),
primary key (id)
);

-- Populando a tabela de categoria
insert into tb_categoria(categoria,bimestre_promocao) values
	("Informática", "1° Bimestre")
    ,("Línguas Estrangeiras", "2° Bimestre")
    ,("Cursos Civis", "3° Bimestre")
    ,("Vestibular", "4° Bimestre")
    ,("Outros", "----------");
    
select * from tb_categoria;

-- Criando a tabela de produtos
create table tb_produtos(
id bigint auto_increment,
curso varchar(255),
preco decimal (6,2),
duracao varchar(255),
categoria_id bigint,
primary key(id),
foreign key (categoria_id) references tb_categoria(id)
);

-- Populando a tabela de produtos
insert into tb_produtos(curso,preco,duracao,categoria_id) values
	("Desenvolvimento de Software", 199.99, "2 anos e meio",1)
    ,("Inglês",149.99,"4 anos",2)
    ,("Preparatório Vestibular", 162.99, "3 meses",4)
    ,("Curso Preparatório de Bombeiro Civil", 99.99,"6 meses",3)
    ,("Curso Preparatório de Policial Civil", 99.99,"6 meses",3)
    ,("Manutenção de Hardware",189.90, "2 anos e meio",1)
    ,("Principios do Empreendedorismo", 99.99, "1 ano", 5)
    ,("Francês", 129.99, "4 anos",2);
    
select * from tb_produtos;

-- Produtos com valor maior do que 50 reais
select * from tb_produtos where preco > 50;

-- Produtos com valor entre 3 e 60 reais
select * from tb_produtos where preco between 3 and 60;

-- Inner Join entre a tabela de categoria e produto
select p.curso,p.preco as "mensalidade", p.duracao,c.categoria,c.bimestre_promocao 
	from tb_produtos as p inner join tb_categoria as c on p.categoria_id = c.id;
    
-- Trazendo os produtos da categoria Informática
select p.curso,p.preco as "mensalidade", p.duracao,c.categoria,c.bimestre_promocao 
	from tb_produtos as p inner join tb_categoria as c on p.categoria_id = c.id where p.categoria_id = 1;

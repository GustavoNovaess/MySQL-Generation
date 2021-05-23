-- Criando o banco de dados
create database db_construindo_a_nossa_vida;

-- Referenciando o banco de dados que será utilizado
use db_construindo_a_nossa_vida;

-- Criando a tabela de categoria
create table tb_categoria(
id bigint auto_increment,
categoria varchar(255),
desconto_a_vista boolean,
primary key(id)
);

-- Populando a tabela de categoria
insert into tb_categoria(categoria,desconto_a_vista) values
	("Materiais Elétricos",true)
    ,("Materiais Hidráulicos", false)
    ,("Pisos",true)
    ,("Tintas",true)
    ,("Outros", false);

select * from tb_categoria;

-- Criando a tabela de produtos
create table tb_produto(
id bigint auto_increment,
produto varchar(255),
preco decimal(6,2),
qtd_Estoque int,
categoria_id bigint,
primary key(id),
foreign key (categoria_id) references tb_categoria (id)
);

-- Populando a tabela de produtos
insert into tb_produto(produto,preco,qtd_Estoque,categoria_id) values
	("Pacote de Pregos 100 uni.", 15.00, 150, 5)
    ,("Pacote de Parafusos 100 uni.",15.00,150,5)
    ,("Tinta Suvinil Fosco Completo", 161.29,30,4)
    ,("Piso Madeira Brilhante", 53.87,20,3)
    ,("Lâmpada Fluorescente 24w", 18.90,50,1)
    ,("Cano PVC para Esgoto 150mm", 129.99, 10,2)
    ,("Tinta Eucatex Brilho Cinza Urbano",153.89,30,4)
    ,("Piso Cerâmico Acetinado", 49.04,25,3);
    
select * from tb_produto;

-- Produtos com valor maior do que 50 reais
select * from tb_produto where preco > 50;

-- Produtos com valor entre 3 e 60 reais
select * from tb_produto where preco between 3 and 60;

-- Inner join entre a tabela de produto e categoria
select p.produto,p.preco,p.qtd_Estoque,c.categoria,c.desconto_a_vista as "desconto" 
	from tb_produto as p inner join tb_categoria as c on p.categoria_id = c.id;
    
-- Trazendo todos os produtos da categoria Tintas
select p.produto,p.preco,p.qtd_Estoque,c.categoria,c.desconto_a_vista as "desconto" 
	from tb_produto as p inner join tb_categoria as c on p.categoria_id = c.id where p.categoria_id = 4;
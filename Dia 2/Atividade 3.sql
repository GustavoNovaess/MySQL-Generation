-- Criando o banco de dados
create database db_escola;

-- Referenciando o banco de dados que será usado na criação da tabela
use db_escola;

-- Criando a tabela
create table tb_alunos(
id bigint auto_increment,
nome varchar(255) not null,
serie varchar(255) not null,
turma varchar(255) not null,
nota double not null,
primary key(id)
);

-- Inserindo dados 
insert into tb_alunos(nome,serie,turma,nota) values 
	("Gustavo", "9° ano", "9-A", 9.5)
    ,("Giovanna","7° ano", "7-B", 6.2)
    ,("Denis","7° ano","7-A", 3.7)
    ,("Otávio", "8° ano", "8-C", 2.5) 
	,("Valdemir", "9° ano", "9-A", 8.1)
    ,("Wagner","6° ano", "6-A", 1.2)
    ,("Leandro", "6° ano", "6-C", 10.0)
    ,("Jefferson", "8° ano", "8-B", 5.7); 
    
-- Visualização de dados
select * from tb_alunos where nota > 7;
select * from tb_alunos where nota < 7;

-- Atualizacao dos dados
update tb_alunos set nota = 4 where id = 4;
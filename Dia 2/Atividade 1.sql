-- Criando banco de dados
create database db_RH;

-- Acessa o Banco de Dados, use é usado para referenciar qual banco de dados será usado
use db_RH; 

-- Criando tabela
create table tb_funcionares(
id bigint auto_increment,
nome varchar(255),
setor varchar(255),
cargo varchar(255),
salario decimal(5,2),
primary key(id)
);


-- Inserção de dados / Populando a tabela
insert into tb_funcionares(nome,setor,cargo,salario) values ("Gustavo Novaes","Desenvolvimento","Desenvolvedor Java Jr.", 1801.00);
insert into tb_funcionares(nome,setor,cargo,salario) values ("Amanda Barreto","Administrativo","Gerente", 7000.00);
insert into tb_funcionares(nome,setor,cargo,salario) values ("José da Silva","Desenvolvimento","Desenvolvedor Sênior", 4900.00);
insert into tb_funcionares(nome,setor,cargo,salario) values ("Roberto Miranda","Administrativo","CEO", 25680.00);
insert into tb_funcionares(nome,setor,cargo,salario) values ("Juliana Prado","Financeiro","Contador", 3750.00);

-- Visualização da tabela
select * from tb_funcionares;
select * from tb_funcionares where salario > 2000.00;
select * from tb_funcionares where salario < 2000.00;

-- Alterar um tipo de variável na tabela
alter table tb_funcionares modify salario decimal(6,2);

-- Atualizando os dados da tabela
update tb_funcionares set salario = 3500 where id = 5;
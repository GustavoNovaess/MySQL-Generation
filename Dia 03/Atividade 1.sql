-- Criação do banco de dados
create database db_generation_game_online;

-- Referenciando o banco de dados que será usado
use db_generation_game_online;

-- Criando a tabela classes
create table tb_classes (
id bigint auto_increment,
classe varchar(255),
tipo_dano varchar(255),
hp_regen decimal(2,1),
primary key (id)
);

-- População da tabela de classes
insert into tb_classes(classe,tipo_dano,hp_regen) values ("Warrior","Físico",1.3);
insert into tb_classes(classe,tipo_dano,hp_regen) values ("Wizard", "Mágico", 1.0);
insert into tb_classes(classe,tipo_dano,hp_regen) values ("Cleric", "Mágico", 1.1);
insert into tb_classes(classe,tipo_dano,hp_regen) values ("Paladin", "Físico/Mágico", 1.5);
insert into tb_classes(classe,tipo_dano,hp_regen) values ("Archer", "Físico", 1.2); 

select * from tb_classes;

-- Criando a tabela personagens
create table tb_personagens (
id bigint auto_increment,
nick varchar(255),
nivel int,
hp int,
attack int,
defense int,
special int,
speed int,
classe_id bigint,
primary key (id),
FOREIGN KEY (classe_id) references tb_classes(id)
);

-- População da tabela de personagens
insert into tb_personagens(nick,nivel,hp,attack,defense,special,speed,classe_id)
	values ("Cassie", 27, 15568, 2125, 1327, 1500, 2536,5);
    
insert into tb_personagens(nick,nivel,hp,attack,defense,special,speed,classe_id)
	values ("Oliver", 55, 28600, 1315, 2023, 5000, 1813,2);
    
insert into tb_personagens(nick,nivel,hp,attack,defense,special,speed,classe_id)
	values ("Hendrik", 35, 32785, 2878, 2687, 1023, 915,1);
    
insert into tb_personagens(nick,nivel,hp,attack,defense,special,speed,classe_id)
	values ("Chung", 62, 53850, 2750, 4314, 2152, 519,4);
    
insert into tb_personagens(nick,nivel,hp,attack,defense,special,speed,classe_id)
	values ("Rab", 31, 18568, 1620, 2329, 3678, 1756,3);
    
insert into tb_personagens(nick,nivel,hp,attack,defense,special,speed,classe_id)
	values ("Erdrick", 99, 78525, 12360, 10563, 6215, 4780,1);
    
insert into tb_personagens(nick,nivel,hp,attack,defense,special,speed,classe_id)
	values ("Elesis", 99, 99999, 7020, 14759, 6230, 2740,4);
    
insert into tb_personagens(nick,nivel,hp,attack,defense,special,speed,classe_id)
	values ("Swaine", 1, 1000, 400, 150, 250, 600,5);

select * from tb_personagens;

-- Personagens com ataque maior do que 2000
select * from tb_personagens where attack > 2000;

-- Personagens com defesa entre 1000 e 2000
select * from tb_personagens where defense between 1000 and 2000;

-- Personagens com a letra C
select * from tb_personagens where nick like "C%";

-- Inner Join das tabelas de classe e personagem
select tb_personagens.nick,tb_personagens.nivel, tb_personagens.hp, tb_personagens.attack, tb_personagens.defense, tb_personagens.special, tb_personagens.speed, tb_classes.classe, tb_classes.hp_regen
	from tb_personagens inner join tb_classes where tb_personagens.classe_id = tb_classes.id order by tb_classes.classe,tb_personagens.nivel DESC;

-- Select de todos os personagens da classe Archer
select tb_personagens.nick,tb_personagens.nivel, tb_personagens.hp, tb_personagens.attack, tb_personagens.defense, tb_personagens.special, tb_personagens.speed, tb_classes.classe, tb_classes.hp_regen
	from tb_personagens inner join tb_classes where tb_personagens.classe_id = tb_classes.id and tb_personagens.classe_id = 5 order by tb_classes.classe,tb_personagens.nivel DESC;
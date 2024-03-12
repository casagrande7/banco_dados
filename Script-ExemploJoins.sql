drop database if exists tipos_joins;

create database tipos_joins;

use tipos_joins;

create table cores (
id int not null auto_increment,
cor varchar(50),
primary key (id)
);

create table frutas (
id int not null auto_increment primary key,
frutas varchar(50)
);

create table cores_frutas (
frutas_id int not null,
cores_id int not null,
primary key (frutas_id, cores_id),
constraint fk_frutas_cores_frutas foreign key (frutas_id) references frutas (id),
constraint fk_cores_cores_frutas foreign key (cores_id) references cores (id)
);

insert into tipos_joins.cores (cor) values ('Vermelho'),
('Amarelo'), ('Verde');

select id, cor from cores c;

insert into tipos_joins.frutas (frutas) values ('Maçã'), ('Banana'), ('Maracujá'), ('Jaca'), ('Limão'), ('Goiaba');

select id, frutas from frutas f;

/* Cross join é um tipo especial de junção em que cada linha de uma tabela é combinada com todas as linhas de um aputra tabela.
Isso resulta em um produto cartesiano entre duas tabelas, ou seja, todas as combinações possíveis de linhas são produzidas.
Por exemplo: Temos duas tabelas, uma chamada cores e outra chamada frutas e queremos encontrar todas as combinações possíveis 
de cores e frutas.
 */
select cores_id, c.cor,  frutas_id, f.frutas  from cores_frutas cf inner join cores c on cf.cores_id = c.id
inner join frutas f on cf.frutas_id = f.id ;
insert into cores_frutas (cores_id, frutas_id) 
select c.id as cores_id, f.id as frutas_id  from cores c cross join frutas f;











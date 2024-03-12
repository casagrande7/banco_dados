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



create table clientes (
id int,
nome varchar(50),
primary key(id)
);

create table pedidos (
id int,
cliente_id int,
dt_pedido date,
primary key(id),
constraint fk_cliente_pedidos foreign key(cliente_id) references clientes(id)
);

insert into clientes (id, nome) values (1, 'João'), (2, 'Maria'), (3, 'Pedro'), (4, 'Juvenal'), (5, 'Carlos'), (6, 'Marcos');
select id, nome from clientes c;

insert into pedidos (id, cliente_id, dt_pedido) values (101, 1, '2024-03-01'), (102, 1, '2024-03-05'), (103, 2, '2024-03-02'), 
(104, 3 ,'2024-03-03'), (105, 3, '2024-03-07'), (106, 4, '2024-03-06'), (107, 2, '2024-03-08'), (108, 5, '2024-03-09'), 
(109, 5, '2024-03-10');

insert into pedidos (id, dt_pedido) values (110, '2024-03-11');

/*
 * INNER JOIN: Retorna registros quando há pelo menos uma correspondência em ambas as tabelas
 */
select c.id, c.nome, p.id,  p.dt_pedido, p.cliente_id from pedidos p inner join clientes c on p.cliente_id = c.id;
/*
 * Neste exemplo, estamos selecionando todas as colunas das tabelas (clientes e pedidos) onde há uma correspodência entre o
 * id na tabela clientes e o cliente_id na tabela pedidos */

/*
 * LEFT JOIN: Retorna todos os registros da tabela da esquerda (primeira tabela mencionada) e os registros correspondetes
 * da tabela da direita (segunda tebala mencionada).*/

select c.id, c.nome, p.id,  p.dt_pedido, p.cliente_id from clientes c left join pedidos p on c.id = p.cliente_id;
/* Aqui estamos selecionando todos os registros da tabela clientes e os registros correspondentes da tebela pedidos, 
 * se houver, com base na correspondência de id e cliente_id*/

/* RIGHT JOIN: Retorna todos os registros da tabela da direita (segunda tabela mencionada) e os registros correspondentes 
 * da tabela da esquerda (primeira tabela mencionada).*/

select c.id, c.nome, p.id,  p.dt_pedido, p.cliente_id from clientes c right join pedidos p on c.id = p.cliente_id;
/* Este comando retorna todos os registros da tabela pedidos e os registros correnpodentes da tabela clientes, se houver,
 * com base na correspondência de id e cliente_id*/







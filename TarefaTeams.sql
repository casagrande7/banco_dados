-- apagar database caso exista
DROP DATABASE IF EXISTS pizzaria;

-- criar databaes senão existir
CREATE DATABASE IF NOT EXISTS pizzaria;

USE pizzaria;

-- Tabela CLIENTE
 CREATE TABLE IF NOT EXISTS clientes (
 cliente_id INTEGER AUTO_INCREMENT,
 telefone VARCHAR(14),
 nome VARCHAR(30),
 logradouro VARCHAR(30),
 numero DECIMAL(5,0),
 complemento VARCHAR(30),
 bairro VARCHAR(30),
 referencia VARCHAR(30),
 PRIMARY KEY (cliente_id)
 );
 
 -- Tabela PIZZA
 CREATE TABLE IF NOT EXISTS pizzas (
    pizza_id INTEGER AUTO_INCREMENT,
    nome VARCHAR(30),
    descricao VARCHAR(30),
    valor DECIMAL(4 , 2 ),
    PRIMARY KEY (pizza_id)
 );
 
 -- Tabela PEDIDO
 CREATE TABLE IF NOT EXISTS pedidos (
    pedido_id INTEGER AUTO_INCREMENT,
    cliente_id INTEGER,
    data DATETIME,
    valor DECIMAL(4 , 2 ),
        PRIMARY KEY (pedido_id),
    FOREIGN KEY (cliente_id)
        REFERENCES clientes (cliente_id)
 );
 
 -- Tabela ITEM_PEDIDO
 CREATE TABLE IF NOT EXISTS item_pedido (
    pedido_id INTEGER,
    pizza_id INTEGER,
    quantidade DECIMAL(2 , 0 ),
    valor DECIMAL(5 , 2 ),
    FOREIGN KEY (pizza_id)
        REFERENCES pizzas (pizza_id),
    FOREIGN KEY (pedido_id)
        REFERENCES pedidos (pedido_id)
 );

-- Inserir Clientes
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, NULL, 'Bela Vista', 'Em frente a escola');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(22) 2222-2222','Bruna Dantas', 'Rua das Rosas',222,NULL,'Cantareira',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(33) 3333-3333','Bruno Vieira', 'Rua das Avencas',333,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(44) 4444-4444','Giulia Silva', 'Rua dos Cravos',444,NULL,'Cantareira','Esquina do mercado');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(55) 5555-5555','José Silva', 'Rua das Acácias',555,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(66) 6666-6666','Laura Madureira','Rua das Gardências',666,NULL,'Cantareira',NULL);

-- Inserir Pizzas
INSERT INTO pizzas (nome, valor) VALUES ('Portuguesa', 15);
INSERT INTO pizzas (nome, valor) VALUES ('Provolone', 17);
INSERT INTO pizzas (nome, valor) VALUES ('4 Queijos', 20);
INSERT INTO pizzas (nome, valor) VALUES ('Calabresa', 17);
INSERT INTO pizzas (nome) VALUES ('Escarola');

-- Inserir Pedidos
INSERT INTO pedidos (pedido_id, cliente_id, data, valor) VALUES (1, 1, '2016-12-15 20:30:00', 32.00);
INSERT INTO pedidos (pedido_id, cliente_id, data, valor) VALUES (2, 2, '2016-12-15 20:38:00', 40.00);
INSERT INTO pedidos (pedido_id, cliente_id, data, valor) VALUES (3, 3, '2016-12-15 20:59:00', 22.00);
INSERT INTO pedidos (pedido_id, cliente_id, data, valor) VALUES (4, 1, '2016-12-17 22:00:00', 42.00);
INSERT INTO pedidos (pedido_id, cliente_id, data, valor) VALUES (5, 2, '2016-12-18 19:00:00', 45.00);
INSERT INTO pedidos (pedido_id, cliente_id, data, valor) VALUES (6, 3, '2016-12-18 21:12:00', 44.00);
INSERT INTO pedidos (pedido_id, cliente_id, data, valor) VALUES (7, 4, '2016-12-19 22:22:00', 72.00);
INSERT INTO pedidos (pedido_id, cliente_id, data, valor) VALUES (8, 6, '2016-12-19 22:26:00', 34.0);

-- Inserir Item_pedido ;
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 1, 1, 15.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 4, 1, 17.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (2, 3, 2, 40.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (3, 5, 1, 22.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (4, 3, 1, 20.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (4, 5, 1, 22.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (5, 1, 3, 45.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (6, 5, 2, 44.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (7, 1, 2, 30.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (7, 3, 1, 20.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (7, 5, 1, 22.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (8, 4, 2, 34.00);



/*
 create trigger <nome> <quando> <acao> on <tabela> for each row
 begin
 <comando 1>
 <comando 2>
 end;
 * */
-- Nome é o nome do gatilho quando determina se o gatilho é desparado antes (before) ou depois (after) se concluída.
-- Ação é representada pelos comandos insert, update e delete

create table log(
id_log int auto_increment primary key,
data_hora datetime default current_timestamp,
tabela varchar(50),
atividade varchar(10),
id int not null,
aux varchar(1000)
);

delimiter //
create trigger cliente_inc after insert on clientes for each row
begin
	insert into log(data_hora, tabela, atividade, id, aux)
	values (current_timestamp(), 'clientes', 'Insert', new.cliente_id,
	concat('Nome:', new.nome, ', Telefone:', new.telefone, ', Logradouro', new.logradouro, ', Bairro:', new.bairro));
end//
delimiter ;

insert into clientes(nome, telefone, logradouro, numero, bairro)
values ('Judite', '(77) 1234-5678', 'Rua dos Pinheiros', '777', 'Jardins');
select *from log;

delimiter //
create trigger cliente_alt after update on clientes for each row
begin
	insert into log(data_hora, tabela, atividade, id, aux)
	values (current_timestamp(), 'clientes', 'Update', old.cliente_id,
	concat('Nome:', old.nome, ', Telefone:', old.telefone, ', Logradouro', old.logradouro, ', Bairro:', old.bairro));

	insert into log(data_hora, tabela, atividade, id, aux)
	values (current_timestamp(), 'clientes', 'Update', new.cliente_id,
	concat('Nome:', new.nome, ', Telefone:', new.telefone, ', Logradouro', new.logradouro, ', Bairro:', new.bairro));
end//
delimiter ;

update clientes set telefone = '(88) 9874-6542',
bairro = 'Centro Velho'
where cliente_id = 7;
select *from log;

delimiter //
create trigger cliente_del after delete on clientes for each row
begin
	insert into log(data_hora, tabela, atividade, id, aux)
	values (current_timestamp(), 'clientes', 'Delete', old.cliente_id,
	concat('Nome:', old.nome, ', Telefone:', old.telefone, ', Logradouro', old.logradouro, ', Bairro:', old.bairro));
end//
delimiter ;
delete from clientes where cliente_id = 7;
select *from log;

/*1. Exercício: Crie uma view que liste todos os clientes da pizzaria.*/
create view clientesPizzaria as 
select nome, telefone, logradouro, numero, complemento, bairro, referencia from clientes c;
select *from clientesPizzaria;

/*2. Exercício: Crie uma função que retorne o total gasto por um cliente específico. 
 * Obs.: deve ser informado o id do cliente por parâmetro.*/
delimiter //
create function total_gasto(id int)
returns int
begin
	declare gasto_total int;
	select sum(valor) into gasto_total from pedidos p where pedido_id = id;
    return gasto_total;
end//
delimiter ; 

select total_gasto(2);

/*3. Exercício: Crie um trigger que atualize o valor total do pedido sempre que 
um novo item_pedido for inserido.*/
delimiter //
create trigger valor_total_alt after insert on item_pedido for each row
begin
	update pedidos
	set valor = valor + (new.quantidade * new.valor)
	where pedido_id =  new.pedido_id;
end//
delimiter ;

insert into item_pedido(pedido_id, pizza_id, quantidade, valor) 
values(8, 2, 3, 10.00);
select *from pedidos p ;
select *from item_pedido ip where pedido_id = 8;

/*4. Exercício: Crie um trigger que atualize o valor total do pedido sempre que 
um item_pedido for atualizado.*/
delimiter //
create trigger valor_total_udt after update on item_pedido for each row
begin
	update pedidos
	set new.valor = valor + (new.quantidade * new.valor)
	where pedido_id =  new.pedido_id;
end//
delimiter ;

update item_pedido set pizza_id = 2,
quantidade = 4,
where pedido_id = 1;
select *from item_pedido ip ;






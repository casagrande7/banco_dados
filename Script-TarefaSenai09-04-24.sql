create database lanchonete;

use lanchonete;

create table clientes (
id int not null auto_increment,
nome varchar(255) not null,
email varchar(255) not null unique,
endereco varchar(255) not null,
telefone varchar(11) not null,
cpf varchar(11) not null unique,
senha varchar(45) not null,
primary key (id)
);

create table pedidos (
id int not null auto_increment,
data_pedido date not null,
status varchar(45),
clientes_id int not null,
primary key (id),
constraint fk_cliente_pedidos foreign key(clientes_id) references clientes(id)
);

create table produtos (
id int not null auto_increment,
nome varchar(255) not null,
ingredientes varchar(255) not null,
preco decimal(10.2) not null,
imagem varchar(45)not null,
primary key(id)
);

create table produtos_pedidos (
produtos_id int not null,
pedidos_id int not null,
primary key(produtos_id, pedidos_id),
constraint fk_produtos_pedidos_produtos foreign key (produtos_id) references produtos(id),
constraint fk_produtos_pedidos_pedidos foreign key (pedidos_id) references pedidos (id)
);
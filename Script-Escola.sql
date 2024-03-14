create database escola;

use escola;

create table alunos (
id int not null auto_increment,
nome varchar(45) not null,
dt_nascimento date not null,
endereco varchar(45) not null,
rm int not null,
primary key (id)
);

create table professores (
id int not null auto_increment,
nome varchar(45) not null,
especialidade varchar(45) not null,
grau_academico varchar(45) not null,
primary key(id)
);

create table disciplinas (
id int not null auto_increment,
nome varchar(45) not null,
professores_id int not null,
primary key(id),
constraint fk_professores_disciplinas foreign key(professores_id) references professores (id)
);

create table alunos_disciplinas (
alunos_id int not null,
disciplina_id int not null,
primary key (alunos_id, disciplina_id),
constraint fk_alunos_alunos_disciplinas foreign key (alunos_id) references alunos (id),
constraint fk_disciplina_alunos_disciplinas foreign key (disciplina_id) references disciplinas (id)
);

create table notas (
id int not null auto_increment,
notas decimal(15.2) not null,
disciplinas_id int not null,
alunos_id int not null,
primary key (id),
constraint fk_disciplinas_notas foreign key (disciplinas_id) references disciplinas (id),
constraint fk_alunos_notas foreign key (alunos_id) references alunos (id)
);

-- Inserção de dados na tabela alunos:
insert into alunos (nome, dt_nascimento, endereco, rm) values ('João Pedro1', '2006-08-08', 'Armando Puerta 15-22' , '3339');
insert into alunos (nome, dt_nascimento, endereco, rm) values ('João Pedro2', '2006-08-07', 'Armando Puerta 15-22' , '3000');
insert into alunos (nome, dt_nascimento, endereco, rm) values ('João Pedro3', '2006-08-15', 'Armando Puerta 15-22' , '4000');
insert into alunos (nome, dt_nascimento, endereco, rm) values ('João Pedro4', '2006-08-06', 'Armando Puerta 15-22' , '3338');
insert into alunos (nome, dt_nascimento, endereco, rm) values ('João Pedro5', '2007-08-06', 'Armando Puerta 15-22' , '3337');
insert into alunos (nome, dt_nascimento, endereco, rm) values ('João Pedro6', '2005-08-06', 'Armando Puerta 15-22' , '3336');
insert into alunos (nome, dt_nascimento, endereco, rm) values ('João Pedro7', '2004-08-06', 'Armando Puerta 15-22' , '3335');
insert into alunos (nome, dt_nascimento, endereco, rm) values ('João Pedro8', '2003-08-06', 'Armando Puerta 15-22' , '3334');
insert into alunos (nome, dt_nascimento, endereco, rm) values ('João Pedro9', '2002-08-06', 'Armando Puerta 15-22' , '3333');
insert into alunos (nome, dt_nascimento, endereco, rm) values ('João Pedro10', '2001-08-06', 'Armando Puerta 15-22' , '3332');
insert into alunos (nome, dt_nascimento, endereco, rm) values ('João Pedro11', '2002-08-06', 'Armando Puerta 15-22' , '3331');
insert into alunos (nome, dt_nascimento, endereco, rm) values ('João Pedro12', '2002-08-06', 'Armando Puerta 15-22' , '3330');
insert into alunos (nome, dt_nascimento, endereco, rm) values ('João Pedro13', '2009-08-06', 'Armando Puerta 15-22' , '3329');
insert into alunos (nome, dt_nascimento, endereco, rm) values ('João Pedro14', '2010-08-06', 'Armando Puerta 15-22' , '3328');
insert into alunos (nome, dt_nascimento, endereco, rm) values ('João Pedro15', '2006-08-06', 'Armando Puerta 15-22' , '3327');
insert into alunos (nome, dt_nascimento, endereco, rm) values ('João Pedro16', '2006-08-06', 'Armando Puerta 15-22' , '3326');
insert into alunos (nome, dt_nascimento, endereco, rm) values ('João Pedro17', '2015-08-06', 'Armando Puerta 15-22' , '3325');
insert into alunos (nome, dt_nascimento, endereco, rm) values ('João Pedro18', '2006-08-06', 'Armando Puerta 15-22' , '3324');
insert into alunos (nome, dt_nascimento, endereco, rm) values ('João Pedro19', '2006-08-06', 'Armando Puerta 15-22' , '3323');
insert into alunos (nome, dt_nascimento, endereco, rm) values ('João Pedro20', '2006-08-06', 'Armando Puerta 15-22' , '3322');

select id, nome, dt_nascimento, endereco , rm from alunos a;

-- Inserção de dados na tabela professores:
insert into professores (nome, especialidade, grau_academico) values ('Michel', 'Matemática', 'Mestrado');
insert into professores (nome, especialidade, grau_academico) values ('Anderson', 'Geografia', 'Mestrado');
insert into professores (nome, especialidade, grau_academico) values ('Raquel', 'Língua Portuguesa', 'Mestrado');
insert into professores (nome, especialidade, grau_academico) values ('Antônio', 'Biologia', 'Mestrado');

select id, nome, especialidade, grau_academico from professores p;

-- Inserção de dados na tabela disciplina:
insert into disciplinas (nome, professores_id) values ('Matemática', 1);
insert into disciplinas (nome, professores_id) values ('Física', 1);
insert into disciplinas (nome, professores_id) values ('Geografia', 2);
insert into disciplinas (nome, professores_id) values ('Língua Portguesa', 3);
insert into disciplinas (nome, professores_id) values ('Biologia', 4);

select id, nome, professores_id from disciplinas d;

-- Inserção de dados na tabela alunos_disciplinas:
insert into alunos_disciplinas (alunos_id, disciplina_id) values (1, 1);
insert into alunos_disciplinas (alunos_id, disciplina_id) values (2, 1);
insert into alunos_disciplinas (alunos_id, disciplina_id) values (3, 1);



-- Inserção de dados na tabela notas:
insert into notas (disciplinas_id, alunos_id, notas) values (1, 1, 9.5);
insert into notas (disciplinas_id, alunos_id, notas) values (1, 2, 9.5);
insert into notas (disciplinas_id, alunos_id, notas) values (1, 3, 9.5);
insert into notas (disciplinas_id, alunos_id, notas) values (1, 4, 9.5);
insert into notas (disciplinas_id, alunos_id, notas) values (1, 5, 9.5);
insert into notas (disciplinas_id, alunos_id, notas) values (1, 6, 9.5);
insert into notas (disciplinas_id, alunos_id, notas) values (1, 7, 9.5);
insert into notas (disciplinas_id, alunos_id, notas) values (1, 8, 9.5);
insert into notas (disciplinas_id, alunos_id, notas) values (1, 9, 9.5);
insert into notas (disciplinas_id, alunos_id, notas) values (1, 10, 9.5);
insert into notas (disciplinas_id, alunos_id, notas) values (1, 11, 9.5);
insert into notas (disciplinas_id, alunos_id, notas) values (1, 12, 9.5);
insert into notas (disciplinas_id, alunos_id, notas) values (1, 13, 9.5);
insert into notas (disciplinas_id, alunos_id, notas) values (1, 14, 9.5);
insert into notas (disciplinas_id, alunos_id, notas) values (1, 15, 9.5);
insert into notas (disciplinas_id, alunos_id, notas) values (1, 16, 9.5);
insert into notas (disciplinas_id, alunos_id, notas) values (1, 17, 9.5);
insert into notas (disciplinas_id, alunos_id, notas) values (1, 18, 9.5);
insert into notas (disciplinas_id, alunos_id, notas) values (1, 19, 9.5);
insert into notas (disciplinas_id, alunos_id, notas) values (1, 20, 9.5);
insert into notas (disciplinas_id, alunos_id, notas) values (2, 1, 8);
insert into notas (disciplinas_id, alunos_id, notas) values (2, 2, 8);
insert into notas (disciplinas_id, alunos_id, notas) values (3, 1, 9);
insert into notas (disciplinas_id, alunos_id, notas) values (3, 2, 9);
insert into notas (disciplinas_id, alunos_id, notas) values (4, 1, 7);
insert into notas (disciplinas_id, alunos_id, notas) values (4, 2, 7);
insert into notas (disciplinas_id, alunos_id, notas) values (5, 1, 9);
insert into notas (disciplinas_id, alunos_id, notas) values (5, 2, 9);

select n.id, n.alunos_id, a.nome ,n.disciplinas_id, d.nome , n.notas from notas n inner join disciplinas d on n.disciplinas_id = d.id
inner join alunos a on n.alunos_id = a.id;


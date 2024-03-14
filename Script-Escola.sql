drop database if exists escola;

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
insert into professores (nome, especialidade, grau_academico) values ('Léo', 'Educação Física', 'Doutorado');

select id, nome, especialidade, grau_academico from professores p;

-- Inserção de dados na tabela disciplina:
insert into disciplinas (nome, professores_id) values ('Matemática', 1);
insert into disciplinas (nome, professores_id) values ('Física', 1);
insert into disciplinas (nome, professores_id) values ('Geografia', 2);
insert into disciplinas (nome, professores_id) values ('Língua Portguesa', 3);
insert into disciplinas (nome, professores_id) values ('Biologia', 4);
insert into disciplinas (nome, professores_id) values ('Educação Física', 5);

delete from disciplinas where professores_id = 5; 

select id, nome, professores_id from disciplinas d;

-- Inserção de dados na tabela alunos_disciplinas:

insert into alunos_disciplinas (disciplina_id, alunos_id) 
select d.id as disciplina_id, a.id as alunos_id from disciplinas d cross join alunos a;

-- Selecionar todos os alunos e mostrar em quais disciplinas os alunos está cadastrado:

select ad.disciplina_id,d.nome, ad.alunos_id, a.nome, a.rm  from alunos_disciplinas ad inner join disciplinas d on ad.disciplina_id = d.id
inner join alunos a on ad.alunos_id = a.id;

-- Pesquisa por alunos matriculados em uma disciplina específica:

select ad.disciplina_id,d.nome, ad.alunos_id, a.nome from alunos_disciplinas ad inner join disciplinas d on ad.disciplina_id = d.id
inner join alunos a on ad.alunos_id = a.id where d.nome = 'Matemática';

-- Selecionar professor de uma disciplina específica:
select d.id, d.nome, d.professores_id, p.nome from disciplinas d inner join professores p on d.professores_id = p.id 
where d.nome = 'Matemática';


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
insert into notas (disciplinas_id, alunos_id, notas) values (2, 3, 5);
insert into notas (disciplinas_id, alunos_id, notas) values (2, 4, 4);
insert into notas (disciplinas_id, alunos_id, notas) values (2, 6, 0);
insert into notas (disciplinas_id, alunos_id, notas) values (2, 7, 3);
insert into notas (disciplinas_id, alunos_id, notas) values (3, 1, 9);
insert into notas (disciplinas_id, alunos_id, notas) values (3, 2, 9);
insert into notas (disciplinas_id, alunos_id, notas) values (4, 1, 7);
insert into notas (disciplinas_id, alunos_id, notas) values (4, 2, 7);
insert into notas (disciplinas_id, alunos_id, notas) values (5, 1, 9);
insert into notas (disciplinas_id, alunos_id, notas) values (5, 2, 9);


select n.id, n.alunos_id, a.nome ,n.disciplinas_id, d.nome , n.notas from notas n inner join disciplinas d on n.disciplinas_id = d.id
inner join alunos a on n.alunos_id = a.id;

-- 1. Selecionar todos os alunos e mostrar em quais disciplinas os alunos está cadastrado:

select ad.disciplina_id,d.nome, ad.alunos_id, a.nome, a.rm  from alunos_disciplinas ad inner join disciplinas d on ad.disciplina_id = d.id
inner join alunos a on ad.alunos_id = a.id;

-- 2. Pesquisa por alunos matriculados em uma disciplina específica:

select ad.disciplina_id,d.nome, ad.alunos_id, a.nome from alunos_disciplinas ad inner join disciplinas d on ad.disciplina_id = d.id
inner join alunos a on ad.alunos_id = a.id where d.nome = 'Matemática';

-- 3. Selecionar professor de uma disciplina específica:

select d.id, d.nome, d.professores_id, p.nome from disciplinas d inner join professores p on d.professores_id = p.id 
where d.nome = 'Matemática';

-- 4. Selecionar notas dos alunos em uma disciplina específica, exibir a nota, nome do aluno e a disciplina:

select n.id, n.alunos_id, a.nome ,n.disciplinas_id, d.nome , n.notas from notas n inner join disciplinas d on n.disciplinas_id = d.id
inner join alunos a on n.alunos_id = a.id where d.nome = 'Matemática';

/* 5. Selecionar alunos que têm notas superiores ou igual a um determinado valor, exibir os campos nome do aluno, disciplina 
e a nota (por exemplo quando a nota for  superior ou igual a 7)*/

select n.id, n.alunos_id, a.nome ,n.disciplinas_id, d.nome , n.notas from notas n inner join disciplinas d on n.disciplinas_id = d.id
inner join alunos a on n.alunos_id = a.id where n.notas >= 7;

/* 6. Selecionar alunos que têm notas superiores ou igual a um determinado valor em uma  disciplina específica 
(por exemplo, com código de disciplina 'MAT101' e nota superior a 7)*/

select n.id, n.alunos_id, a.nome ,n.disciplinas_id, d.nome , n.notas from notas n inner join disciplinas d on n.disciplinas_id = d.id
inner join alunos a on n.alunos_id = a.id where n.notas >= 7 and d.nome = 'Língua Portguesa';

/* 7. Selecionar alunos que têm notas superiores a um determinado valor em uma  disciplina específica 
(por exemplo, com código de disciplina 'MAT101' e nota superior a 7).*/

select n.id, n.alunos_id, a.nome ,n.disciplinas_id, d.nome , n.notas from notas n inner join disciplinas d on n.disciplinas_id = d.id
inner join alunos a on n.alunos_id = a.id where n.notas > 7 and d.nome = 'Física';

/* 8. Selecionar alunos que têm notas inferior a um determinado valor, exibir os campos nome do aluno, disciplina e a nota 
(por exemplo quando a nota for inferior a 7)*/

select n.id, n.alunos_id, a.nome ,n.disciplinas_id, d.nome , n.notas from notas n inner join disciplinas d on n.disciplinas_id = d.id
inner join alunos a on n.alunos_id = a.id where n.notas < 7;

-- 9. Selecionar alunos com base em sua data de nascimento (por exemplo, alunos nascidos após 2000)
select a.id, a.nome, a.dt_nascimento, a.endereco , a.rm from alunos a where a.dt_nascimento > 2000;

/* 10. Selecionar disciplinas que não têm notas registradas (Para garantir que todos os alunos tenham suas notas registradas, 
é necessário identificar as disciplinas em que as notas ainda não foram registradas. Escreva uma consulta SQL que retorne o nome 
das disciplinas sem notas registradas)*/

delete from notas where notas = 9;

select d.id ,d.nome, d.professores_id, n.disciplinas_id, n.notas from disciplinas d left join notas n on d.id = n.disciplinas_id 
where isnull(n.notas);

/* 11. Selecionar alunos com base na especialidade do professor que ministra a disciplina em que estão matriculados 
(O departamento de orientação acadêmica deseja identificar os alunos matriculados em disciplinas ministradas por professores 
especializados em uma determinada área, como "Geografia". Escreva uma consulta SQL que retorne o nome dos alunos matriculados 
nessas disciplinas).*/

select a.id, a.nome, ad.disciplina_id, d.nome, p.nome  from alunos a 
inner join alunos_disciplinas ad on ad.alunos_id = a.id 
inner join disciplinas d on ad.disciplina_id = d.id 
inner join professores p on p.id = d.professores_id 
where p.especialidade = 'Geografia';

/* 12. Selecionar alunos matriculados em disciplinas ministradas por professores com um determinado grau acadêmico 
(por exemplo, todos os alunos matriculados em disciplinas ministradas por professores com doutorado, O departamento
de planejamento acadêmico deseja identificar os alunos matriculados em disciplinas ministradas por professores que possuem doutorado.
Escreva uma consulta SQL que retorne o nome dos alunos matriculados nessas disciplinas)*/

select a.id, a.nome, ad.disciplina_id, d.nome, p.nome  from alunos a 
inner join alunos_disciplinas ad on ad.alunos_id = a.id 
inner join disciplinas d on ad.disciplina_id = d.id 
inner join professores p on p.id = d.professores_id 
where p.grau_academico = 'Mestrado';

/* 13. Selecionar disciplinas que não têm professores atribuídos utilizando LEFT JOIN 
(Para otimizar a alocação de recursos, é necessário identificar quais disciplinas ainda não têm professores atribuídos.
Escreva uma consulta SQL que retorne o nome das disciplinas sem professores atribuídos)*/

select d.id, d.nome , d.professores_id, p.nome  from  disciplinas d left join professores p on d.id = p.id
where isnull(d.professores_id); 




 
















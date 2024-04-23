-- Apagar base de dados caso exista.
drop database if exists escola;

-- Criar a base de dados
create database escola;
 
-- Selecionar a base de dados
use escola;

-- Criar tabela de alunos.
create table alunos(
id_aluno int not null auto_increment,
nome varchar(100) not null,
data_nascimento date,
endereco varchar(255),
primary key(id_aluno)
);

-- Criar tabela de prfessores.
create table professores(
id_professor int not null auto_increment,
nome varchar(100) not null,
especialidade varchar(100),
grau_academico varchar(100),
primary key(id_professor)
);

-- Criar tabela disciplinas.
create table disciplinas(
id_disciplina int not null auto_increment,
nome varchar(100) not null,
id_professor int,
primary key(id_disciplina),
foreign key (id_professor) references professores(id_professor)
);

-- Criar tabela notas
create table notas (
id_nota int not null auto_increment,
id_aluno int not null,
id_disciplina int not null,
nota decimal(4,2) not null,
primary key(id_nota),
foreign key (id_aluno) references alunos(id_aluno),
foreign key (id_disciplina) references disciplinas (id_disciplina)
);

-- Criar tabela matrícula.
create table matriculas (
ano int not null,
id_aluno int not null,
id_disciplina int not null,
primary key (ano, id_aluno, id_disciplina),
foreign key (id_aluno) references alunos(id_aluno),
foreign key (id_disciplina) references disciplinas(id_disciplina)
);


drop database if exists escola;

create database escola;

use escola;

create table alunos (
id int auto_increment,
nome varchar(50),
idade int,
primary key(id)
);

insert into alunos(nome, idade) values
('João', 20),
('Maria', 22),
('Carlos', 19);

select *from alunos a;

-- VIEW
/*View é uma representação virtual de uma tabela baseada em uma consulta sql.
 * Ela permite simplificar consultas complexas e reutilizar a lógica de consulta*/
-- create view <nome> as <pesquisa>;
create view alunosMaioresDe20 as select nome, idade from alunos  where idade > 20;
select *from alunosmaioresde20;

create view alunosMenoresDe20 as select nome, idade from alunos where idade < 20;
select *from alunosMenoresDe20;

alter view alunosmaioresde20 as select nome, idade, year(now())- idade as ano_nascimento from alunos where idade > 20;
select *from alunosmaioresde20;

alter view alunosmenoresde20 as select nome, idade, year(now()) - idade as ano_nascimento from alunos where idade < 20;
select *from alunosmenoresde20;

create view alunosIdade20 as select nome, idade from alunos a where idade = 20;
select *from alunosidade20;

alter view alunosidade20 as select nome, idade, year(now()) - idade as ano_nascimento from alunos a where idade = 20;
select *from alunosidade20;


-- FUNCTION
/*São blocos de códigos reutilizáveis que realizam uma tarefa específica.
 * Pode-se usá-las para simplificar consultas, cálculos ou manipulação de dados*/
delimiter //
create function calculaMediaIdade()
returns decimal(5,2)
begin
	declare media decimal(5,2);
select avg(idade) into media from alunos a;
return media;
end //
delimiter ;

select calculaMediaIdade() as mediaIdade;
select id, nome, idade, calculaMediaIdade() as mediaIdade from alunos a ;


delimiter //
create function calcular_idade(data_nascimento date)
returns int
begin
	declare idade int;
    declare data_atual date;
    set data_atual = curdate();
   set idade = year(data_atual) - year(data_nascimento);
  if month(data_atual) < month(data_nascimento) or (
  month(data_atual) = month(data_nascimento) and day(data_atual) < day(data_nascimento)
  )then
  set idade = idade - 1;
  end if;
  return idade;
end //
delimiter ;

select calcular_idade('2007-04-19');










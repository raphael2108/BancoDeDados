-- Banco de dados condominios
create database condominios;
use condominios;
create table condominios(
codigocondominios int primary key,
abreviatura varchar(50),
descricao varchar(50)
);

select * from condominios
ORDER BY abreviatura DESC;

SELECT ABREVIATURA, CODIGOCONDOMINIOS FROM CONDOMINIOS;

select * from condominios where abreviatura = "ametista";

SELECT CONCAT(abreviatura," ", descricao) as abreviatura_com_descricao FROM empreendimentosimoveis.condominios limit 2 offset 1;

insert into condominios (codigocondominios, abreviatura, descricao)
values(2131, "rubi", "construcao condominio predial rubi"),
(2132, "safira", "construcao condominio predial safira"),
(2133, "ametista", "construcao condominio predial ametista"),
(2134, "topazio", "construcao condominio predial topazio");

create table empregados(
codigoempregados int primary key,
nome varchar(50),
codigocondominios int,
constraint FK_codigocondominiosempregados FOREIGN KEY (codigocondominios)
REFERENCES condominios(codigocondominios)
);

insert into empregados (codigocondominios, codigoempregado, nome)
values (2133, 1, "Leonidas"),
(2134, 2, "Epaminondas");

select COUNT(*) from empregados;

create table cargos(
codigocargos int primary key,
descricao varchar(50),
salario int,
codigoempregado int,
constraint FK_codigocargosempregado FOREIGN KEY (codigoempregado)
references empregados (codigoempregado)
);

insert into cargos (codigoempregado, codigocargos, descricao, salario)
values ( 1, 1, "zelador", 1018),
(2, 2, "fazedor de L", 1018);

create table setores(
codigosetores int primary key,
descricao varchar(50),
codigoempregado int,
constraint FK_codigosetoresempregado FOREIGN KEY (codigoempregado)
references empregados (codigoempregado)
);

insert into setores (codigoempregado, codigosetores, descricao)
values (1, 1, "zeladoria"),
(2, 2, "sindicato");

select * from setores

SELECT c.codigocondominios, abreviatura, descricao, nome, codigoempregados
FROM condominios AS c
INNER JOIN empregados AS e
ON c.codigocondominios = e.codigocondominios;

SELECT c.codigocondominios, abreviatura, descricao, nome, codigoempregados
FROM condominios AS c
LEFT JOIN empregados AS e
ON c.codigocondominios = e.codigocondominios;

SELECT c.codigocondominios, abreviatura, descricao, nome, codigoempregados
FROM condominios AS c
RIGHT JOIN empregados AS e
ON c.codigocondominios = e.codigocondominios;

drop table setores;




-- Banco de dados Sakila
use sakila;

select * from film;

select length from film;

select rating from film;
select replacement_cost from film;
SELECT length FROM FILM;

SELECT rating, AVG(length)
FROM sakila.film
GROUP BY rating;

SELECT rating, MIN(replacement_cost)
FROM sakila.film
GROUP BY rating;

SELECT rating, MAX(replacement_cost)
FROM sakila.film
GROUP BY rating;

SELECT rating, SUM(replacement_cost)
FROM sakila.film
GROUP by rating;

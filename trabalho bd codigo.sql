create database condominios;
use condominios;
create table condominios(
codigocondominios int primary key,
abreviatura varchar(50),
descricao varchar(50)
);

select * from condominios;

insert into condominios (codigocondominios, abreviatura, descricao)
values (2133, "ametista", "construcao condominio predial ametista"),
(2134, "topazio", "construcao condominio predial topazio");

drop table condominios;

create table empregados(
codigoempregados int primary key,
nome varchar(50),
codigocondominios int,
constraint FK_codigocondominiosempregados FOREIGN KEY (codigocondominios)
REFERENCES condominios(codigocondominios)
);

drop table empregados;

select * from empregados;

insert into empregados (codigocondominios, codigoempregado, nome)
values (2133, 1, "Leonidas"),
(2134, 2, "Epaminondas");


create table cargos(
codigocargos int primary key,
descricao varchar(50),
salario int,
codigoempregado int,
constraint FK_codigocargosempregado FOREIGN KEY (codigoempregado)
references empregados (codigoempregado)
);

drop table cargos;

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

drop table setores;

insert into setores (codigoempregado, codigosetores, descricao)
values (1, 1, "zeladoria"),
(2, 2, "sindicato");

select * from setores



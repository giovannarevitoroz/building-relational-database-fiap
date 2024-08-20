Aula 1 - 20/08/24

--comentarios delinha
/*comentarios varias linhas*/

-- DDL - Data Definition Language

Parte 1 - comandos DDL - estrutura

Data Definition Language

Create -  cria tabelas
alter - altera estrutura pronta
drop - apaga tabelas

Tabela - Funcionario
    mat_func - N - 4 - Pk
    nm_func - A - 30 - Nn
    dt_adm - D - Nn
    salario - N - 8,2
    sexo - C - 1 - Nn
    
    
Criando tabelas:

--constraint - regra

Sintaxe: create table table_name (column_name1 datatype(size) [constraint],
                                 (column_name2 datatype(size) [constraint],
                                 .............................);
                                 
obs: constraint é opcional, nem todas as colunas tem

Exibindo a estrutura de uma tabela

desc funcionario;

criando tabela funcionario:

create table funcionario (mat_func Number(4) Primary key,
                          nm_func varchar(30) Not null,
                          dt_adm Date Not null,
                          salario Number(10,2),
                          sexo Char(1) Not null);
                          
                          
CREATE TABLE funcionario_2024
(mat_fun Number(4) constraint func_mat_pk Primary key,
 nm_fun  varchar(30) constraint func_nm_nn Not null,
 dt_adm  Date constraint func_dt_nn Not null,
 salario Number(10,2),
 sexo    Char(1) constraint func_sx_nn not null);
 
 desc funcionario_2024;
 
 Relacionamentos: 1 - N - criando a FK
 
 Tabela cargo - cd_cargo - N - 4 - FK
                nm_cargo - A - 25 - Nn, Uk --unique
                salario - N - 8,2
                
    
create table cargo (
                    cd_cargo Number(4) constraint cargo_cd_fk1 Primary Key,
                    nm_cargo Varchar(25) constraint cargo_nm_nn1 Not null
                                         constraint cargo_nm_uk1 unique,
                    salario  Number(10,2)
                    );
                    
desc cargo;
                    
drop table funcionario_2024;

CREATE TABLE funcionario_2024
(mat_fun Number(4) constraint func_mat_pk Primary key,
 nm_fun  varchar(30) constraint func_nm_nn Not null,
 dt_adm  Date constraint func_dt_nn Not null,
 salario Number(10,2),
 sexo    Char(1) constraint func_sx_nn not null,
 fk_cargo number(4) constraint func_cargo_fk references cargo);
 
 
 create table curso
 (cd_curso number(3) constraint curso_cd_pk primary key,
  nm_curso varchar(30) constraint curso_nm_nm not null,
                       constraint curso_nm_uk unique,
  preco    number(6,2) constraint curso_preco_nn not null);
  
  
CREATE TABLE diciplina
(cd_disc number(4) constraint disc_cd_pk primary key,
nm_disc varchar(30) constraint disc_nm_nn not null,
                    constraint disc_nm_uk unique,
carga_hra number(4) constraint disc_carg_nn not null);
  
  
create table curso_diciplina
( PRIMARY KEY (cd_curso, cd_disc),
  FOREIGN KEY (cd_curso) REFERENCES curso(cd_curso),
  FOREIGN KEY (cd_disc) REFERENCES diciplina(cd_disc)
  );
create table cliente
(id_cliente char(6) constraint clie_id_pk primary key,
 nm_cliente varchar(30) constraint clie_nm_nn not null,
 sm_cliente varchar(50) constraint clie_sm_nn not null);
 
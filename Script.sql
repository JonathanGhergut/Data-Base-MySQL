##############################################################
################# CREAZIONE BASE DI DATI #####################
##############################################################
#####	Gruppo formato da:								   ###
#####	MATRICOLA 7029445 COGNOME: Valeri NOME: Martohan   ###
#####	MATRICOLA 7029448 COGNOME: Ghergut NOME: Jonathan ###
##############################################################
SET GLOBAL local_infile=1;
drop database if exists ProgettoBasket;
create database if not exists ProgettoBasket;
use ProgettoBasket;

drop table if exists Giocatore;
create table if not exists Giocatore (
	cf varchar(16) primary key,
    nome varchar(20),
    cognome varchar(20) not null,
    partite int,
    punti int
) engine = innodb;


insert into Giocatore values
("BKYJCK98P11G999S", "Jack", "Barkley", 89, 7895),
("BSTNMRK96Y08I35R", "Mark", "Basten", 244, 3465),
("YUGJNS97E15Z678T", "Jonas", "Young", 123, 6783),
("CMYSPN01D22Q674A", "Stephen", "Cambry", 100, 7352),
("KLYALN00U09T776S", "Allen", "Klay", 99, 7245),
("ISNJMS02T06H289R", "James", "Iverson", 34, 7895),
("TTMTMS03S31D249H", "Thomas", "Tatum", 57, 2452),
("JNRLIG78P13G939I", "Iling", "Junior", 78, 2456);

drop table if exists Squadra;
create table if not exists Squadra (
	p_iva varchar(10) primary key,
    nome varchar(40),
    citta varchar(40)
) engine = innodb;

insert into Squadra values
("0071034" , "Boston Celtics" , "Boston"),
("0070244" , "Los Angeles Lakers" , "Los Angeles"),
("0075067" , "Los Angeles Clippers" , "Los Angeles"),
("0077033" , "Brooklyn Nets" , "New York"),
("0070884" , "Philadelphia 76" , "Philadelphia"),
("0070968" , "Devener Nuggets" , "Denver"),
("0070336" , "GoldeState Warriors" , "Oakland"),
("0075050" , "New York Knicks" , "New York"),
("0070367" , "Chicago Bulls" , "Chicago"),
("0070234" , "San Antonio Spurs" , "San Antonio"),
("0078904" , "Charlotte Hornets" , "Charlotte");


drop table if exists Gioca;
create table if not exists Gioca (
	id_partita int,
    sq_casa varchar(30),
    sq_ospite varchar(30),
    data date,
    cf varchar(16),
    foreign key (cf)
		references Giocatore (cf), 
	foreign key (id_partita)
		references Partita (id_partita)
) engine = innodb;
insert into Gioca values
(1,"Boston Celtics", "New York Knicks", "2023-09-23", "BKYJCK98P11G999S"),
(1,"Brooklyn Nets", "Philadelphia 76", "2023-10-22", "BSTNMRK96Y08I35R"),
(2,"Brooklyn Nets", "Chicago Bulls", "2023-10-22", "BSTNMRK96Y08I35R"),
(3,"Brooklyn Nets", "Philadelphia 76", "2023-10-22", "BSTNMRK96Y08I35R"),
(3,"Los Angeles Clippers", "Charlotte Hornets", "2023-01-09", "YUGJNS97E15Z678T"),
(3,"New York Knicks", "Los Angeles Clippers", "2023-08-21", "YUGJNS97E15Z678T"),
(3,"San Antonio Spurs", "Chicago Bulls", "2023-01-09", "KLYALN00U09T776S"),
(4,"Chicago Bulls", "Philadelphia 76", "2023-01-04", "KLYALN00U09T776S"),
(5,"GoldeState Warriors", "Los Angeles Lakers", "2023-02-02", "CMYSPN01D22Q674A"),
(1,"Devener Nuggets", "San Antonio Spurs", "2023-03-03", "ISNJMS02T06H289R"),
(3,"Los Angeles Lakers", "Charlotte Hornets", "2023-04-07", "CMYSPN01D22Q674A"),
(2,"Philadelphia 76", "GoldeState Warriors", "2023-11-08", "TTMTMS03S31D249H"),
(4,"Boston Celtics", "Devener Nuggets", "2023-09-09", "BKYJCK98P11G999S"),
(3,"San Antonio Spurs", "New York Knicks", "2023-06-04", "ISNJMS02T06H289R"),
(6,"Charlotte Hornets", "Boston Celtics", "2023-05-01", "BKYJCK98P11G999S"),
(5,"Devener Nuggets", "San Antonio Spurs", "2023-03-03", "TTMTMS03S31D249H"),
(5,"GoldeState Warriors", "Los Angeles Lakers", "2023-02-02", "CMYSPN01D22Q674A"),
(6,"Devener Nuggets", "San Antonio Spurs", "2023-03-03", "ISNJMS02T06H289R"),
(6,"Los Angeles Lakers", "Charlotte Hornets", "2023-04-07", "CMYSPN01D22Q674A"),
(6,"Philadelphia 76", "GoldeState Warriors", "2023-11-08", "JNRLIG78P13G939I"),
(5,"Boston Celtics", "New York Knicks", "2023-09-23", "BKYJCK98P11G999S");

drop table if exists Partita;
create table if not exists Partita (
	id_partita int auto_increment,
	sq_casa varchar(30),
    sq_ospite varchar(30),
    data date not null,
    punti_casa int,
    punti_ospite int,
    primary key (id_partita)
) engine = innodb;

insert into Partita values
(1,"Boston Celtics", "New York Knicks", "2023-09-23", 89, 123),
(2,"Brooklyn Nets", "Philadelphia 76", "2023-10-22", 129, 133),
(3,"Los Angeles Clippers", "Charlotte Hornets", "2023-01-09", 78, 99),
(4,"San Antonio Spurs", "Chicago Bulls", "2023-01-09", 122, 158),
(5,"Chicago Bulls", "Philadelphia 76", "2023-01-04", 90, 143),
(6,"GoldeState Warriors", "Los Angeles Lakers", "2023-02-02", 93, 113),
(7,"Devener Nuggets", "San Antonio Spurs", "2023-03-03", 79, 111),
(8,"Los Angeles Lakers", "Charlotte Hornets", "2023-04-07", 90, 110),
(9,"Philadelphia 76", "GoldeState Warriors", "2023-11-08", 89, 98),
(10,"Boston Celtics", "Devener Nuggets", "2023-09-09", 83, 90),
(11,"San Antonio Spurs", "New York Knicks", "2023-06-04", 69, 83),
(12,"Charlotte Hornets", "Boston Celtics", "2023-05-01", 120, 142),
(13,"New York Knicks", "Los Angeles Clippers", "2023-08-21", 90, 91),
(14,"Brooklyn Nets", "Chicago Bulls", "2023-10-22", 112, 128);

drop table if exists Fan;
create table if not exists Fan (
	codice_tifoso int(5) primary key auto_increment,
    eta int(5),
    sesso varchar(5),
    nome varchar(20),
    cognome varchar(20)
) engine = innodb;

insert into Fan values
(223 , 33 , "uomo ", "Mario ", "Chiarini "),
(224 , 65 , "uomo ", "Giacomo ", "Rizzo"),
(225, 18, "donna", "Fabiana ", "Dotti "),
(226 , 15 , "uomo ", " Andrea", "Viviani "),
(227 , 17 , "uomo", "Filippo ", "Panza "),
(228 , 19 , "uomo ", " Mario", "Bianchi "),
(229 , 55 , "donna", "Viola ", "Baroncelli "),
(230 , 45 , "donna", "Giovanna ", "Innocenti "),
(231 , 33 , "uomo ", "Davide ", "Scarpi "),
(232 , 23 , "uomo ", "Luca ", " Giorgi"),
(233 , 62 , "donna", "Chiara ", " Bellini ");

drop table if exists Merchandising;
create table Merchandising(
	cod_articolo varchar(20) primary key,
    categoria varchar(20),
    prezzo int(3)
    );
    

load data local infile 
'C:/Users/root/Desktop/Merchandising.txt' into table Merchandising	# INSERIRE IL PROPRIO FILE PATH
fields terminated by ";"
lines terminated by '\n';
 
drop table if exists Compra;
create table Compra(
	codice_tifoso int(5),
    codice_articolo varchar(20),
    foreign key (codice_tifoso) references Fan(codice_tifoso),
    foreign key (codice_articolo) references Merchandising(cod_articolo));
    
insert into Compra values
(223, 121),
(224, 435),
(233, 980),
(231, 452),
(227, 134),
(230, 121),
(224, 991),
(228, 907),
(233, 249),
(225, 234),
(229, 435);

drop table if exists VenditaMerch;
create table VenditaMerch(
	p_iva_squadra varchar(10),
    cod_articolo varchar(20),
    data date,
    foreign key (p_iva_squadra) references Squadra(p_iva),
    foreign key (cod_articolo) references Merchandising(cod_articolo));

insert into VenditaMerch values
("0070234", 121, "2023-09-23"),
("0070234", 234, "2023-01-01"),
("0070884", 134, "2023-08-15"),
("0070367", 249, "2023-06-22"),
("0070336", 435, "2023-12-12"),
("0071034", 452, "2023-12-25"),
("0078904", 907, "2023-11-03"),
("0075067", 980, "2023-01-03"),
("0070244", 991, "2023-12-20");

drop table if exists Sponsor;
create table Sponsor(
	p_iva varchar(20) primary key,
    nome varchar(10),
    via varchar(20),
    cap int,
    città varchar(10));


insert into Sponsor values
("0034022" , "Adidas", "Stefan Muller" , 47831, "Dortmund"),
("0035124" , "Nike", "Street 56" , 68932, "New York"),
("0032244" , "Puma", "Thomas Getze", 45636 , "Berlin"),
("0034909", "Umbro", "Street 78", 99031 , "London"),
("0033584" , "Kappa", "Antonio Ferrucci" , 58200 , "Bologna"),
("0037968" , "Mizuno", "Kyoto Mory" , 34987 , "Tokyo"),
("0038367" , "Macron", "Antonio Catani", 59442 , "Milano");

drop table if exists Accordo;
create table Accordo(
	p_iva_squadra varchar(20),
    p_iva_sponsor varchar(20),
    denaro_accordo int,
    foreign key (p_iva_squadra) references Squadra(p_iva),
    foreign key (p_iva_sponsor) references Sponsor(p_iva));

insert into Accordo values
("0071034" , "0034022" , 670900),
("0070244" , "0035124" , 98200),
("0075067" , "0034022" , 575000),
("0077033" , "0037968" , 480000),
("0070884" , "0033584" , 350500),
("0070968" , "0038367" , 350000),
("0070336" , "0032244" , 780900),
("0075050" , "0034022"  , 470300),
("0070367" , "0034022"  , 500500),
("0070234" , "0034909" , 420000),
("0078904" , "0035124" , 340600);

drop table if exists Posto;
create table Posto(
	id_posto int primary key auto_increment,
    prezzo int,
    tipologia varchar(20),
    p_iva varchar(20),
    foreign key (p_iva) references Squadra (p_iva)
    );

insert into Posto values
(234, 190, "Abbonamento Mensile", "0070234"),
(374, 542, "Abbonamento Annuale", "0070244"),
(575, 138, "Abbonamento Mensile", "0070336"),
(684, 90, "Singolo Biglietto", "0070336"),
(246, 200, "Abbonamento Mensile", "0070336"),
(567, 66, "Singolo Biglietto", "0070884"),
(422, 780, "Abbonamento Annuale", "0070884"),
(420, 45, "Singolo Biglietto", "0070884"),
(553, 150, "Abbonamento Mensile", "0070884"),
(690, 678, "Abbonamento Annuale", "0075067"),
(223, 30, "Singolo Biglietto", "0075067");

drop table if exists PostoRiservato;
create table PostoRiservato(
	p_iva_squadra varchar(20),
	id_posto int primary key,
    foreign key (p_iva_squadra) references Squadra(p_iva));
 
insert into PostoRiservato values
("0071034" , 234 ),
("0070244" , 223 ),
("0075067" , 246),
("0077033" , 374 ),
("0070884" , 420 ),
("0070968" , 422 ),
("0070336" , 553 ),
("0075050" , 567 ),
("0070367" , 575),
("0070234" , 684),
("0078904" , 690);

drop table if exists ContrattoPassato;
create table ContrattoPassato(
	data_assunzione date,
    data_fineContratto date,
    cf varchar(20),
    p_iva_squadra varchar(20),
    foreign key (cf) references Giocatore(cf),
    foreign key (p_iva_squadra) references Squadra(p_iva));


insert into ContrattoPassato values
("2022-01-20", "2022-10-22", "BKYJCK98P11G999S","0071034"),
("2020-10-22", "2021-11-28", "CMYSPN01D22Q674A","0077033"),
("2021-08-21", "2023-11-24", "KLYALN00U09T776S","0078904"),
("2021-09-22", "2022-09-22", "JNRLIG78P13G939I","0070968");

drop table if exists ContrattoCorrente;
create table if not exists ContrattoCorrente(
	data_assunzione date,
    stipendio int,
    cf varchar(20),
    p_iva_squadra varchar(20),
    foreign key (cf) references Giocatore(cf),
    foreign key (p_iva_squadra) references Squadra(p_iva)
    );
    
insert into ContrattoCorrente values
("2030-02-20", 110000, "BKYJCK98P11G999S","0071034"),
("2031-11-22", 120000, "CMYSPN01D22Q674A","0077033"),
("2031-08-21", 140000, "KLYALN00U09T776S","0078904"),
("2031-10-22", 200000, "JNRLIG78P13G939I","0070968");

#drop table if exists AcquistaPosto;
create table if not exists AcquistaPosto(
	data_inizio date,
    data_fine date,
    codice_tifoso int(5),
    id_posto int,
    foreign key (codice_tifoso) references Fan(codice_tifoso),
    foreign key (id_posto) references Posto(id_posto)
);

insert into AcquistaPosto values
('2030-02-20','2030-02-20', 223, 223),
('2030-02-20','2030-03-20', 224, 246),
('2030-02-20','2030-02-20', 225, 420);

########################################################
################# QUERY ################################
########################################################
select * from Giocatore;
drop view if exists Giocatore2;
create view Giocatore2 as select cf as cf2, nome as nome2, cognome as cognome2, partite as partite2, punti as punti2 from Giocatore;
select cf, nome, cognome, punti from Giocatore where punti not in (select distinct punti from Giocatore join Giocatore2 on punti < punti2);

select cf as CodiceFiscale, count(cf) as NumeroPartite from Gioca group by cf;

select nome, cognome, eta, sesso from Fan
join AcquistaPosto on AcquistaPosto.codice_tifoso = Fan.codice_tifoso
where AcquistaPosto.data_inizio between '2029-01-01' and  '2030-12-12';

select count(*), Merchandising categoria from Merchandising 
join VenditaMerch on Merchandising.cod_articolo = VenditaMerch.cod_articolo
group by Merchandising.categoria;

drop view if exists AccordoView;
create view AccordoView as 
select Squadra.p_iva, nome, sum(Accordo.denaro_accordo) as "S1" from Squadra 
join Accordo on Accordo.p_iva_squadra = Squadra.p_iva
group by Accordo.p_iva_squadra;  

drop view if exists PostoView;
create view PostoView as
select p_iva, sum(prezzo) as "S2" from Posto
group by p_iva;

drop view if exists MerchandisingView;
create view MerchandisingView as
select VenditaMerch.p_iva_squadra, sum(prezzo) as "S3" from Merchandising
join VenditaMerch on VenditaMerch.cod_articolo = Merchandising.cod_articolo
group by VenditaMerch.p_iva_squadra;
select * from MerchandisingView;

select PostoView.p_iva, (sum(S1)+sum(S2)+sum(S3)) from PostoView
join AccordoView on PostoView.p_iva = AccordoView.p_iva
join MerchandisingView on MerchandisingView.p_iva_squadra = PostoView.p_iva
group by PostoView.p_iva;

########################################################
############### PROCEDURE E FUNZIONI ###################
########################################################
DELIMITER $$
drop procedure if exists SquadraAttuale $$
create procedure SquadraAttuale(in cf varchar(20), in nome varchar(20), out nome_squadra varchar(20))
begin
declare tmp varchar(20);
select Squadra.nome into tmp
from Squadra 
join ContrattoCorrente on ContrattoCorrente.p_iva_squadra = Squadra.p_iva
join Giocatore on Giocatore.cf = ContrattoCorrente.cf
where Giocatore.cf = cf;
set nome_squadra = tmp;
end $$
DELIMITER ;
# --START TRANSACTION
call SquadraAttuale("BKYJCK98P11G999S", "Jack", @squadra_attuale);
select @squadra_attuale;

drop procedure if exists GiocatoreRicerca;
DELIMITER $$
create procedure GiocatoreRicerca(in iniziale varchar(1), out numero int)
begin
declare tmp varchar(20);
select count(nome) into tmp
from Giocatore where nome like "%s";
set numero = tmp;
end $$
DELIMITER ;
# --START TRANSACTION
call GiocatoreRicerca('s', @numero);
select @numero;

########################################################
############### TRIGGER ################################
########################################################
delimiter $$
create trigger CancellaGiocatore
after delete on Giocatore
for each row
begin 
	insert into Fan(nome, cognome)
    values (OLD.nome, OLD.cognome);
end $$
delimiter ;

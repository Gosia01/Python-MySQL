create database hotel;
use hotel;
select database();
show tables;
create table goscie(
id_goscia int auto_increment,
imie varchar(25) not null,
nazwisko varchar(30) not null,
nr_dowodu varchar(9) not null unique,
primary key (id_goscia));
drop table goscie;
create table rodzaj_pokoju(
id_nr_pokoju int auto_increment,
standard varchar(20),
ilosc_osob int not null,
cena_p float not null,
primary key(id_nr_pokoju)
);
drop table rodzaj_pokoju;
create table sniadania(
id_sniadania int auto_increment,
ilosc_s int,
cena_s int,
id_goscia int,
primary key(id_sniadania)
);
drop table sniadania;
create table obiadokolacje(
id_obiadokol int auto_increment,
ilosc_o int,
cena_o int,
id_goscia int,
primary key(id_obiadokol)
);
drop table obiadokolacje;
create table pakiet_SPA(
id_SPA int auto_increment,
ilosc_SPA int,
cena_SPA int,
id_goscia int,
primary key(id_SPA)
);
drop table pakiet_SPA;
create table parking(
id_parkingu int auto_increment,
ilosc_parkingu int,
cena_parkingu int,
id_goscia int,
primary key(id_parkingu)
);
drop table parking;
create table rodzaj_platnosci (
id_rplatnosci int auto_increment,
rplatnosci varchar(20) not null,
primary key(id_rplatnosci)
);
drop table rodzaj_platnosci;
create table rezerwacje (
id_rezerwacje int auto_increment,
data_przyjazdu date not null,
data_wyjazdu date not null,
id_goscia int,
id_nr_pokoju int,
id_rplatnosci int,
primary key(id_rezerwacje)
);
drop table rezerwacje;
create table logowanie_goscia(
login_goscia varchar(25),
haslo_goscia varchar(25),
id_goscia int
);
drop table logowanie_goscia;
create table logowanie_admin(
id_admin int auto_increment,
login_admin varchar(25),
haslo_admin varchar(25),
primary key(id_admin)
);
drop table logowanie_admin;

create table goscie_rezerwacje(
id_goscia int,
id_rezerwacje int,
foreign key(id_goscia) references goscie (id_goscia),
foreign key(id_rezerwacje) references rezerwacje (id_rezerwacje)
);
drop table goscie_rezerwacje;
create table rodzaj_pokoju_rezerwacje(
id_nr_pokoju int,
id_rezerwacje int,
foreign key(id_nr_pokoju) references rodzaj_pokoju (id_nr_pokoju),
foreign key(id_rezerwacje) references rezerwacje (id_rezerwacje)
);
drop table rodzaj_pokoju_rezerwacje;
create table rodzaj_platnosci_rezerwacje(
id_rplatnosci int,
id_rezerwacje int,
foreign key(id_rplatnosci) references rodzaj_platnosci (id_rplatnosci),
foreign key(id_rezerwacje) references rezerwacje (id_rezerwacje)
);
drop table rodzaj_pokoju_rezerwacje;
create table sniadania_goscie(
id_sniadania int,
id_goscia int,
foreign key(id_sniadania) references sniadania (id_sniadania),
foreign key(id_goscia) references goscie (id_goscia)
);
drop table sniadania_goscie;
create table obiadokolacje_goscie(
id_obiadokol int,
id_goscia int,
foreign key(id_obiadokol) references obiadokolacje (id_obiadokol),
foreign key(id_goscia) references goscie (id_goscia)
);
drop table obiadokolacje_goscie;
create table parking_goscie(
id_parkingu int,
id_goscia int,
foreign key(id_parkingu) references parking (id_parkingu),
foreign key(id_goscia) references goscie (id_goscia)
);
drop table parking_goscie;
create table SPA_goscie(
id_SPA int,
id_goscia int,
foreign key(id_SPA) references pakiet_SPA (id_SPA),
foreign key(id_goscia) references goscie (id_goscia)
);
drop table SPA_goscie;

insert into goscie values (1, 'Dagmara', 'Smolik', 'AZS539877');
insert into goscie values (2, 'Hozjusz', 'Buholc', 'ARW984376');
insert into goscie values (3, 'Aleksandra', 'Bugala', 'SKR770912');
insert into goscie values (4, 'Adrian', 'Denisiuk', 'DFG022298');
insert into goscie values (5, 'Irena', 'Goluch', 'HGR096655');
insert into goscie values (6, 'Lech', 'Just', 'FDR544532');
insert into goscie values (7, 'Karolina', 'Szymala', 'DWA392018');
insert into goscie values (8, 'Magdalena', 'Talik', 'AJK400988');
select*from goscie;
insert into rodzaj_pokoju values (1, 'standard', 2, 190);
insert into rodzaj_pokoju values (2, 'standard', 2, 190);
insert into rodzaj_pokoju values (3, 'standard', 2, 190);
insert into rodzaj_pokoju values (4, 'standard', 3, 240);
insert into rodzaj_pokoju values (5, 'standard', 4, 350);
insert into rodzaj_pokoju values (6, 'studio', 2, 160);
insert into rodzaj_pokoju values (7, 'studio', 2, 160);
insert into rodzaj_pokoju values (8, 'studio', 2, 210);
insert into rodzaj_pokoju values (9, 'studio', 3, 210);
insert into rodzaj_pokoju values (10, 'apartament', 2, 250);
select*from rodzaj_pokoju;
insert into sniadania values (1, 0, 20, 1);
insert into sniadania values (2, 4, 20, 2);
insert into sniadania values (3, 0, 20, 3);
insert into sniadania values (4, 6, 20, 4);
insert into sniadania values (5, 39, 20, 5);
insert into sniadania values (6, 12, 20, 6);
insert into sniadania values (7, 28, 20, 7);
insert into sniadania values (8, 6, 20, 8);
select*from sniadania;
insert into obiadokolacje values (1, 0, 50, 1);
insert into obiadokolacje values (2, 0, 50, 2);
insert into obiadokolacje values (3, 8, 50, 3);
insert into obiadokolacje values (4, 0, 50, 4);
insert into obiadokolacje values (5, 39, 50, 5);
insert into obiadokolacje values (6, 12, 50, 6);
insert into obiadokolacje values (7, 0, 50, 7);
insert into obiadokolacje values (8, 6, 50, 8);
select*from obiadokolacje;
insert into pakiet_SPA values (1, 0, 120, 1);
insert into pakiet_SPA values (2, 0, 120, 2);
insert into pakiet_SPA values (3, 0, 120, 3);
insert into pakiet_SPA values (4, 2, 120, 4);
insert into pakiet_SPA values (5, 3, 120, 5);
insert into pakiet_SPA values (6, 2, 120, 6);
insert into pakiet_SPA values (7, 0, 120, 7);
insert into pakiet_SPA values (8, 0, 120, 8);
select*from pakiet_SPA;
insert into parking values (1, 6, 20, 1);
insert into parking values (2, 2, 20, 2);
insert into parking values (3, 4, 20, 3);
insert into parking values (4, 5, 20, 4);
insert into parking values (5, 13, 20, 5);
insert into parking values (6, 0, 20, 6);
insert into parking values (7, 7, 20, 7);
insert into parking values (8, 4, 20, 8);
select*from parking;
insert into rodzaj_platnosci values (1, 'karta');
insert into rodzaj_platnosci values (2, 'gotowka');
select*from rodzaj_platnosci ;
insert into rezerwacje values (1, '2018-01-15', '2018-01-21', 4, 2, 2);
insert into rezerwacje values (2, '2018-01-15', '2018-01-28', 5, 9, 2);
insert into rezerwacje values (3, '2018-01-22', '2018-01-28', 1, 1, 1);
insert into rezerwacje values (4, '2018-01-15', '2018-01-19', 8, 3, 2);
insert into rezerwacje values (5, '2018-01-19', '2018-01-21', 2, 7, 1);
insert into rezerwacje values (6, '2018-01-22', '2018-01-26', 3, 10, 1);
insert into rezerwacje values (7, '2018-01-17', '2018-01-23', 6, 6, 1);
insert into rezerwacje values (8, '2018-01-18', '2018-01-25', 7, 4, 1);
select*from rezerwacje;
insert into logowanie_goscia values ('Dagmara1', 'kotek1', 1);
insert into logowanie_goscia values ('Hozjusz2', 'żółwik2', 2);
insert into logowanie_goscia values ('Aleksandra3', 'piesek3', 3);
insert into logowanie_goscia values ('Adrian4', 'chomik4', 4);
insert into logowanie_goscia values ('Irena5', 'kangur5', 5);
insert into logowanie_goscia values ('Lech6','mis6', 6);
insert into logowanie_goscia values ('Karolina7', 'nietoperz7', 7);
insert into logowanie_goscia values ('Magdalena8', 'jez8', 8);
select*from logowanie_goscia;
insert into logowanie_admin values (1, 'Admin1', 'ace135');
insert into logowanie_admin values (2, 'Admin2', 'bdf246');
insert into logowanie_admin values (3, 'Admin3', 'gik791');
select*from logowanie_admin;

#WIDOKI
#dostepność danego rodzaju pokoju (pokój 2-osobowy) w podanym terminie (16-21.01.2018)
CREATE VIEW dostepnosc_pokoju AS
    SELECT 
        rp.id_nr_pokoju,
        rp.ilosc_osob,
        rp.standard,
        CASE
            WHEN
                ('2018-01-16' BETWEEN data_przyjazdu AND data_wyjazdu)
                    OR ('2018-01-21' BETWEEN data_przyjazdu AND data_wyjazdu)
            THEN
                'zajęty'
            ELSE 'wolny'
        END AS dostepnosc
    FROM
        rezerwacje AS r
            JOIN
        rodzaj_pokoju AS rp ON (r.id_nr_pokoju = rp.id_nr_pokoju)
    WHERE
        ilosc_osob = 2
    ORDER BY id_nr_pokoju;
select*from dostepnosc_pokoju;

#suma kosztów pobytu (pokój + usługi dodatkowe) dla danego gościa (o nazwisku Buholc)
CREATE VIEW koszt_pobytu AS
    SELECT 
        g.*,
        DATEDIFF(data_wyjazdu, data_przyjazdu) * rp.cena_p + (s.ilosc_s * s.cena_s + o.ilosc_o * o.cena_o + spa.ilosc_SPA * spa.cena_SPA + p.ilosc_parkingu * p.cena_parkingu) AS cena_za_pobyt
    FROM
        rezerwacje AS r
            JOIN
        goscie AS g ON (r.id_goscia = g.id_goscia)
            JOIN
        rodzaj_pokoju AS rp ON (r.id_nr_pokoju = rp.id_nr_pokoju)
            JOIN
        sniadania AS s ON (g.id_goscia = s.id_goscia)
            JOIN
        obiadokolacje AS o ON (s.id_goscia = o.id_goscia)
            JOIN
        pakiet_SPA AS spa ON (o.id_goscia = spa.id_goscia)
            JOIN
        parking AS p ON (spa.id_goscia = p.id_goscia)
    WHERE
        nazwisko = 'Buholc';
select*from koszt_pobytu;
    
#informacje o konkretnym gościu (imię, nazwisko, nr dowodu osobistego, zarezerwowany pokój, długość pobytu, okres pobytu, rodzaj płatności)
CREATE VIEW informacje_o_gosciu AS
    SELECT 
        imie,
        nazwisko,
        nr_dowodu,
        standard,
        ilosc_osob,
        data_przyjazdu,
        data_wyjazdu,
        DATEDIFF(data_wyjazdu, data_przyjazdu) AS dlugosc_pobytu,
        rplatnosci
    FROM
        rezerwacje AS r
            JOIN
        goscie AS g ON (r.id_goscia = g.id_goscia)
            JOIN
        rodzaj_pokoju AS rpok ON (r.id_nr_pokoju = rpok.id_nr_pokoju)
            JOIN
        rodzaj_platnosci AS rpl ON (r.id_rplatnosci = rpl.id_rplatnosci)
    WHERE
        nazwisko = 'Buholc';
select*from informacje_o_gosciu;


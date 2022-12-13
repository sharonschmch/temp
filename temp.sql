--################################
-- Tabellen löschen
--################################
Drop table Bankkunde cascade constraints;
Drop table Konto cascade constraints;
Drop table Waehrung cascade constraints;
Drop table Ueberweisung cascade constraints;
Drop table Ort cascade constraints;
Drop table Mitarbeiter cascade constraints;
Drop table Geschlecht cascade constraints;
Drop table Rolle cascade constraints;
Drop table Bonusart cascade constraints;
Drop table Filiale cascade constraints;
Drop table Bonitaet cascade constraints;

--################################
-- Tabellen erstellen
--################################


CREATE TABLE Bankkunde
(
	Bankkunde_id              INTEGER NOT NULL ,
	PLZ                  INTEGER NULL ,
	Vorname              VARCHAR2(50) NULL ,
	Nachname             VARCHAR2(50) NULL ,
	Strasse              VARCHAR2(50) NULL ,
	Geschlecht_id        INTEGER NULL ,
	Mitarbeiter_id_Betreuer INTEGER NULL ,
	Bonitaet_id          INTEGER NULL 
);
CREATE UNIQUE INDEX XPKBankkunde ON Bankkunde
(Bankkunde_id   ASC);

ALTER TABLE Bankkunde
	ADD CONSTRAINT  XPKBankkunde PRIMARY KEY (Bankkunde_id);

CREATE TABLE Bonitaet
(
	Bonitaet_id          INTEGER NOT NULL ,
	Bezeichnung          VARCHAR2(50) NULL 
);

CREATE UNIQUE INDEX XPKBonitaet ON Bonitaet
(Bonitaet_id   ASC);

ALTER TABLE Bonitaet
	ADD CONSTRAINT  XPKBonitaet PRIMARY KEY (Bonitaet_id);
CREATE TABLE Bonusart
(
	Bonusart_id          INTEGER NOT NULL ,
	Bonusbezeichnung     VARCHAR2(50) NULL 
);

CREATE UNIQUE INDEX XPKBonusart ON Bonusart
(Bonusart_id   ASC);

ALTER TABLE Bonusart
	ADD CONSTRAINT  XPKBonusart PRIMARY KEY (Bonusart_id);

CREATE TABLE Geschlecht
(
	Geschlecht_id        INTEGER NOT NULL ,
	Geschlecht           VARCHAR2(20) NULL ,
	Anrede               VARCHAR2(20) NULL 
);

CREATE UNIQUE INDEX XPKGeschlecht ON Geschlecht
(Geschlecht_id   ASC);

ALTER TABLE Geschlecht
	ADD CONSTRAINT  XPKGeschlecht PRIMARY KEY (Geschlecht_id);

CREATE TABLE Konto
(
	Kto_Nr               INTEGER NOT NULL ,
	Bankkunde_id              INTEGER NULL ,
	Kontostand           DECIMAL(12,2) NULL ,
	Kredit_Limit         DECIMAL(12,2) NULL ,
	Waehrungs_code       CHAR(3) NULL 
);

CREATE UNIQUE INDEX XPKKonto ON Konto
(Kto_Nr   ASC);

ALTER TABLE Konto
	ADD CONSTRAINT  XPKKonto PRIMARY KEY (Kto_Nr);

CREATE TABLE Mitarbeiter
(
	Mitarbeiter_id       INTEGER NOT NULL ,
	PLZ                  INTEGER NULL ,
	Vorname              VARCHAR2(50) NULL ,
	Nachname             VARCHAR2(50) NULL ,
	Strasse              VARCHAR2(50) NULL ,
	Wochenarbeitszeit    DECIMAL(3,1) NULL ,
	Bonus_Betrag         DECIMAL(10,2) NULL ,
	Geschlecht_id        INTEGER NULL ,
	Gehalt               DECIMAL(10,2) NULL ,
	Rolle_id             INTEGER NULL ,
	Bonusart_id          INTEGER NULL ,
	Filiale_id_arbeitet_in INTEGER NULL 
);
CREATE UNIQUE INDEX XPKMitarbeiter ON Mitarbeiter
(Mitarbeiter_id   ASC);

ALTER TABLE Mitarbeiter
	ADD CONSTRAINT  XPKMitarbeiter PRIMARY KEY (Mitarbeiter_id);

CREATE TABLE Ort
(
	PLZ                  INTEGER NOT NULL ,
	Ort                  VARCHAR2(50) NULL ,
	Bundesland           VARCHAR2(50) NULL ,
	Einwohner            INTEGER NULL 
);

CREATE UNIQUE INDEX XPKOrt ON Ort
(PLZ   ASC);

ALTER TABLE Ort
	ADD CONSTRAINT  XPKOrt PRIMARY KEY (PLZ);

CREATE TABLE Filiale
(
	Filiale_id            INTEGER NOT NULL ,
	Filialbezeichnung    VARCHAR2(100) NULL ,
	Strasse              VARCHAR2(50) NULL ,
	PLZ                  INTEGER NULL ,
	Mitarbeiter_id_Filialleiter INTEGER NULL 
);

CREATE UNIQUE INDEX XPKFiliale ON Filiale
(Filiale_id   ASC);

ALTER TABLE Filiale
	ADD CONSTRAINT  XPKFiliale PRIMARY KEY (Filiale_id);

CREATE TABLE Rolle
(
	Rolle_id             INTEGER NOT NULL ,
	Rollenbezeichnung    VARCHAR2(50) NULL 
);

CREATE UNIQUE INDEX XPKRolle ON Rolle
(Rolle_id   ASC);

ALTER TABLE Rolle
	ADD CONSTRAINT  XPKRolle PRIMARY KEY (Rolle_id);

CREATE TABLE Waehrung
(
	Waehrungs_code       CHAR(3) NOT NULL ,
	Waehrungsbezeichnung VARCHAR2(50) NULL ,
	Wechselkurs_Euro     DECIMAL(15,5) NULL 
);

CREATE UNIQUE INDEX XPKWaehrung ON Waehrung
(Waehrungs_code   ASC);

ALTER TABLE Waehrung
	ADD CONSTRAINT  XPKWaehrung PRIMARY KEY (Waehrungs_code);

CREATE TABLE Ueberweisung
(
	Ueberweisung_id      INTEGER NOT NULL ,
	Von_Pers_id          INTEGER NULL ,
	Von_Kto_Nr           INTEGER NULL ,
	An_Pers_id           INTEGER NULL ,
	An_Kto_Nr            INTEGER NULL,
	Verwendungszweck     VARCHAR2(150) NULL ,
	Betrag               DECIMAL(12,2) NULL ,
	Datum                DATE NULL
);
-- ####################################
-- Datensätze einfügen
--##################################
Insert into Geschlecht Values (1,'Weiblich', 'Frau');
Insert into Geschlecht Values (2,'Männlich', 'Herr'); 

Insert into Bonusart Values (1,'Bonus für Lebensversicherung');
Insert into Bonusart Values (2,'Bonus für Kontoabschlüsse');
Insert into Bonusart Values (3,'Bonus für Versicherungsabschlüsse');

Insert into Rolle Values (1,'Kassierer');
Insert into Rolle Values (2,'Betreuer');
Insert into Rolle Values (3,'Lehrling');
Insert into Rolle Values (4,'Manager');

Insert into Waehrung Values ('AUD','Australischer Dollar ',15.501);
Insert into Waehrung Values ('BGN','Bulgarischer Lew ',19.558);
Insert into Waehrung Values ('BRL','Real ',40.650);
Insert into Waehrung Values ('CAD','Kanadischer Dollar ',14.717);
Insert into Waehrung Values ('CHF','Schweizer Franken ',11.070);
Insert into Waehrung Values ('CNY','Renminbi Yuan ',74.300);
Insert into Waehrung Values ('CZK','Tschechische Krone ',27.021);
Insert into Waehrung Values ('DKK','Dänische Krone ',74.390);
Insert into Waehrung Values ('GBP','Pfund Sterling ',0.78850);
Insert into Waehrung Values ('HKD','Hongkong-Dollar ',88.678);
Insert into Waehrung Values ('HRK','Kuna ',75.020);
Insert into Waehrung Values ('HUF','Forint ',313.68);
Insert into Waehrung Values ('IDR','Rupiah ',15276.76);
Insert into Waehrung Values ('ILS','Neuer Schekel ',43.191);
Insert into Waehrung Values ('INR','Indische Rupie ',76.141);
Insert into Waehrung Values ('JPY','Yen ',122.23);
Insert into Waehrung Values ('KRW','Won ',1339.64);
Insert into Waehrung Values ('MXN','Mexikanischer Peso ',205.185);
Insert into Waehrung Values ('MYR','Ringgit ',45.845);
Insert into Waehrung Values ('NOK','Norwegische Krone ',93.513);
Insert into Waehrung Values ('NZD','Neuseeland Dollar ',16.702);
Insert into Waehrung Values ('PHP','Philippinischer Peso ',53.884);
Insert into Waehrung Values ('PLN','Zloty ',44.198);
Insert into Waehrung Values ('RON','Neuer Rumänischer Leu ',45.005);
Insert into Waehrung Values ('RUB','Russischer Rubel ',759.135);
Insert into Waehrung Values ('SEK','Schwedische Krone ',92.753);
Insert into Waehrung Values ('SGD','Singapur-Dollar ',15.526);
Insert into Waehrung Values ('THB','Baht ',40.189);
Insert into Waehrung Values ('TRY','Türkische Lira ',33.363);
Insert into Waehrung Values ('USD','US-Dollar ',11.427);
Insert into Waehrung Values ('ZAR','Südafrikanischer Rand ',170.959);

Insert into Ort Values (1010,'Wien','Wien',16339);
Insert into Ort Values (1020,'Wien','Wien',101702);
Insert into Ort Values (1030,'Wien','Wien',88125);
Insert into Ort Values (1040,'Wien','Wien',31691);
Insert into Ort Values (1050,'Wien','Wien',54246);
Insert into Ort Values (1060,'Wien','Wien',31000);
Insert into Ort Values (1070,'Wien','Wien',31291);
Insert into Ort Values (1080,'Wien','Wien',24518);
Insert into Ort Values (1090,'Wien','Wien',40882);
Insert into Ort Values (1100,'Wien','Wien',189713);
Insert into Ort Values (1110,'Wien','Wien',95198);
Insert into Ort Values (1120,'Wien','Wien',92229);
Insert into Ort Values (1130,'Wien','Wien',52115);
Insert into Ort Values (1140,'Wien','Wien',89303);
Insert into Ort Values (1150,'Wien','Wien',76320);
Insert into Ort Values (1160,'Wien','Wien',100738);
Insert into Ort Values (1170,'Wien','Wien',55628);
Insert into Ort Values (1180,'Wien','Wien',49178);
Insert into Ort Values (1190,'Wien','Wien',69999);
Insert into Ort Values (1200,'Wien','Wien',85525);
Insert into Ort Values (1210,'Wien','Wien',151844);
Insert into Ort Values (1220,'Wien','Wien',172978);
Insert into Ort Values (1230,'Wien','Wien',96775);
Insert into Ort Values (1234,'Wels','Oberösterreich',500);
Insert into Ort Values (2301,'Wiener Neustadt','Niederösterreich',43002);
Insert into Ort Values (2302,'Steyr','Oberösterreich',500);
Insert into Ort Values (2303,'Feldkirch','Vorarlberg',500);
Insert into Ort Values (2304,'Bregenz','Vorarlberg',500);
Insert into Ort Values (2305,'Leoben','Steiermark',500);
Insert into Ort Values (2306,'Wolfsberg','Kärnten',500);
Insert into Ort Values (2307,'Baden','Niederösterreich',500);
Insert into Ort Values (2308,'Klosterneuburg','Niederösterreich',500);
Insert into Ort Values (2309,'Krems','Niederösterreich',500);
Insert into Ort Values (2310,'Traun','Oberösterreich',500);
Insert into Ort Values (2311,'Leonding','Oberösterreich',500);
Insert into Ort Values (2312,'Amstetten','Niederösterreich',500);
Insert into Ort Values (2313,'Kapfenberg','Steiermark',500);
Insert into Ort Values (2314,'Mödling','Niederösterreich',500);
Insert into Ort Values (2315,'Lustenau','Vorarlberg',500);
Insert into Ort Values (2316,'Hallein','Salzburg',500);
Insert into Ort Values (2317,'Braunau','Oberösterreich',500);
Insert into Ort Values (2318,'Kufstein','Tirol',500);
Insert into Ort Values (2319,'Traiskirchen','Niederösterreich',500);
Insert into Ort Values (2320,'Schwechat','Niederösterreich',500);
Insert into Ort Values (2321,'Spittal','Kärnten',500);
Insert into Ort Values (2322,'Saalfelden','Salzburg',500);
Insert into Ort Values (2323,'Ansfelden','Oberösterreich',500);
Insert into Ort Values (2324,'Ternitz','Niederösterreich',500);
Insert into Ort Values (2325,'Stockerau','Niederösterreich',500);
Insert into Ort Values (2326,'Hohenems','Vorarlberg',500);
Insert into Ort Values (2327,'Perchtoldsdorf','Niederösterreich',500);
Insert into Ort Values (2328,'Telfs','Tirol',500);
Insert into Ort Values (2329,'Feldkirchen','Kärnten',500);
Insert into Ort Values (2330,'Bad Ischl','Oberösterreich',500);
Insert into Ort Values (2331,'Tulln','Niederösterreich',500);
Insert into Ort Values (2332,'Bludenz','Vorarlberg',500);
Insert into Ort Values (2333,'Bruck an der Mur','Steiermark',500);
Insert into Ort Values (2334,'Gmunden','Oberösterreich',500);
Insert into Ort Values (2335,'Sankt Veit','Kärnten',500);
Insert into Ort Values (2336,'Schwaz','Tirol',500);
Insert into Ort Values (2337,'Hall','Tirol',500);
Insert into Ort Values (2338,'Eisenstadt','Burgenland',500);
Insert into Ort Values (2339,'Knittelfeld','Steiermark',500);
Insert into Ort Values (2340,'Lienz','Tirol',500);
Insert into Ort Values (2341,'Neunkirchen','Niederösterreich',500);
Insert into Ort Values (2342,'Hard','Vorarlberg',500);
Insert into Ort Values (2343,'Vöcklabruck','Oberösterreich',500);
Insert into Ort Values (2344,'Waidhofen an der Ybbs','Niederösterreich',500);
Insert into Ort Values (2345,'Villach','Kärnten',500);
Insert into Ort Values (2346,'Korneuburg','Niederösterreich',500);
Insert into Ort Values (2347,'Marchtrenk','Oberösterreich',500);
Insert into Ort Values (2348,'Rankweil','Vorarlberg',500);
Insert into Ort Values (2349,'Ried','Oberösterreich',500);
Insert into Ort Values (2350,'Zwettl','Niederösterreich',500);
Insert into Ort Values (2351,'Völkermarkt','Kärnten',500);
Insert into Ort Values (2352,'Wals-Siezenheim','Salzburg',500);
Insert into Ort Values (2353,'Bad Vöslau','Niederösterreich',500);
Insert into Ort Values (2354,'Hollabrunn','Niederösterreich',500);
Insert into Ort Values (2355,'Mistelbach','Niederösterreich',500);
Insert into Ort Values (2356,'Enns','Oberösterreich',500);
Insert into Ort Values (2357,'Sankt Johann','Salzburg',500);
Insert into Ort Values (2358,'Sankt Andrä','Kärnten',500);
Insert into Ort Values (2359,'Götzis','Vorarlberg',500);
Insert into Ort Values (2360,'Brunn am Gebirge','Niederösterreich',500);
Insert into Ort Values (2361,'Köflach','Steiermark',500);
Insert into Ort Values (2362,'Bischofshofen','Salzburg',500);
Insert into Ort Values (3345,'Wörgl','Tirol',500);
Insert into Ort Values (3453,'Sankt Pölten','Niederösterreich',500);
Insert into Ort Values (4020,'Linz','Oberösterreich',500);
Insert into Ort Values (5020,'Salzburg','Salzburg',500);
Insert into Ort Values (6020,'Innsbruck','Tirol',500);
Insert into Ort Values (6850,'Dornbirn','Vorarlberg',500);
Insert into Ort Values (8010,'Graz','Steiermark',500);
Insert into Ort Values (9020,'Klagenfurt','Kärnten',500);
Insert into Ort Values (9999,'unbekannt','unbekannt',500);

Insert into Mitarbeiter Values (1,1010,'Roger','Andrzejewski','Feldstr. 3',20,35,2,2000.5,2,1,1);
Insert into Mitarbeiter Values (2,1030,'Olga','Schilling','Bodelschwinghstr. 21',30,456,1,841.5,3,2,2);
Insert into Mitarbeiter Values (3,6020,'Bjoern','Martikke','Im Struethchen 5',40,472,2,6000.5,4,3,4);
Insert into Mitarbeiter Values (4,1030,'Teo','Noeh','Marburger Str. 9',30,456,2,7000.5,4,1,1);
Insert into Mitarbeiter Values (5,4020,'Antonio','Martikke','Bodelschwinghstr. 11',30,47,2,400.5,2,2,3);
Insert into Mitarbeiter Values (6,4020,'Karl-Eberhard','Porta','Werkstr. 87',40,7457,2,2500,2,1,3);
Insert into Mitarbeiter Values (7,6020,'Ines','Wingen','Kolpingstr. 34',40,35,1,3500.90,1,3,4);
Insert into Mitarbeiter Values (8,4020,'Karl-Eberhard','Caluwe','Schlosserstr. 97',45,345,2,3501.54,4,2,5);
Insert into Mitarbeiter Values (9,8010,'Andre','Noeh','Bodelschwinghstr. 9',19,2345,2,995.5,3,2,6);
Insert into Mitarbeiter Values (10,8010,'Antonio','Mudersbach','Sonnenweg 40',30,45,2,4100.56,2,1,1);
Insert into Mitarbeiter Values (11,8010,'Michaela','Dorfmeister','Seeweg 12',40,40,1,5100.0,2,1,3);
Insert into Mitarbeiter Values (13,1060,'Martina','Weis','Neubaugasse 10',30,400,1,6005.3,4,1,4);
Insert into Bankkunde Values (10001,4020,'Roger','Andrzejewski','Feldstr. 3',2,5,1);
Insert into Bankkunde Values (10002,1010,'Karlheinz','Haberkamp','Kolpingstr. 90',2,5,4);
Insert into Bankkunde Values (10003,8010,'Manuel','Haberkamp','Bahnhofstr. 69',2,6,1);
Insert into Bankkunde Values (10004,4020,'Magdalene','Wingen','Schlosserstr. 44',1,5,3);
Insert into Bankkunde Values (10005,1030,'Diethart','Andrzejewski','Marburger Str. 5',2,2,4);
Insert into Bankkunde Values (10006,4020,'Marlies','Blenkle','Caecilienstr. 84',1,8,3);
Insert into Bankkunde Values (10007,8010,'Knut-Peter','Judt','Sangstr. 38',2,10,4);
Insert into Bankkunde Values (10008,1030,'Detlef','Latsch','Heckenbachweg 72',2,2,1);
Insert into Bankkunde Values (10009,8010,'Waldemar','Caluwe','Struthstr. 10',2,10,4);
Insert into Bankkunde Values (10010,1030,'Frieda','Judt','Feldstr. 65',1,4,3);
Insert into Bankkunde Values (10011,6020,'Giuseppe','Wallmen','Hoehstr. 38',2,3,4);
Insert into Bankkunde Values (10012,4020,'Frank-Dietrich','Rink','Nordstr. 96',2,5,3);
Insert into Bankkunde Values (10013,6020,'Heiner','Latsch','Ackerstr. 38',2,3,2);
Insert into Bankkunde Values (10014,6020,'Waldemar','Porta','Sangstr. 3',2,7,1);
Insert into Bankkunde Values (10015,6020,'Karlheinz','Martikke','Friedhofstr. 64',2,7,1);
Insert into Bankkunde Values (10016,8010,'Roger','Wingen','Friedhofstr. 14',2,10,1);
Insert into Bankkunde Values (10017,1030,'Leo','Judt','Feldstr. 55',2,2,1);
Insert into Bankkunde Values (10018,4020,'Magdalene','Drey','Werkstr. 12',1,5,1);
Insert into Bankkunde Values (10019,8010,'Frieda','Schilling','Werkstr. 40',1,9,3);
Insert into Bankkunde Values (10020,4020,'Christof','Blenkle','Bahnhofstr. 54',2,5,4);
Insert into Bankkunde Values (10021,1030,'Loni','Drey','Urbanstr. 2',1,4,4);
Insert into Bankkunde Values (10022,8010,'Roland','Beier','Heckenbachweg 79',2,6,1);
Insert into Bankkunde Values (10023,6020,'Ines','Haberkamp','Nordstr. 74',1,3,2);
Insert into Bankkunde Values (10024,6020,'Juergen','Rink','Hoehstr. 86',2,7,1);
Insert into Bankkunde Values (10025,1030,'Roland','Schulte','Werkstr. 44',2,2,2);
Insert into Bankkunde Values (10026,6020,'Manuel','Andrzejewski','Caecilienstr. 78',2,3,4);
Insert into Bankkunde Values (10027,8010,'Loni','Drey','Eickhoffstr. 11',1,9,1);
Insert into Bankkunde Values (10028,4020,'Teo','Schulte','Kolpingstr. 6',2,8,1);
Insert into Bankkunde Values (10029,8010,'Ines','Mudersbach','Urbanstr. 11',1,9,3);
Insert into Bankkunde Values (10030,6020,'Dietrich','Beier','Eickhoffstr. 22',2,3,4);
Insert into Bankkunde Values (10031,6020,'Juergen','Judt','Heckenbachweg 9',2,3,4);
Insert into Bankkunde Values (10032,6020,'Knut-Peter','Blenkle','Nordstr. 55',2,7,1);
Insert into Bankkunde Values (10033,4020,'Hans-Walter','Schilling','Sangstr. 66',2,5,1);
Insert into Bankkunde Values (10034,6020,'Karlheinz','Korp','Marburger Str. 34',2,3,3);
Insert into Bankkunde Values (10035,8010,'Magdalene','Caluwe','Ackerstr. 83',1,10,2);
Insert into Bankkunde Values (10036,4020,'Olga','Schilling','Bodelschwinghstr. 21',1,5,4);
Insert into Bankkunde Values (10037,8010,'Helge-Dieter','Drey','Im Struethchen 90',2,6,3);
Insert into Bankkunde Values (10038,6020,'Leo','Gebhardt','Struthstr. 5',2,3,2);
Insert into Bankkunde Values (10039,1030,'Anna-Elisabeth','Judt','Ackerstr. 52',1,2,1);
Insert into Bankkunde Values (10040,8010,'Michaela','Judt','Nordstr. 23',1,6,4);
Insert into Bankkunde Values (10041,1030,'Dietrich','Noeh','Sonnenweg 43',2,2,3);
Insert into Bankkunde Values (10042,6020,'Ines','Blenkle','Eickhoffstr. 35',1,3,3);
Insert into Bankkunde Values (10043,1030,'Michaela','Gebhardt','Marburger Str. 11',1,2,4);
Insert into Bankkunde Values (10044,1030,'Roger','Porta','Urbanstr. 77',2,2,1);
Insert into Bankkunde Values (10045,8010,'Joh.-Guenter','Wingen','Friedhofstr. 4',2,9,2);
Insert into Bankkunde Values (10046,6020,'Bjoern','Martikke','Im Struethchen 5',2,7,1);
Insert into Bankkunde Values (10047,4020,'Haribert','Beier','Urbanstr. 60',2,5,4);
Insert into Bankkunde Values (10048,1030,'Marta','Blenkle','Struthstr. 55',1,2,1);
Insert into Bankkunde Values (10049,4020,'Leo','Schulte','Friedhofstr. 46',2,8,1);
Insert into Bankkunde Values (10050,4020,'Katrin','Rink','Sonnenweg 82',1,5,1);
Insert into Bankkunde Values (10051,4020,'Alex','Caluwe','Nordstr. 82',2,8,3);
Insert into Bankkunde Values (10052,4020,'Heide','Caluwe','Struthstr. 23',1,5,1);
Insert into Bankkunde Values (10053,8010,'Angela','Schulte','Heckenbachweg 23',1,9,3);
Insert into Bankkunde Values (10054,6020,'Marc','Wallmen','Bahnhofstr. 74',2,7,3);
Insert into Bankkunde Values (10055,4020,'Anna-Elisabeth','Porta','Eickhoffstr. 2',1,8,2);
Insert into Bankkunde Values (10056,4020,'Frank-Dietrich','Blenkle','Marburger Str. 9',2,5,1);
Insert into Bankkunde Values (10057,4020,'Teo','Noeh','Marburger Str. 9',2,8,1);
Insert into Bankkunde Values (10058,8010,'Hans-Walter','Noeh','Schlosserstr. 67',2,10,3);
Insert into Bankkunde Values (10059,1030,'Hans-Walter','Wingen','Schlosserstr. 88',2,4,4);
Insert into Bankkunde Values (10060,4020,'Antonio','Martikke','Bodelschwinghstr. 11',2,8,2);
Insert into Bankkunde Values (10061,1030,'Anke','Porta','Caecilienstr. 51',1,4,4);
Insert into Bankkunde Values (10062,8010,'Haribert','Latsch','Feldstr. 43',2,9,1);
Insert into Bankkunde Values (10063,6020,'Juergen','Andrzejewski','Sonnenweg 26',2,7,2);
Insert into Bankkunde Values (10064,4020,'Olga','Martikke','Struthstr. 21',1,8,2);
Insert into Bankkunde Values (10065,4020,'Frieda','Schulte','Struthstr. 43',1,8,2);
Insert into Bankkunde Values (10066,8010,'Antonio','Beier','Sonnenweg 40',2,10,2);
Insert into Bankkunde Values (10067,4020,'Waldemar','Soehngen','Heckenbachweg 73',2,5,3);
Insert into Bankkunde Values (10068,8010,'Marta','Schilling','Nordstr. 33',1,9,1);
Insert into Bankkunde Values (10069,6020,'Michaela','Wingen','Grubenweg 19',1,7,4);
Insert into Bankkunde Values (10070,8010,'Giuseppe','Andrzejewski','Caecilienstr. 54',2,10,3);
Insert into Bankkunde Values (10071,8010,'Diethart','Wallmen','Marburger Str. 8',2,6,4);
Insert into Bankkunde Values (10072,6020,'Katrin','Rink','Grubenweg 52',1,7,2);
Insert into Bankkunde Values (10073,8010,'Marlies','Korp','Feldstr. 11',1,10,3);
Insert into Bankkunde Values (10074,6020,'Roland','Latsch','Werkstr. 37',2,7,3);
Insert into Bankkunde Values (10075,4020,'Angela','Korp','Kolpingstr. 22',1,8,1);
Insert into Bankkunde Values (10076,4020,'Frieda','Korp','Ackerstr. 48',1,5,2);
Insert into Bankkunde Values (10077,8010,'Katrin','Judt','Sonnenweg 71',1,9,1);
Insert into Bankkunde Values (10078,4020,'Antonio','Judt','Eickhoffstr. 17',2,8,3);
Insert into Bankkunde Values (10079,1030,'Otto','Schilling','Urbanstr. 13',2,2,2);
Insert into Bankkunde Values (10080,8010,'Joh.-Guenter','Korp','Marburger Str. 93',2,10,1);
Insert into Bankkunde Values (10081,4020,'Giuseppe','Gebhardt','Caecilienstr. 22',2,8,3);
Insert into Bankkunde Values (10082,4020,'Bjoern','Caluwe','Werkstr. 27',2,8,1);
Insert into Bankkunde Values (10083,8010,'Karl-Eberhard','Porta','Werkstr. 87',2,10,2);
Insert into Bankkunde Values (10084,8010,'Ines','Wingen','Kolpingstr. 34',1,6,3);
Insert into Bankkunde Values (10085,4020,'Ruth','Schilling','Bodelschwinghstr. 24',1,5,1);
Insert into Bankkunde Values (10086,4020,'Giuseppe','Drey','Bahnhofstr. 87',2,5,2);
Insert into Bankkunde Values (10087,4020,'Eva','Gebhardt','Urbanstr. 57',1,5,2);
Insert into Bankkunde Values (10088,1030,'Karlheinz','Blenkle','Sangstr. 26',2,4,2);
Insert into Bankkunde Values (10089,1030,'Katrin','Mudersbach','Feldstr. 49',1,4,1);
Insert into Bankkunde Values (10090,4020,'Karl-Eberhard','Caluwe','Schlosserstr. 97',2,8,1);
Insert into Bankkunde Values (10091,8010,'Juergen','Noeh','Sangstr. 11',2,9,2);
Insert into Bankkunde Values (10092,1030,'Marta','Schulte','Eickhoffstr. 69',1,2,3);
Insert into Bankkunde Values (10093,4020,'Otto','Latsch','Feldstr. 10',2,5,2);
Insert into Bankkunde Values (10094,1030,'Andre','Noeh','Bodelschwinghstr. 9',2,4,4);
Insert into Bankkunde Values (10095,1030,'Sepp','Drey','Marburger Str. 43',2,2,1);
Insert into Bankkunde Values (10096,8010,'Antonio','Mudersbach','Sonnenweg 40',2,10,4);
Insert into Bankkunde Values (10097,1010,'Detlef','Andrzejewski','Schlosserstr. 95',2,1,4);
Insert into Bankkunde Values (10098,1010,'Teo','Martikke','Schlosserstr. 45',2,1,2);
Insert into Bankkunde Values (10099,1010,'Juergen','Wallmen','Marburger Str. 7',2,1,2);
Insert into Bankkunde Values (10100,1010,'Hans-Guenter','Wallmen','Nordstr. 53',2,1,3);
Insert into Bankkunde Values (10101,6850,'Klaus','Hilbe','Mariahilferstr. 10',2,1,2);

Insert into Ueberweisung Values (1,10039,31050072,10029,31050085,'Gebuehr',148.35,TO_TIMESTAMP('18-03-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (2,10054,31050076,10012,31050034,'Verguetung',753.36,TO_TIMESTAMP('28-04-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (3,10065,31050091,10061,31050111,'Unterhalt',464.98,TO_TIMESTAMP('24-11-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (4,10019,31050046,10090,31050022,'Rechnung',851.46,TO_TIMESTAMP('18-12-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (5,10091,31050115,10053,31050060,'Miete',41.67,TO_TIMESTAMP('13-10-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (6,10070,31050105,10061,31050111,'Rueckerstattung',866.75,TO_TIMESTAMP('22-05-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (7,10061,31050058,10061,31050111,'Schweigegeld',674.95,TO_TIMESTAMP('25-11-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (8,10032,31050042,10019,31050041,'Gas',828.69,TO_TIMESTAMP('16-06-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (9,10087,31050102,10045,31050065,'Wasser',513.67,TO_TIMESTAMP('14-07-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (10,10088,31050044,10082,31050063,'Gebuehr',194.98,TO_TIMESTAMP('05-10-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (11,10031,31050025,10078,31050033,'Rueckerstattung',918.06,TO_TIMESTAMP('10-05-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (12,10037,31050030,10073,31050049,'Unterhalt',301.68,TO_TIMESTAMP('16-06-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (13,10024,31050067,10042,31050054,'Gas',220.52,TO_TIMESTAMP('06-12-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (14,10029,31050055,10072,31050095,'Gebuehr',196.43,TO_TIMESTAMP('16-02-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (15,10018,31050094,10054,31050097,'Strom',445.84,TO_TIMESTAMP('28-10-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (16,10067,31050053,10027,31050024,'Gebuehr',638.66,TO_TIMESTAMP('01-01-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (17,10033,31050037,10028,31050089,'Rueckerstattung',743.34,TO_TIMESTAMP('05-02-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (18,10010,31050074,10024,31050073,'Unterhalt',841.4,TO_TIMESTAMP('07-10-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (19,10036,31050045,10027,31050026,'Verguetung',859.63,TO_TIMESTAMP('25-03-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (20,10061,31050111,10046,31050117,'Wasser',637.03,TO_TIMESTAMP('28-07-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (21,10094,31050069,10074,31050088,'Schweigegeld',850.17,TO_TIMESTAMP('22-02-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (22,10090,31050022,10073,31050100,'Schmiergeld',272.1,TO_TIMESTAMP('22-03-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (23,10072,31050095,10044,31050109,'Schmiergeld',473.76,TO_TIMESTAMP('14-12-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (24,10046,31050061,10010,31050074,'Strom',167.7,TO_TIMESTAMP('21-08-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (25,10019,31050046,10029,31050064,'Unterhalt',906.61,TO_TIMESTAMP('21-04-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (26,10043,31050083,10035,31050101,'Rueckerstattung',473.04,TO_TIMESTAMP('02-05-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (27,10068,31050106,10099,31050104,'Lohn',685.86,TO_TIMESTAMP('27-09-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (28,10083,31050039,10043,31050035,'Vorschuss',587.51,TO_TIMESTAMP('15-06-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (29,10016,31050107,10068,31050106,'Strom',408.55,TO_TIMESTAMP('30-01-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (30,10054,31050076,10059,31050093,'Gas',492.18,TO_TIMESTAMP('23-04-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (31,10008,31050056,10027,31050024,'Lohn',579.61,TO_TIMESTAMP('09-09-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (32,10054,31050097,10078,31050033,'Unterhalt',367.88,TO_TIMESTAMP('22-11-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (33,10073,31050092,10018,31050066,'Gebuehr',320.57,TO_TIMESTAMP('01-05-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (34,10045,31050065,10090,31050022,'Schweigegeld',730.64,TO_TIMESTAMP('11-08-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (35,10024,31050073,10005,31050075,'Miete',799.53,TO_TIMESTAMP('28-11-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (36,10094,31050062,10073,31050049,'Verguetung',96.95,TO_TIMESTAMP('18-10-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (37,10073,31050100,10027,31050052,'Strom',383.12,TO_TIMESTAMP('31-05-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (38,10088,31050044,10037,31050116,'Vorschuss',403.58,TO_TIMESTAMP('30-06-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (39,10012,31050034,10059,31050093,'Wasser',465.4,TO_TIMESTAMP('04-03-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (40,10089,31050120,10037,31050116,'Verguetung',937.7,TO_TIMESTAMP('07-07-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (41,10037,31050030,10085,31050108,'Lohn',31.2,TO_TIMESTAMP('11-05-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (42,10085,31050108,10068,31050087,'Rechnung',358.19,TO_TIMESTAMP('26-05-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (43,10027,31050026,10039,31050072,'Vorschuss',76.09,TO_TIMESTAMP('02-09-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (44,10024,31050073,10053,31050060,'Gas',744.57,TO_TIMESTAMP('01-03-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (45,10088,31050044,10028,31050089,'Rueckerstattung',251.93,TO_TIMESTAMP('14-10-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (46,10045,31050065,10064,31050080,'Verguetung',530.81,TO_TIMESTAMP('17-12-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (47,10068,31050087,10074,31050088,'Schmiergeld',212.02,TO_TIMESTAMP('24-07-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (48,10043,31050035,10040,31050096,'Lohn',851.1,TO_TIMESTAMP('05-11-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (49,10042,31050081,10072,31050095,'Unterhalt',328.71,TO_TIMESTAMP('24-02-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (50,10063,31050029,10046,31050117,'Vorschuss',771.73,TO_TIMESTAMP('07-07-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (51,10029,31050055,10067,31050053,'Lohn',729.54,TO_TIMESTAMP('07-08-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (52,10070,31050038,10081,31050077,'Gebuehr',423.01,TO_TIMESTAMP('09-06-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (53,10049,31050021,10042,31050054,'Gebuehr',814.36,TO_TIMESTAMP('03-10-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (54,10024,31050067,10084,31050098,'Lohn',915.94,TO_TIMESTAMP('09-12-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (55,10027,31050026,10074,31050088,'Wasser',373.88,TO_TIMESTAMP('01-02-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (56,10087,31050102,10083,31050039,'Vorschuss',417.54,TO_TIMESTAMP('17-03-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (57,10039,31050072,10010,31050074,'Schweigegeld',943.91,TO_TIMESTAMP('28-10-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (58,10027,31050026,10019,31050036,'Rueckerstattung',475.68,TO_TIMESTAMP('30-09-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (59,10053,31050043,10047,31050023,'Gebuehr',513.78,TO_TIMESTAMP('10-10-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (60,10094,31050069,10027,31050024,'Miete',405.88,TO_TIMESTAMP('10-01-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (61,10008,31050056,10037,31050116,'Unterhalt',613.26,TO_TIMESTAMP('09-08-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (62,10037,31050030,10038,31050082,'Gas',318.03,TO_TIMESTAMP('09-08-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (63,10037,31050116,10072,31050095,'Verguetung',766.55,TO_TIMESTAMP('01-11-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (64,10029,31050055,10070,31050105,'Gas',330.93,TO_TIMESTAMP('01-05-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (65,10078,31050033,10040,31050103,'Miete',900.05,TO_TIMESTAMP('19-11-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (66,10070,31050038,10019,31050036,'Rueckerstattung',238.56,TO_TIMESTAMP('02-10-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (67,10074,31050088,10024,31050067,'Wasser',707.95,TO_TIMESTAMP('27-02-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (68,10073,31050092,10090,31050022,'Schweigegeld',86.12,TO_TIMESTAMP('17-05-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (69,10064,31050080,10029,31050085,'Miete',216.51,TO_TIMESTAMP('14-01-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (70,10014,31050070,10067,31050053,'Gas',402.12,TO_TIMESTAMP('02-10-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (71,10063,31050029,10005,31050032,'Unterhalt',733.99,TO_TIMESTAMP('23-07-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (72,10059,31050110,10018,31050094,'Lohn',479.55,TO_TIMESTAMP('01-02-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (73,10019,31050036,10070,31050105,'Vorschuss',626.12,TO_TIMESTAMP('05-10-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (74,10073,31050100,10065,31050091,'Schmiergeld',540.35,TO_TIMESTAMP('29-08-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (75,10089,31050120,10091,31050115,'Wasser',629.4,TO_TIMESTAMP('14-11-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (76,10044,31050109,10010,31050028,'Unterhalt',513.37,TO_TIMESTAMP('07-02-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (77,10081,31050077,10087,31050102,'Vorschuss',710.49,TO_TIMESTAMP('29-06-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (78,10099,31050104,10027,31050024,'Gebuehr',674.71,TO_TIMESTAMP('26-04-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (79,10044,31050109,10087,31050102,'Strom',658.68,TO_TIMESTAMP('18-09-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (80,10081,31050077,10018,31050066,'Strom',775.27,TO_TIMESTAMP('06-01-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (81,10065,31050091,10012,31050047,'Unterhalt',183.16,TO_TIMESTAMP('12-03-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (82,10014,31050070,10081,31050077,'Gas',64.48,TO_TIMESTAMP('21-06-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (83,10089,31050120,10088,31050044,'Schmiergeld',334,TO_TIMESTAMP('31-05-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (84,10074,31050088,10042,31050050,'Unterhalt',142.41,TO_TIMESTAMP('18-06-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (85,10094,31050069,10008,31050056,'Schmiergeld',842.2,TO_TIMESTAMP('04-09-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (86,10012,31050034,10032,31050042,'Strom',695.14,TO_TIMESTAMP('17-05-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (87,10043,31050035,10040,31050103,'Schmiergeld',681.43,TO_TIMESTAMP('02-02-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (88,10059,31050093,10087,31050102,'Gas',890.25,TO_TIMESTAMP('12-05-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (89,10031,31050057,10019,31050036,'Wasser',944.99,TO_TIMESTAMP('22-12-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (90,10061,31050111,10054,31050097,'Gas',918.77,TO_TIMESTAMP('26-06-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (91,10024,31050073,10040,31050103,'Unterhalt',641.64,TO_TIMESTAMP('10-07-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (92,10055,31050040,10029,31050055,'Verguetung',357.25,TO_TIMESTAMP('21-05-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (93,10031,31050057,10073,31050100,'Schweigegeld',449.51,TO_TIMESTAMP('05-08-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (94,10019,31050046,10061,31050111,'Gas',279.19,TO_TIMESTAMP('28-05-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (95,10051,31050031,10082,31050063,'Vorschuss',897.52,TO_TIMESTAMP('22-10-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (96,10010,31050074,10094,31050069,'Unterhalt',411.2,TO_TIMESTAMP('26-10-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (97,10046,31050117,10058,31050071,'Unterhalt',348.47,TO_TIMESTAMP('21-05-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (98,10029,31050064,10042,31050050,'Rechnung',750.56,TO_TIMESTAMP('30-05-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (99,10080,31050084,10080,31050084,'Wasser',384.21,TO_TIMESTAMP('11-02-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (100,10038,31050082,10030,31050079,'Lohn',805.02,TO_TIMESTAMP('09-01-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (101,10033,31050037,10087,31050102,'Schmiergeld',201.28,TO_TIMESTAMP('28-08-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (102,10092,31050027,10045,31050065,'Miete',64.69,TO_TIMESTAMP('26-10-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (103,10043,31050035,10049,31050021,'Gas',962.33,TO_TIMESTAMP('13-04-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (104,10027,31050024,10059,31050093,'Strom',686.52,TO_TIMESTAMP('21-02-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (105,10026,31050068,10042,31050081,'Schmiergeld',576.22,TO_TIMESTAMP('31-12-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (106,10039,31050072,10010,31050074,'Wasser',993.56,TO_TIMESTAMP('21-04-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (107,10024,31050073,10073,31050049,'Miete',264.14,TO_TIMESTAMP('31-03-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (108,10024,31050067,10016,31050051,'Vorschuss',891.66,TO_TIMESTAMP('09-04-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (109,10036,31050045,10046,31050117,'Wasser',710.11,TO_TIMESTAMP('26-09-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (110,10054,31050097,10016,31050107,'Verguetung',466.54,TO_TIMESTAMP('23-11-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (111,10054,31050076,10010,31050074,'Lohn',822.87,TO_TIMESTAMP('21-03-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (112,10074,31050088,10024,31050067,'Gas',589.59,TO_TIMESTAMP('23-08-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (113,10072,31050095,10061,31050058,'Verguetung',586.69,TO_TIMESTAMP('11-09-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (114,10067,31050053,10092,31050027,'Schweigegeld',995.45,TO_TIMESTAMP('02-11-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (115,10029,31050064,10029,31050064,'Schweigegeld',244.74,TO_TIMESTAMP('18-09-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (116,10042,31050054,10043,31050083,'Miete',307.09,TO_TIMESTAMP('18-01-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (117,10031,31050057,10053,31050114,'Gebuehr',260.66,TO_TIMESTAMP('18-06-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (118,10016,31050051,10065,31050112,'Rechnung',472.18,TO_TIMESTAMP('04-10-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (119,10073,31050049,10026,31050068,'Verguetung',370.96,TO_TIMESTAMP('13-03-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (120,10005,31050075,10094,31050062,'Rechnung',151.94,TO_TIMESTAMP('17-11-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (121,10081,31050077,10027,31050024,'Rueckerstattung',802.41,TO_TIMESTAMP('04-09-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (122,10037,31050030,10043,31050083,'Gebuehr',497.97,TO_TIMESTAMP('27-07-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (123,10066,31050090,10067,31050048,'Rechnung',187.03,TO_TIMESTAMP('16-02-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (124,10016,31050107,10037,31050030,'Gebuehr',230.61,TO_TIMESTAMP('14-11-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (125,10085,31050108,10053,31050043,'Rechnung',405.78,TO_TIMESTAMP('20-09-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (126,10010,31050074,10078,31050033,'Rechnung',997.29,TO_TIMESTAMP('21-05-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (127,10005,31050075,10045,31050065,'Schweigegeld',30.28,TO_TIMESTAMP('25-02-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (128,10053,31050114,10072,31050095,'Rueckerstattung',323.8,TO_TIMESTAMP('20-07-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (129,10088,31050044,10083,31050039,'Vorschuss',237.29,TO_TIMESTAMP('10-09-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (130,10043,31050083,10040,31050103,'Vorschuss',863.64,TO_TIMESTAMP('28-07-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (131,10073,31050049,10044,31050109,'Strom',324.2,TO_TIMESTAMP('05-01-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (132,10042,31050050,10068,31050087,'Miete',398.67,TO_TIMESTAMP('27-09-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (133,10094,31050069,10019,31050041,'Verguetung',51.03,TO_TIMESTAMP('27-03-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (134,10068,31050106,10024,31050073,'Schmiergeld',835.57,TO_TIMESTAMP('02-08-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (135,10042,31050050,10065,31050112,'Gebuehr',802.18,TO_TIMESTAMP('02-04-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (136,10039,31050072,10040,31050103,'Miete',125.6,TO_TIMESTAMP('19-07-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (137,10096,31050099,10046,31050061,'Lohn',927.94,TO_TIMESTAMP('12-06-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (138,10026,31050068,10061,31050111,'Schweigegeld',336.42,TO_TIMESTAMP('02-08-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (139,10054,31050097,10024,31050073,'Wasser',601.56,TO_TIMESTAMP('08-04-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (140,10039,31050072,10031,31050057,'Gas',146.02,TO_TIMESTAMP('11-08-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (141,10066,31050090,10024,31050073,'Lohn',275.36,TO_TIMESTAMP('30-01-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (142,10068,31050087,10019,31050041,'Strom',945.6,TO_TIMESTAMP('09-07-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (143,10073,31050049,10042,31050050,'Rueckerstattung',14.34,TO_TIMESTAMP('29-09-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (144,10063,31050029,10036,31050045,'Strom',603.44,TO_TIMESTAMP('21-08-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (145,10073,31050092,10005,31050032,'Gebuehr',782.06,TO_TIMESTAMP('25-04-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (146,10029,31050085,10005,31050075,'Rueckerstattung',686.62,TO_TIMESTAMP('29-01-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (147,10012,31050047,10046,31050061,'Gebuehr',69.05,TO_TIMESTAMP('20-06-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (148,10019,31050036,10094,31050069,'Unterhalt',298.03,TO_TIMESTAMP('01-02-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (149,10046,31050118,10073,31050049,'Verguetung',572.39,TO_TIMESTAMP('13-10-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (150,10035,31050101,10092,31050027,'Rueckerstattung',972.84,TO_TIMESTAMP('12-12-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (151,10019,31050036,10090,31050022,'Gebuehr',712.54,TO_TIMESTAMP('07-03-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (152,10019,31050036,10053,31050114,'Schweigegeld',573.02,TO_TIMESTAMP('24-09-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (153,10029,31050055,10070,31050105,'Lohn',879.31,TO_TIMESTAMP('20-12-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (154,10061,31050111,10019,31050036,'Vorschuss',644.26,TO_TIMESTAMP('28-04-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (155,10005,31050075,10046,31050118,'Miete',383.69,TO_TIMESTAMP('05-01-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (156,10018,31050094,10054,31050097,'Gebuehr',66.7,TO_TIMESTAMP('22-03-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (157,10094,31050069,10061,31050111,'Schmiergeld',842.1,TO_TIMESTAMP('28-04-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (158,10027,31050026,10029,31050055,'Verguetung',294.47,TO_TIMESTAMP('19-10-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (159,10029,31050055,10052,31050119,'Schweigegeld',297.93,TO_TIMESTAMP('09-04-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (160,10073,31050092,10045,31050065,'Rueckerstattung',241.82,TO_TIMESTAMP('19-08-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (161,10040,31050103,10044,31050109,'Lohn',636.15,TO_TIMESTAMP('04-01-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (162,10039,31050072,10051,31050031,'Rechnung',998.78,TO_TIMESTAMP('05-10-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (163,10014,31050070,10051,31050031,'Schweigegeld',271.2,TO_TIMESTAMP('11-05-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (164,10081,31050077,10040,31050096,'Gas',765.06,TO_TIMESTAMP('02-07-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (165,10014,31050070,10031,31050057,'Unterhalt',647.35,TO_TIMESTAMP('19-05-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (166,10036,31050045,10008,31050056,'Lohn',550.22,TO_TIMESTAMP('18-03-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (167,10016,31050051,10053,31050114,'Schweigegeld',591.45,TO_TIMESTAMP('12-10-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (168,10092,31050027,10046,31050117,'Strom',596.48,TO_TIMESTAMP('30-08-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (169,10013,31050059,10053,31050060,'Schweigegeld',96.77,TO_TIMESTAMP('14-03-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (170,10087,31050102,10051,31050031,'Lohn',27.19,TO_TIMESTAMP('02-02-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (171,10080,31050084,10085,31050108,'Rechnung',799.92,TO_TIMESTAMP('28-04-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (172,10063,31050029,10027,31050026,'Miete',865.09,TO_TIMESTAMP('01-05-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (173,10026,31050068,10065,31050091,'Unterhalt',43.1,TO_TIMESTAMP('02-11-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (174,10027,31050052,10064,31050080,'Rechnung',53.05,TO_TIMESTAMP('07-08-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (175,10067,31050048,10055,31050040,'Miete',892.57,TO_TIMESTAMP('24-05-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (176,10029,31050055,10010,31050074,'Strom',902.85,TO_TIMESTAMP('10-05-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (177,10051,31050031,10012,31050034,'Lohn',676.28,TO_TIMESTAMP('31-03-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (178,10084,31050078,10040,31050103,'Gas',147.51,TO_TIMESTAMP('13-06-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (179,10052,31050119,10047,31050023,'Strom',784.78,TO_TIMESTAMP('19-03-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (180,10035,31050101,10073,31050092,'Vorschuss',612.28,TO_TIMESTAMP('30-05-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (181,10042,31050050,10039,31050072,'Miete',239.3,TO_TIMESTAMP('20-08-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (182,10081,31050077,10029,31050055,'Rechnung',379.19,TO_TIMESTAMP('15-07-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (183,10088,31050044,10067,31050053,'Schweigegeld',731.43,TO_TIMESTAMP('06-09-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (184,10042,31050054,10046,31050118,'Rechnung',329.47,TO_TIMESTAMP('01-06-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (185,10068,31050087,10054,31050097,'Schweigegeld',881.1,TO_TIMESTAMP('07-09-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (186,10030,31050079,10078,31050033,'Vorschuss',168.75,TO_TIMESTAMP('28-05-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (187,10073,31050100,10064,31050080,'Verguetung',26.21,TO_TIMESTAMP('18-12-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (188,10072,31050095,10051,31050031,'Verguetung',375.7,TO_TIMESTAMP('21-05-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (189,10012,31050034,10055,31050040,'Unterhalt',239.61,TO_TIMESTAMP('05-04-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (190,10053,31050060,10070,31050105,'Schmiergeld',938.58,TO_TIMESTAMP('11-11-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (191,10031,31050057,10073,31050100,'Gebuehr',412.64,TO_TIMESTAMP('10-06-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (192,10019,31050036,10059,31050093,'Verguetung',591.03,TO_TIMESTAMP('25-08-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (193,10008,31050056,10035,31050101,'Gas',83.81,TO_TIMESTAMP('01-04-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (194,10082,31050063,10032,31050042,'Wasser',324.42,TO_TIMESTAMP('17-06-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (195,10049,31050021,10012,31050034,'Unterhalt',856.75,TO_TIMESTAMP('03-02-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (196,10059,31050110,10072,31050095,'Unterhalt',886.22,TO_TIMESTAMP('15-09-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (197,10067,31050053,10038,31050082,'Rueckerstattung',279.42,TO_TIMESTAMP('19-12-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (198,10063,31050029,10063,31050029,'Vorschuss',783.28,TO_TIMESTAMP('11-09-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (199,10010,31050028,10090,31050022,'Unterhalt',543.77,TO_TIMESTAMP('28-04-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (200,10090,31050022,10028,31050089,'Rueckerstattung',457.41,TO_TIMESTAMP('27-06-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (201,10026,31050086,10065,31050112,'Gas',846.54,TO_TIMESTAMP('11-01-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (202,10054,31050097,10014,31050070,'Gas',441.37,TO_TIMESTAMP('27-05-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (203,10047,31050023,10030,31050079,'Schweigegeld',658.21,TO_TIMESTAMP('31-08-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (204,10031,31050025,10026,31050068,'Wasser',457,TO_TIMESTAMP('17-09-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (205,10064,31050080,10084,31050078,'Gebuehr',906.24,TO_TIMESTAMP('24-02-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (206,10055,31050040,10030,31050079,'Verguetung',912.88,TO_TIMESTAMP('26-10-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (207,10008,31050056,10073,31050100,'Schweigegeld',203.59,TO_TIMESTAMP('20-07-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (208,10094,31050069,10051,31050031,'Vorschuss',675.38,TO_TIMESTAMP('07-12-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (209,10078,31050033,10030,31050079,'Wasser',937.25,TO_TIMESTAMP('06-08-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (210,10019,31050036,10016,31050107,'Gebuehr',342.07,TO_TIMESTAMP('15-08-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (211,10040,31050096,10084,31050098,'Verguetung',613.31,TO_TIMESTAMP('26-10-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (212,10033,31050037,10036,31050045,'Gebuehr',519.51,TO_TIMESTAMP('26-10-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (213,10052,31050119,10087,31050102,'Schmiergeld',174.46,TO_TIMESTAMP('20-08-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (214,10027,31050026,10035,31050101,'Gebuehr',913.78,TO_TIMESTAMP('23-08-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (215,10014,31050070,10091,31050115,'Schmiergeld',993.73,TO_TIMESTAMP('31-10-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (216,10027,31050024,10030,31050079,'Gas',304.48,TO_TIMESTAMP('03-09-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (217,10029,31050055,10012,31050047,'Schmiergeld',958.55,TO_TIMESTAMP('24-05-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (218,10067,31050053,10019,31050036,'Unterhalt',74.23,TO_TIMESTAMP('23-07-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (219,10040,31050103,10016,31050107,'Lohn',168.86,TO_TIMESTAMP('10-03-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (220,10013,31050059,10019,31050036,'Miete',115.7,TO_TIMESTAMP('02-08-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (221,10053,31050060,10012,31050034,'Wasser',74.63,TO_TIMESTAMP('22-02-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (222,10005,31050032,10095,31050113,'Verguetung',42735,TO_TIMESTAMP('04-12-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (223,10053,31050060,10035,31050101,'Vorschuss',341.85,TO_TIMESTAMP('10-05-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (224,10052,31050119,10065,31050091,'Gas',285.98,TO_TIMESTAMP('05-08-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (225,10083,31050039,10012,31050034,'Strom',636.77,TO_TIMESTAMP('28-02-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (226,10065,31050091,10039,31050072,'Miete',258.09,TO_TIMESTAMP('25-10-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (227,10046,31050061,10047,31050023,'Rechnung',511.88,TO_TIMESTAMP('16-06-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (228,10029,31050064,10012,31050034,'Rechnung',171.55,TO_TIMESTAMP('16-02-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (229,10029,31050064,10014,31050070,'Gebuehr',354.43,TO_TIMESTAMP('17-05-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (230,10018,31050066,10054,31050076,'Rueckerstattung',170.28,TO_TIMESTAMP('15-09-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (231,10063,31050029,10046,31050117,'Strom',96.53,TO_TIMESTAMP('06-01-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (232,10099,31050104,10046,31050061,'Strom',623.75,TO_TIMESTAMP('04-11-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (233,10019,31050036,10043,31050083,'Miete',442.56,TO_TIMESTAMP('16-08-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (234,10027,31050024,10016,31050051,'Lohn',928.57,TO_TIMESTAMP('14-11-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (235,10031,31050057,10052,31050119,'Gas',846.36,TO_TIMESTAMP('14-06-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (236,10074,31050088,10073,31050092,'Vorschuss',940.2,TO_TIMESTAMP('18-12-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (237,10051,31050031,10099,31050104,'Rueckerstattung',134.42,TO_TIMESTAMP('18-12-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (238,10032,31050042,10055,31050040,'Rueckerstattung',517.79,TO_TIMESTAMP('09-04-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (239,10028,31050089,10046,31050061,'Schmiergeld',341.69,TO_TIMESTAMP('05-05-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (240,10027,31050026,10030,31050079,'Gebuehr',678.84,TO_TIMESTAMP('13-03-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (241,10052,31050119,10065,31050091,'Strom',990.57,TO_TIMESTAMP('04-10-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (242,10053,31050043,10068,31050106,'Verguetung',626.22,TO_TIMESTAMP('11-10-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (243,10040,31050103,10091,31050115,'Gas',765.42,TO_TIMESTAMP('28-12-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (244,10018,31050066,10080,31050084,'Rechnung',533.22,TO_TIMESTAMP('30-07-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (245,10047,31050023,10043,31050035,'Gebuehr',637.14,TO_TIMESTAMP('16-03-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (246,10043,31050035,10031,31050025,'Rechnung',160.13,TO_TIMESTAMP('23-08-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (247,10090,31050022,10072,31050095,'Vorschuss',373.2,TO_TIMESTAMP('07-01-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (248,10055,31050040,10010,31050074,'Miete',645.24,TO_TIMESTAMP('17-02-2013 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (249,10094,31050069,10018,31050066,'Miete',587.25,TO_TIMESTAMP('09-02-2014 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));
Insert into Ueberweisung Values (250,10052,31050119,10070,31050038,'Gebuehr',218.62,TO_TIMESTAMP('21-05-2015 00:00:00', 'DD-MM-YYYY HH24:MI:SS'));

Insert into Konto Values (31050021,10049,7892.27,10000,'EUR');
Insert into Konto Values (31050022,10090,12689.89,5000,'EUR');
Insert into Konto Values (31050023,10047,11275.01,5000,'EUR');
Insert into Konto Values (31050024,10027,14000.25,5000,'EUR');
Insert into Konto Values (31050025,10031,13980.03,15000,'EUR');
Insert into Konto Values (31050026,10027,12054.6,15000,'EUR');
Insert into Konto Values (31050027,10092,5813.20,1000,'EUR');
Insert into Konto Values (31050028,10010,10641.87,20000,'EUR');
Insert into Konto Values (31050029,10063,18314.34,5000,'EUR');
Insert into Konto Values (31050030,10037,2648.28,1000,'EUR');
Insert into Konto Values (31050031,10051,19473.68,20000,'EUR');
Insert into Konto Values (31050032,10005,4935.75,5000,'EUR');
Insert into Konto Values (31050033,10078,11194.33,5000,'EUR');
Insert into Konto Values (31050034,10012,4658.83,1000,'EUR');
Insert into Konto Values (31050035,10043,4537.27,20000,'EUR');
Insert into Konto Values (31050036,10019,14939.9,20000,'EUR');
Insert into Konto Values (31050037,10033,17590.19,20000,'EUR');
Insert into Konto Values (31050038,10070,15551.11,10000,'EUR');
Insert into Konto Values (31050039,10083,18344.1,15000,'EUR');
Insert into Konto Values (31050040,10055,19384.77,5000,'EUR');
Insert into Konto Values (31050041,10019,11264.36,20000,'EUR');
Insert into Konto Values (31050042,10032,12483.85,20000,'EUR');
Insert into Konto Values (31050043,10053,13200.95,15000,'EUR');
Insert into Konto Values (31050044,10088,2088.11,15000,'EUR');
Insert into Konto Values (31050045,10036,8378.09,10000,'EUR');
Insert into Konto Values (31050046,10019,12612.3,20000,'EUR');
Insert into Konto Values (31050047,10012,19706.01,5000,'EUR');
Insert into Konto Values (31050048,10067,594.88,20000,'EUR');
Insert into Konto Values (31050049,10073,3278.40,15000,'EUR');
Insert into Konto Values (31050050,10042,5910.58,20000,'EUR');
Insert into Konto Values (31050051,10016,406.64,5000,'EUR');
Insert into Konto Values (31050052,10027,17065.71,5000,'EUR');
Insert into Konto Values (31050053,10067,607.31,1000,'EUR');
Insert into Konto Values (31050054,10042,16100.95,15000,'EUR');
Insert into Konto Values (31050055,10029,19955.69,10000,'EUR');
Insert into Konto Values (31050056,10008,-940.27,5000,'EUR');
Insert into Konto Values (31050057,10031,1434.64,20000,'EUR');
Insert into Konto Values (31050058,10061,-105.95,10000,'EUR');
Insert into Konto Values (31050059,10013,-220.52,20000,'EUR');
Insert into Konto Values (31050060,10053,9698.87,10000,'EUR');
Insert into Konto Values (31050061,10046,6900.81,5000,'EUR');
Insert into Konto Values (31050062,10094,15707.98,10000,'EUR');
Insert into Konto Values (31050063,10082,15903.73,10000,'EUR');
Insert into Konto Values (31050064,10029,14995.96,1000,'EUR');
Insert into Konto Values (31050065,10045,13465.37,15000,'EUR');
Insert into Konto Values (31050066,10018,19695.91,1000,'EUR');
Insert into Konto Values (31050067,10024,14826.84,10000,'EUR');
Insert into Konto Values (31050068,10026,8409.23,10000,'EUR');
Insert into Konto Values (31050069,10094,10624.71,5000,'EUR');
Insert into Konto Values (31050070,10014,10546.73,5000,'EUR');
Insert into Konto Values (31050071,10058,18839.09,5000,'EUR');
Insert into Konto Values (31050072,10039,8032.85,1000,'EUR');
Insert into Konto Values (31050073,10024,10205.04,15000,'EUR');
Insert into Konto Values (31050074,10010,4576.08,10000,'EUR');
Insert into Konto Values (31050075,10005,15747.5,10000,'EUR');
Insert into Konto Values (31050076,10054,4119.60,20000,'EUR');
Insert into Konto Values (31050077,10081,18605.25,20000,'EUR');
Insert into Konto Values (31050078,10084,8968.73,20000,'EUR');
Insert into Konto Values (31050079,10030,5716.37,15000,'EUR');
Insert into Konto Values (31050080,10064,-216.75,5000,'EUR');
Insert into Konto Values (31050081,10042,7697.08,15000,'EUR');
Insert into Konto Values (31050082,10038,16198.39,1000,'EUR');
Insert into Konto Values (31050083,10043,13611.34,10000,'EUR');
Insert into Konto Values (31050084,10080,4962.97,20000,'EUR');
Insert into Konto Values (31050085,10029,5255.31,1000,'EUR');
Insert into Konto Values (31050086,10026,10111.38,15000,'EUR');
Insert into Konto Values (31050087,10068,14465.89,15000,'EUR');
Insert into Konto Values (31050088,10074,817.40,1000,'EUR');
Insert into Konto Values (31050089,10028,8544.47,5000,'EUR');
Insert into Konto Values (31050090,10066,-459.79,1000,'EUR');
Insert into Konto Values (31050091,10065,-837.31,1000,'EUR');
Insert into Konto Values (31050092,10073,8214.58,15000,'EUR');
Insert into Konto Values (31050093,10059,18020.33,10000,'EUR');
Insert into Konto Values (31050094,10018,13673.02,20000,'EUR');
Insert into Konto Values (31050095,10072,15239.2,1000,'EUR');
Insert into Konto Values (31050096,10040,7507.08,20000,'EUR');
Insert into Konto Values (31050097,10054,5486.96,5000,'EUR');
Insert into Konto Values (31050098,10084,17468.69,1000,'EUR');
Insert into Konto Values (31050099,10096,14554.44,15000,'EUR');
Insert into Konto Values (31050100,10073,18236.09,15000,'EUR');
Insert into Konto Values (31050101,10035,13691.87,20000,'EUR');
Insert into Konto Values (31050102,10087,10834.11,15000,'EUR');
Insert into Konto Values (31050103,10040,17943.19,20000,'EUR');
Insert into Konto Values (31050104,10099,3247.76,20000,'EUR');
Insert into Konto Values (31050105,10070,15435.56,5000,'EUR');
Insert into Konto Values (31050106,10068,3868.19,15000,'EUR');
Insert into Konto Values (31050107,10016,1587.59,15000,'EUR');
Insert into Konto Values (31050108,10085,17181.29,15000,'EUR');
Insert into Konto Values (31050109,10044,8243.58,1000,'EUR');
Insert into Konto Values (31050110,10059,14509.58,10000,'EUR');
Insert into Konto Values (31050111,10061,667.09,20000,'EUR');
Insert into Konto Values (31050112,10065,1700.26,10000,'EUR');
Insert into Konto Values (31050113,10095,5409.01,10000,'EUR');
Insert into Konto Values (31050114,10053,4264.98,15000,'EUR');
Insert into Konto Values (31050115,10091,6522.42,1000,'EUR');
Insert into Konto Values (31050116,10037,18771.72,5000,'EUR');
Insert into Konto Values (31050117,10046,6418.5,20000,'EUR');
Insert into Konto Values (31050118,10046,8227.92,20000,'EUR');
Insert into Konto Values (31050119,10052,2583.49,10000,'EUR');
Insert into Konto Values (31050120,10089,14920.94,10000,'EUR');


Insert into Filiale Values (1,'Zentrale','Am Ring 1',1010,1);
Insert into Filiale Values (2,'Nebensitz 1','Erdberg 20',1030,2);
Insert into Filiale Values (3,'Filiale Bundesland 1 ','Lände 102',4020,5);
Insert into Filiale Values (4,'Nebensitz 2','Hauptalle 12',1030,7);
Insert into Filiale Values (5,'Filiale Bundesland 3','Simmeringerstr. 12',4020,8);
Insert into Filiale Values (6,'Filiale Bundesland 4','Neubaugasse 15',8010,9);

Insert into Bonitaet Values (1,'sehr gut');
Insert into Bonitaet Values (2,'gut');
Insert into Bonitaet Values (3,'mittel');
Insert into Bonitaet Values (4,'schlecht');

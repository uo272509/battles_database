CREATE TABLE enum_codead (

	value_table				VARCHAR(255),
	description			VARCHAR(255),
	CONSTRAINT PK_enum_codead PRIMARY KEY(value_table)
);

CREATE TABLE enum_aeroa (
	
	value_table				INTEGER,
	description			VARCHAR(255),
	CONSTRAINT PK_enum_aeroa PRIMARY KEY(value_table)
);

CREATE TABLE enum_pri (
	value_table				VARCHAR(255),
	description			VARCHAR(255),
	CONSTRAINT PK_enum_pri PRIMARY KEY(value_table)
);

CREATE TABLE enum_wx1 (
	value_table				VARCHAR(255),
	description			VARCHAR(255),
	CONSTRAINT PK_enum_wx1 PRIMARY KEY(value_table)
);

CREATE TABLE enum_wx2 (
	value_table				VARCHAR(255),
	description			VARCHAR(255),
	CONSTRAINT PK_enum_wx2 PRIMARY KEY(value_table)
);

CREATE TABLE enum_wx3 (
	value_table				VARCHAR(255),
	description			VARCHAR(255),
	CONSTRAINT PK_enum_wx3 PRIMARY KEY(value_table)
);

CREATE TABLE enum_wx4 (
	value_table				VARCHAR(255),
	description			VARCHAR(255),
	CONSTRAINT PK_enum_wx4 PRIMARY KEY(value_table)
);

CREATE TABLE enum_wx5 (
	value_table				VARCHAR(255),
	description			VARCHAR(255),
	CONSTRAINT PK_enum_wx5 PRIMARY KEY(value_table)
);

CREATE TABLE enum_terra1 (
	value_table				VARCHAR(255),
	description			VARCHAR(255),
	CONSTRAINT PK_enum_terra1 PRIMARY KEY(value_table)
);

CREATE TABLE enum_terra2 (
	value_table				VARCHAR(255),
	description			VARCHAR(255),
	CONSTRAINT PK_enum_terra2 PRIMARY KEY(value_table)
);

CREATE TABLE enum_terra3 (
	value_table				VARCHAR(255),
	description			VARCHAR(255),
	CONSTRAINT PK_enum_terra3 PRIMARY KEY(value_table)
);

CREATE TABLE enum_postype (
	value_table				INTEGER,
	description			VARCHAR(255),
	CONSTRAINT PK_enum_postype PRIMARY KEY(value_table)
);

CREATE TABLE enum_surpa (
	value_table				INTEGER,
	description			VARCHAR(255),
	CONSTRAINT PK_enum_surpa PRIMARY KEY(value_table)
);

CREATE TABLE enum_crit (
	value_table				INTEGER,
	description			VARCHAR(255),
	CONSTRAINT PK_enum_crit PRIMARY KEY(value_table)
);

CREATE TABLE enum_cea (
	value_table				INTEGER,
	description			VARCHAR(255),
	CONSTRAINT PK_enum_cea PRIMARY KEY(value_table)
);

CREATE TABLE enum_wina (
	value_table				INTEGER,
	description			VARCHAR(255),
	CONSTRAINT PK_enum_wina PRIMARY KEY(value_table)
);

CREATE TABLE enum_post (
	value_table				VARCHAR(255),
	description			VARCHAR(255),
	CONSTRAINT PK_enum_post PRIMARY KEY(value_table)
);

CREATE TABLE enum_reso (
	value_table				VARCHAR(255),
	description			VARCHAR(255),
	CONSTRAINT PK_enum_reso PRIMARY KEY(value_table)
);

CREATE TABLE battles (
	isqno				INTEGER,
	war					VARCHAR(255),
	b_name				VARCHAR(255),
	locn				VARCHAR(255),
	campgn				VARCHAR(255),
	postype				INTEGER,
	post1				VARCHAR(255),
	post2				VARCHAR(255),
	front				INTEGER,
	b_depth				INTEGER,
	b_time				INTEGER,
	cea					INTEGER,
	surpa				INTEGER,
	aeroa				INTEGER,
	leada				INTEGER,
	trnga				INTEGER,
	morala				INTEGER,
	logsa				INTEGER,
	momnta				INTEGER,
	intela				INTEGER,
	techa				INTEGER,
	inita				INTEGER,
	wina				INTEGER,
	kmda				REAL,
	crit				INTEGER,
	quala				INTEGER,
	resa				INTEGER,
	mobila				INTEGER,
	aira				INTEGER,
	fprepa				INTEGER,
	wxa					INTEGER,
	terra				INTEGER,
	leadaa				INTEGER,
	plana				INTEGER,
	surpaa				INTEGER,
	mana				INTEGER,
	logsaa				INTEGER,
	fortsa				INTEGER,
	deepa				INTEGER,
	is_hero				BOOLEAN,
	war2				VARCHAR(255),
	war3				VARCHAR(255),
	cow_warno			VARCHAR(255),
	cow_warname			VARCHAR(255),
	war4				VARCHAR(255),
	war4_theater		VARCHAR(255),
	dbpedia				VARCHAR(255),
	war_initiator		BOOLEAN,
	parent				INTEGER,
	CONSTRAINT PK_battles PRIMARY KEY(isqno),
	CONSTRAINT FK_battles_surpa FOREIGN KEY(surpa) REFERENCES enum_surpa(value_table),
	CONSTRAINT FK_battles_wina FOREIGN KEY (wina) REFERENCES enum_wina(value_table),
	CONSTRAINT FK_battles_postype FOREIGN KEY (postype) REFERENCES enum_postype(value_table),
	CONSTRAINT FK_battles_aeroa FOREIGN KEY (aeroa) REFERENCES enum_aeroa(value_table),
	CONSTRAINT FK_battles_cea FOREIGN KEY (cea) REFERENCES enum_cea(value_table),
	CONSTRAINT FK_battles_post1 FOREIGN KEY (post1) REFERENCES enum_post(value_table),
	CONSTRAINT FK_battles_post2 FOREIGN KEY (post2) REFERENCES enum_post(value_table),
	CONSTRAINT FK_battles_crit FOREIGN KEY(crit) REFERENCES enum_crit(value_table)
);

CREATE TABLE weather (
	id_weather		SERIAL,
	isqno			INTEGER,
	wxno			INTEGER,
	wx1				VARCHAR(255),
	wx2				VARCHAR(255),
	wx3				VARCHAR(255),
	wx4				VARCHAR(255),
	wx5				VARCHAR(255),
	CONSTRAINT PK_WEATHER PRIMARY KEY(id_weather, isqno), --Weak entity
	CONSTRAINT FK_Weather_isqno FOREIGN KEY(isqno) REFERENCES battles(isqno),
	CONSTRAINT FK_Weather_w1 FOREIGN KEY(wx1) REFERENCES enum_wx1(value_table),
	CONSTRAINT FK_Weather_w2 FOREIGN KEY(wx2) REFERENCES enum_wx2(value_table),
	CONSTRAINT FK_Weather_w3 FOREIGN KEY(wx3) REFERENCES enum_wx3(value_table),
	CONSTRAINT FK_Weather_w4 FOREIGN KEY (wx4) REFERENCES enum_wx4(value_table),
	CONSTRAINT FK_Weather_w5 FOREIGN KEY (wx5) REFERENCES enum_wx5(value_table)
);

CREATE TABLE battle_dyads (
	id_battle_dyads		SERIAL PRIMARY KEY,
	isqno				INTEGER,
	attacker			VARCHAR(255),
	defender			VARCHAR(255),
	wt					REAL,
	dyad				VARCHAR(255),
	direction			INTEGER,
	bd_primary				BOOLEAN,
	CONSTRAINT FK_battle_dyads FOREIGN KEY(isqno) REFERENCES battles(isqno)
);

CREATE TABLE battle_durations (
	id_battle_durations		SERIAL PRIMARY KEY,
	isqno					INTEGER,
	datetime_min			TIMESTAMP,
	datetime_max			TIMESTAMP,
	date_time				TIMESTAMP,
	duration1				REAL,
	duration2				REAL,
	CONSTRAINT FK_battle_durations FOREIGN KEY(isqno) REFERENCES battles(isqno)
);

CREATE TABLE battle_actors (
	actor				VARCHAR(255),
	isqno				INTEGER,
	attacker			BOOLEAN,
	n					INTEGER,
	CONSTRAINT PK_battle_actor PRIMARY KEY (actor, isqno, attacker),
	CONSTRAINT FK_battle_actors FOREIGN KEY(isqno) REFERENCES battles(isqno)
	
);

CREATE TABLE commanders ( --recursive
	id_commander		SERIAL PRIMARY KEY,
	isqno				INTEGER,
	attacker			BOOLEAN,
	actors				VARCHAR(255),
	commanders			VARCHAR(255),
	hurt_commander		INTEGER,
	uri					VARCHAR(255),
	CONSTRAINT FK_commanders_isqno FOREIGN KEY(isqno) REFERENCES battles(isqno),
	CONSTRAINT FK_commanders_actors FOREIGN KEY(actors, isqno, attacker) REFERENCES battle_actors(actor, isqno, attacker),
	CONSTRAINT FK_commanders_hurt FOREIGN KEY(hurt_commander) REFERENCES commanders(id_commander)
);

CREATE TABLE front_widths (
	id_front_widths		SERIAL PRIMARY KEY,
	isqno				INTEGER,
	front_number		INTEGER,
	wofa				REAL,
	wofd				REAL,
	time_min			TIMESTAMP,
	time_max			TIMESTAMP,
	CONSTRAINT FK_front_witdths_isqno FOREIGN KEY(isqno) REFERENCES battles(isqno)
);

CREATE TABLE belligerents (
	id_belligerents		SERIAL PRIMARY KEY,
	isqno				INTEGER,
	nam					VARCHAR(255),
	co					VARCHAR(255),
	str					VARCHAR(255),
	code				REAL,
	intst				INTEGER,
	rerp				INTEGER,
	cas					INTEGER,
	finst				INTEGER,
	cav					INTEGER,
	tank				INTEGER,
	lt					INTEGER,
	mbt					INTEGER,
	arty				INTEGER,
	fly					INTEGER,
	ctank				INTEGER,
	carty				INTEGER,
	cfly				INTEGER,
	pri1				VARCHAR(255),
	pri2				VARCHAR(255),
	pri3				VARCHAR(255),
	sec1				VARCHAR(255),
	sec2				VARCHAR(255),
	sec3				VARCHAR(255),
	reso1				VARCHAR(255),
	reso2				VARCHAR(255),
	reso3				VARCHAR(255),
	strpl				VARCHAR(255),
	strmi				INTEGER,
	caspl				INTEGER,
	casmi				INTEGER,
	ach					INTEGER,
	attacker			INTEGER,
	actors				VARCHAR(255),
	CONSTRAINT FK_belligerents_isqno FOREIGN KEY(isqno) REFERENCES battles(isqno),
	CONSTRAINT FK_belligerents_pri1 FOREIGN KEY(pri1) REFERENCES enum_pri(value_table),
	CONSTRAINT FK_belligerents_pri2 FOREIGN KEY(pri2) REFERENCES enum_pri(value_table),
	CONSTRAINT FK_belligerents_pri3 FOREIGN KEY(pri3) REFERENCES enum_pri(value_table),
	CONSTRAINT FK_belligerents_reso1 FOREIGN KEY (reso1) REFERENCES enum_reso (value_table),
	CONSTRAINT FK_belligerents_reso2 FOREIGN KEY (reso2) REFERENCES enum_reso(value_table),
	CONSTRAINT FK_belligerents_reso3 FOREIGN KEY (reso3) REFERENCES enum_reso(value_table)
);

CREATE TABLE active_periods (
	id_active_periods	SERIAL PRIMARY KEY,
	isqno				INTEGER,
	atp_number			INTEGER,
	start_time_min		TIMESTAMP,
	start_time_max		TIMESTAMP,
	end_time_min		TIMESTAMP,
	end_time_max		TIMESTAMP,
	duration_min		REAL,
	duration_max		REAL,
	duration_only		BOOLEAN,
	CONSTRAINT FK_active_periods_isqno FOREIGN KEY(isqno) REFERENCES battles(isqno)
);

CREATE TABLE terrain (
	id_terrain			SERIAL PRIMARY KEY,
	isqno				INTEGER,
	terrano				INTEGER,
	terra1				VARCHAR(255),
	terra2				VARCHAR(255),
	terra3				VARCHAR(255),
	CONSTRAINT FK_terrain_isqno FOREIGN KEY(isqno) REFERENCES battles(isqno),
	CONSTRAINT FK_terrain_terra1 FOREIGN KEY (terra1) REFERENCES enum_terra1(value_table),
	CONSTRAINT FK_terrain_terra2 FOREIGN KEY (terra2) REFERENCES enum_terra2(value_table),
	CONSTRAINT FK_terrain_terra3 FOREIGN KEY (terra3) REFERENCES enum_terra3(value_table)
);

CREATE TABLE uniforms (
	id_uniform			INTEGER,
	u_color				VARCHAR(255),
	CONSTRAINT PK_uniforms PRIMARY KEY(id_uniform)
);

CREATE TABLE actor_uniforms (
	actor				VARCHAR(255),
	attacker			BOOLEAN,
	id_uniform			INTEGER,
	isqno 				INTEGER,
	CONSTRAINT PK_actor_uniforms PRIMARY KEY(actor, id_uniform),
	CONSTRAINT FK_actor FOREIGN KEY(actor, isqno, attacker) REFERENCES battle_actors(actor, isqno, attacker),
	CONSTRAINT FK_uniform FOREIGN KEY (id_uniform) REFERENCES uniforms(id_uniform)
);

CREATE TABLE weapons (
	id_weapon			INTEGER,
	w_type				VARCHAR,
	description			VARCHAR,
	CONSTRAINT PK_weapons PRIMARY KEY(id_weapon)
);

CREATE TABLE battle_weapons (--Aggregation
	weapon				INTEGER,
	actor				VARCHAR(255),
	id_uniform			INTEGER,
	CONSTRAINT PK_battle_weapons PRIMARY KEY(weapon, actor, id_uniform),
	CONSTRAINT FK_battle_weapons_uniform FOREIGN KEY(actor, id_uniform) REFERENCES actor_uniforms(actor, id_uniform),
	CONSTRAINT FK_battle_weapons_weapon FOREIGN KEY(weapon) REFERENCES weapons(id_weapon)
);

COPY enum_codead(value_table, description) FROM 'C:\data\enum_codead.csv' DELIMITER ';' CSV HEADER;
COPY enum_aeroa(value_table, description) FROM 'C:\data\enum_aeroa.csv' DELIMITER ';' CSV HEADER;
COPY enum_pri(value_table, description) FROM 'C:\data\enum_pri.csv' DELIMITER ';' CSV HEADER;
COPY enum_wx1(value_table, description) FROM 'C:\data\enum_wx1.csv' DELIMITER ';' CSV HEADER;
COPY enum_wx2(value_table, description) FROM 'C:\data\enum_wx2.csv' DELIMITER ';' CSV HEADER;
COPY enum_wx3(value_table, description) FROM 'C:\data\enum_wx3.csv' DELIMITER ';' CSV HEADER;
COPY enum_wx4(value_table, description) FROM 'C:\data\enum_wx4.csv' DELIMITER ';' CSV HEADER;
COPY enum_wx5(value_table, description) FROM 'C:\data\enum_wx5.csv' DELIMITER ';' CSV HEADER;
COPY enum_terra1(value_table, description) FROM 'C:\data\enum_terra1.csv' DELIMITER ';' CSV HEADER;
COPY enum_terra2(value_table, description) FROM 'C:\data\enum_terra2.csv' DELIMITER ';' CSV HEADER;
COPY enum_terra3(value_table, description) FROM 'C:\data\enum_terra3.csv' DELIMITER ';' CSV HEADER;
COPY enum_postype(value_table, description) FROM 'C:\data\enum_postype.csv' DELIMITER ';' CSV HEADER;
COPY enum_surpa(value_table, description) FROM 'C:\data\enum_surpa.csv' DELIMITER ';' CSV HEADER;
COPY enum_crit(value_table, description) FROM 'C:\data\enum_crit.csv' DELIMITER ';' CSV HEADER;
COPY enum_cea(value_table, description) FROM 'C:\data\enum_cea.csv' DELIMITER ';' CSV HEADER;
COPY enum_wina(value_table, description) FROM 'C:\data\enum_wina.csv' DELIMITER ';' CSV HEADER;
COPY enum_post(value_table, description) FROM 'C:\data\enum_post.csv' DELIMITER ';' CSV HEADER;
COPY enum_reso(value_table, description) FROM 'C:\data\enum_reso.csv' DELIMITER ';' CSV HEADER;


COPY battles(isqno, war, b_name, locn, campgn, postype, post1, post2, front, b_depth, b_time, aeroa, surpa, cea, leada, trnga, morala, logsa, momnta, intela, techa, inita, wina, kmda, crit, quala, resa, mobila, aira, fprepa, wxa, terra, leadaa, plana, surpaa, mana, logsaa, fortsa, deepa, is_hero, war2, war3, war4, war4_theater, dbpedia, cow_warno, cow_warname, war_initiator, parent) FROM 'C:\data\battles.csv' DELIMITER ';' CSV HEADER;


COPY weather(isqno, wxno, wx1, wx2, wx3, wx4, wx5) FROM 'C:\data\weather.csv' DELIMITER ';' CSV HEADER;
COPY battle_dyads(isqno, attacker, defender, wt, dyad, direction, bd_primary) FROM 'C:\data\battle_dyads.csv' DELIMITER ';' CSV HEADER;
COPY battle_durations(isqno, datetime_min, datetime_max, date_time, duration1, duration2) FROM 'C:\data\battle_durations.csv' DELIMITER ';' CSV HEADER;

COPY battle_actors(isqno, attacker, n, actor) FROM 'C:\data\battle_actors.csv' DELIMITER ';' CSV HEADER;

COPY commanders(isqno, attacker, actors, commanders, uri) FROM 'C:\data\commanders.csv' DELIMITER ';' CSV HEADER;
COPY front_widths(isqno, front_number, wofa, wofd, time_min, time_max) FROM 'C:\data\front_widths.csv' DELIMITER ';' CSV HEADER;
COPY belligerents(isqno, attacker, nam, co, str, code, intst, rerp, cas, finst, cav, tank, lt, mbt, arty, fly, ctank, carty, cfly, pri1, pri2, pri3, sec1, sec2, sec3, reso1, reso2, reso3, strpl, strmi, caspl, casmi, ach, actors) FROM 'C:\data\belligerents.csv' DELIMITER ';' CSV HEADER;
COPY active_periods(isqno, atp_number, start_time_min, start_time_max, end_time_min, end_time_max, duration_min, duration_max, duration_only) FROM 'C:\data\active_periods.csv' DELIMITER ';' CSV HEADER;
COPY terrain(isqno, terrano, terra1, terra2, terra3) FROM 'C:\data\terrain.csv' DELIMITER ';' CSV HEADER;
COPY uniforms(id_uniform, u_color) FROM 'C:\data\uniforms.csv' DELIMITER ';' CSV HEADER;
COPY actor_uniforms(actor, attacker, id_uniform, isqno) FROM 'C:\data\actor_uniforms.csv' DELIMITER ';' CSV HEADER;

COPY weapons(id_weapon, w_type, description) FROM 'C:\data\weapons.csv' DELIMITER ';' CSV HEADER;
--COPY battle_weapons(isqno, weapon) FROM 'C:\data\battle_weapons.csv' DELIMITER ';' CSV HEADER;


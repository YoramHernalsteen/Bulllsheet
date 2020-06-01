-- noinspection SqlDialectInspectionForFile

-- noinspection SqlNoDataSourceInspectionForFile

INSERT INTO production_company (id, name, adres, zipcode, city, phonenumber)
values (nextval('production_company_seq'),'Spetnzas3000', 'Klokstraat 12a', '2600', 'Berchem', '048954225');
INSERT INTO production_company (id, name, adres, zipcode, city, phonenumber)
values (nextval('production_company_seq'),'Woestijnvis', 'Bergstraat 44', '3000', 'Brussel', '048326225');

INSERT INTO user (id, username, password, first_name, last_name, function, job_title, email, phone_number, user_restrictions)
values (nextval('user_seq'),'gebruiker1', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Dirk', 'Dirkinson', 'Crew', 'Acteur', 'dirk@spetnzas.be', '046572225', 'user');
INSERT INTO user (id, username, password, first_name, last_name, function, job_title, email, phone_number, user_restrictions)
values (nextval('user_seq'),'jw', '67dfd02ee45015bcc326201428e99ded7cada27ad6c71870b5b8b9d8dea5620d', 'Jan-Willem', 'Dirkinson', 'Crew', 'Acteur', 'dirk@spetnzas.be', '046572225', 'admin');
INSERT INTO user (id, username, password, first_name, last_name, function, job_title, email, phone_number, user_restrictions)
values (nextval('user_seq'),'yoram', 'f9c6d11c4e24264c7cb7259e4b0559d139575946a24529c0040cd3dfef696175', 'Yoram', 'Hernalsteen', 'Crew', 'Geluid', 'yoram.hernalsteen@gmail.com', '0495249524', 'admin');
INSERT INTO user (id, username, password, first_name, last_name, function, job_title, email, phone_number, user_restrictions)
values (nextval('user_seq'),'yorne', '1e4497ca50b92cbcdfca22ee87e6154ace27a213fa193bd135343b571cf13d', 'Yorne', 'Thys', 'Crew', 'Camera', 'yorne.thys@gmail.com', '049524986', 'admin');
INSERT INTO user (id, username, password, first_name, last_name, function, job_title, email, phone_number, user_restrictions)
values (nextval('user_seq'),'willem', '9fe6cbb9e933ad0b8b4fa94066474e091ee8be696c224b1c1678fcec5a1885cb', 'Willem', 'Teughels', 'Crew', 'Director', 'willemteughels@gmail.com', '0495249719', 'admin');
INSERT INTO user (id, username, password, first_name, last_name, function, job_title, email, phone_number, user_restrictions)
values (nextval('user_seq'),'gebruiker2', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Jef', 'Jefferson', 'Crew', 'Acteur', 'jef@spetnzas.be', '046572225', 'user');
INSERT INTO user (id, username, password, first_name, last_name, function, job_title, email, phone_number, user_restrictions)
values (nextval('user_seq'),'admin', '7b2437df3fa61f68dcb81e5e0eac61eb31ff670d0143803f6a6c784f0e77905', 'admin', 'admin', 'Crew', 'Acteur', 'admin', '046572225', 'admin');

INSERT INTO production (id, name, description, production_company_id) VALUES (nextval('production_seq'), 'Team Scheire', 'Dit is een programma waar Lieve Scheire op zoek gaat naar oplossingen voor mensen met een beperking door een samenwerking van verschillende uitvinders en specialisten',0);
INSERT INTO production (id, name, description, production_company_id) VALUES (nextval('production_seq'), 'De Parelvissers', 'Dit is een moordemisterie drama',1);
INSERT INTO production (id, name, description, production_company_id) VALUES (nextval('production_seq'), 'Clan', 'Comische drama reeks',1);

INSERT INTO shooting_location (id, name, adres, zipcode, city, type, extra_info, production_company_id) VALUES (nextval('shooting_location_seq'), 'Studio 1', 'Klokstraat 14', '2600', 'Berchem', 'Studio', 'Format purpose only', 0);
INSERT INTO shooting_location (id, name, adres, zipcode, city, type, extra_info, production_company_id) VALUES (nextval('shooting_location_seq'), 'Veld, geen hoogspannings torens', 'Blokkenstraat 14', '3060', 'Bertem', 'Veld', 'Format purpose only', 0);
INSERT INTO shooting_location (id, name, adres, zipcode, city, type, extra_info, production_company_id) VALUES (nextval('shooting_location_seq'), 'Bokrijk', 'Bokrijklaan 1', '3600', 'Genk', 'Speeltuin', 'Format purpose only', 1);
INSERT INTO shooting_location (id, name, adres, zipcode, city, type, extra_info, production_company_id) VALUES (nextval('shooting_location_seq'), 'Brussel Metro', 'Wetstraat 84', '3000', 'Brussel', 'Stad', 'Format purpose only', 1);


INSERT INTO availability_user(id, date, available, user_id) VALUES (nextval('user_availability_seq'), '2020-06-12', false, 1);
INSERT INTO availability_user(id, date, available, user_id) VALUES (nextval('user_availability_seq'), '2020-06-12', true, 2);
INSERT INTO availability_user(id, date, available, user_id) VALUES (nextval('user_availability_seq'), '2020-06-12', true, 3);
INSERT INTO availability_user(id, date, available, user_id) VALUES (nextval('user_availability_seq'), '2020-06-12', true, 4);
INSERT INTO availability_user(id, date, available, user_id) VALUES (nextval('user_availability_seq'), '2020-06-12', true, 1);

INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-07-06', '08:30:00', 0, 0, 3);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-07-06', '10:00:00', 1, 1, 2);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-07-05', '09:00:00', 2, 1, 0);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-07-06', '09:00:00', 2, 1, 0);

INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-07-07', '10:00:00', 1, 1, 2);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-07-08', '10:00:00', 1, 1, 2);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-07-09', '10:00:00', 1, 1, 2);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-07-10', '10:00:00', 1, 1, 2);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-07-11', '10:00:00', 1, 1, 2);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-07-12', '10:00:00', 1, 1, 2);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-07-13', '10:00:00', 1, 1, 2);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-07-14', '10:00:00', 1, 1, 2);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-07-15', '10:00:00', 1, 1, 2);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-07-16', '10:00:00', 1, 1, 2);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-07-17', '10:00:00', 1, 1, 2);


INSERT INTO equipment (id, type,  name, specifications, production_company_id, production_id) VALUES (nextval('equipment_seq'), 'Camera', 'High resolution 1', '... Weet ik veel...', 0, 0);
INSERT INTO equipment (id, type,  name, specifications, production_company_id, production_id) VALUES (nextval('equipment_seq'), 'Camera', 'High resolution 2', '... Weet ik veel...', 0, 0);
INSERT INTO equipment (id, type,  name, specifications, production_company_id, production_id) VALUES (nextval('equipment_seq'), 'Camera', 'Slow motion 1', '... Weet ik veel...', 0, 0);
INSERT INTO equipment (id, type,  name, specifications, production_company_id, production_id) VALUES (nextval('equipment_seq'), 'Microphone', 'High pitch filtered 1', '... Weet ik veel...', 0, 0);
INSERT INTO equipment (id, type,  name, specifications, production_company_id, production_id) VALUES (nextval('equipment_seq'), 'Microphone', 'High pitch filtered 2', '... Weet ik veel...', 0, 0);
INSERT INTO equipment (id, type,  name, specifications, production_company_id, production_id) VALUES (nextval('equipment_seq'), 'Electronica', 'walkie-talkies', '... Weet ik veel...', 0, 0);
INSERT INTO equipment (id, type,  name, specifications, production_company_id, production_id) VALUES (nextval('equipment_seq'), 'Electronica', 'Draadloze microzenders', '... Weet ik veel...', 0, 0);

INSERT INTO equipment (id, type,  name, specifications, production_company_id, production_id) VALUES (nextval('equipment_seq'), 'Camera', 'High resolution 1', '... Weet ik veel...', 1, 1);
INSERT INTO equipment (id, type,  name, specifications, production_company_id, production_id) VALUES (nextval('equipment_seq'), 'Camera', 'High resolution 2', '... Weet ik veel...', 1, 1);
INSERT INTO equipment (id, type,  name, specifications, production_company_id, production_id) VALUES (nextval('equipment_seq'), 'Camera', 'Slow motion 1', '... Weet ik veel...', 1, 1);
INSERT INTO equipment (id, type,  name, specifications, production_company_id, production_id) VALUES (nextval('equipment_seq'), 'Microphone', 'High pitch filtered 1', '... Weet ik veel...', 1, 1);
INSERT INTO equipment (id, type,  name, specifications, production_company_id, production_id) VALUES (nextval('equipment_seq'), 'Microphone', 'High pitch filtered 2', '... Weet ik veel...', 1, 1);
INSERT INTO equipment (id, type,  name, specifications, production_company_id, production_id) VALUES (nextval('equipment_seq'), 'Electronica', 'walkie-talkies', '... Weet ik veel...', 1, 1);
INSERT INTO equipment (id, type,  name, specifications, production_company_id, production_id) VALUES (nextval('equipment_seq'), 'Electronica', 'Draadloze microzenders', '... Weet ik veel...', 1, 1);

INSERT INTO equipment (id, type,  name, specifications, production_company_id, production_id) VALUES (nextval('equipment_seq'), 'Camera', 'High resolution 1', '... Weet ik veel...', 1, 2);
INSERT INTO equipment (id, type,  name, specifications, production_company_id, production_id) VALUES (nextval('equipment_seq'), 'Camera', 'Blue filter', '... Weet ik veel...', 1, 2);
INSERT INTO equipment (id, type,  name, specifications, production_company_id, production_id) VALUES (nextval('equipment_seq'), 'Camera', 'Draag harnas', '... Weet ik veel...', 1, 2);
INSERT INTO equipment (id, type,  name, specifications, production_company_id, production_id) VALUES (nextval('equipment_seq'), 'Microphone', 'Low pitch filtered 1', '... Weet ik veel...', 1, 2);
INSERT INTO equipment (id, type,  name, specifications, production_company_id, production_id) VALUES (nextval('equipment_seq'), 'Microphone', 'Ultra pitch filtered 2', '... Weet ik veel...', 1, 2);
INSERT INTO equipment (id, type,  name, specifications, production_company_id, production_id) VALUES (nextval('equipment_seq'), 'Electronica', 'walkie-talkies', '... Weet ik veel...', 1, 2);
INSERT INTO equipment (id, type,  name, specifications, production_company_id, production_id) VALUES (nextval('equipment_seq'), 'Electronica', 'Draadloze microzenders', '... Weet ik veel...', 1, 2);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 0);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 0);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 0);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 0);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 0);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 0);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 1);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 1);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 1);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 1);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 1);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 1);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 3);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 3);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 3);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '12:00', '13:00', 'Verplaatsing naar locatie 2', 'insert adres here', 3);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 2', 3);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 2', 3);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq') , '17:00', '17:45', 'opruimen', 'Locatie 2', 3);

/*INSERT INTO production_company_locations(production_company_id, locations_id) VALUES (0, 0);
INSERT INTO production_company_locations(production_company_id, locations_id) VALUES (0, 1);
INSERT INTO production_company_locations(production_company_id, locations_id) VALUES (1, 2);
INSERT INTO production_company_locations(production_company_id, locations_id) VALUES (1, 3);*/

/*
INSERT INTO user_production_company(users_id, production_company_id) VALUES (0, 0);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (1, 0);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (2, 0);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (3, 0);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (4, 0);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (5, 1);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (6, 1);



INSERT INTO user_production(users_id, production_id) VALUES (0, 0);
INSERT INTO user_production(users_id, production_id) VALUES (1, 0);
INSERT INTO user_production(users_id, production_id) VALUES (2, 0);
INSERT INTO user_production(users_id, production_id) VALUES (3, 0);
INSERT INTO user_production(users_id, production_id) VALUES (4, 0);
INSERT INTO user_production(users_id, production_id) VALUES (1, 1);
INSERT INTO user_production(users_id, production_id) VALUES (2, 1);
INSERT INTO user_production(users_id, production_id) VALUES (3, 1);
INSERT INTO user_production(users_id, production_id) VALUES (4, 1);
INSERT INTO user_production(users_id, production_id) VALUES (5, 1);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (0, 0);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (1, 0);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (2, 0);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (3, 0);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (4, 0);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (5, 1);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (6, 1);


insert into CALLSHEET_ADDITIONAL_LOCATIONS (CALLSHEET_ID, ADDITIONAL_LOCATIONS_ID) values (0,0);
insert into CALLSHEET_ADDITIONAL_LOCATIONS (CALLSHEET_ID, ADDITIONAL_LOCATIONS_ID) values (0,1);
insert into CALLSHEET_ADDITIONAL_LOCATIONS (CALLSHEET_ID, ADDITIONAL_LOCATIONS_ID) values (0,2);
insert into CALLSHEET_ADDITIONAL_LOCATIONS (CALLSHEET_ID, ADDITIONAL_LOCATIONS_ID) values (1,0);
insert into CALLSHEET_ADDITIONAL_LOCATIONS (CALLSHEET_ID, ADDITIONAL_LOCATIONS_ID) values (1,1);
insert into CALLSHEET_ADDITIONAL_LOCATIONS (CALLSHEET_ID, ADDITIONAL_LOCATIONS_ID) values (1,3);
insert into CALLSHEET_ADDITIONAL_LOCATIONS (CALLSHEET_ID, ADDITIONAL_LOCATIONS_ID) values (2,1);
insert into CALLSHEET_ADDITIONAL_LOCATIONS (CALLSHEET_ID, ADDITIONAL_LOCATIONS_ID) values (2,2);
insert into CALLSHEET_ADDITIONAL_LOCATIONS (CALLSHEET_ID, ADDITIONAL_LOCATIONS_ID) values (2,3);
insert into CALLSHEET_ADDITIONAL_LOCATIONS (CALLSHEET_ID, ADDITIONAL_LOCATIONS_ID) values (3,1);
insert into CALLSHEET_ADDITIONAL_LOCATIONS (CALLSHEET_ID, ADDITIONAL_LOCATIONS_ID) values (3,2);
insert into CALLSHEET_ADDITIONAL_LOCATIONS (CALLSHEET_ID, ADDITIONAL_LOCATIONS_ID) values (3,3);
*/
INSERT INTO user_production_company(users_id, production_company_id) VALUES (0, 0);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (1, 0);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (2, 0);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (3, 0);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (4, 0);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (5, 0);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (5, 1);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (6, 1);

INSERT INTO user_production(users_id, production_id) VALUES (0, 0);
INSERT INTO user_production(users_id, production_id) VALUES (1, 0);
INSERT INTO user_production(users_id, production_id) VALUES (2, 0);
INSERT INTO user_production(users_id, production_id) VALUES (3, 0);
INSERT INTO user_production(users_id, production_id) VALUES (5, 0);
INSERT INTO user_production(users_id, production_id) VALUES (4, 1);
INSERT INTO user_production(users_id, production_id) VALUES (5, 1);
INSERT INTO user_production(users_id, production_id) VALUES (6, 1);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (0, 0);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (0, 1);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (0, 2);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (0, 3);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (0, 4);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (1, 0);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (1, 5);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (1, 6);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (2, 1);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (2, 3);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (2, 5);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (3, 1);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (3, 3);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (3, 5);


insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'10:30',0,0 );
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'12:30',0,1 );
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'18:30',0,2 );
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'06:30',0,3 );
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'20:30',0,4 );
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'20:30',1,1);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'10:30',1,2);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'17:30',1,3);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'22:30',1,4);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'04:30',2,1);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'20:30',2,2);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'23:30',2,3);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'21:30',2,4);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'20:30',3,1);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'05:30',3,2);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'17:30',3,3);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'01:30',3,4);
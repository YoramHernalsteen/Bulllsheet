-- noinspection SqlDialectInspectionForFile

-- noinspection SqlNoDataSourceInspectionForFile

INSERT INTO production_company (id, name, adres, zipcode, city, phonenumber)
values (nextval('production_company_seq'),'Spetnzas3000', 'Klokstraat 12a', '2600', 'Berchem', '048954225');
INSERT INTO production_company (id, name, adres, zipcode, city, phonenumber)
values (nextval('production_company_seq'),'Woestijnvis', 'Bergstraat 44', '3000', 'Brussel', '048326225');

INSERT INTO user (id, username, password, first_name, last_name, function, job_title, email, phone_number, user_restrictions)
values (nextval('user_seq'),'admin', '7b2437df3fa61f68dcb81e5e0eac61eb31ff670d0143803f6a6c784f0e77905', 'admin', 'admin', 'Crew', 'Acteur', 'admin', '0465722253', 'admin');
INSERT INTO user (id, username, password, first_name, last_name, function, job_title, email, phone_number, user_restrictions)
values (nextval('user_seq'),'gebruiker1', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Dirk', 'Dirkinson', 'Crew', 'Acteur', 'dirk@spetnzas.be', '0465722254', 'user');
INSERT INTO user (id, username, password, first_name, last_name, function, job_title, email, phone_number, user_restrictions)
values (nextval('user_seq'),'jw', '67dfd02ee45015bcc326201428e99ded7cada27ad6c71870b5b8b9d8dea5620d', 'Jan-Willem', 'Lemmens', 'Crew', 'Acteur', 'janwillemlemmens@hotmail.com', '0465722256', 'admin');
INSERT INTO user (id, username, password, first_name, last_name, function, job_title, email, phone_number, user_restrictions)
values (nextval('user_seq'),'yorne', '1e4497ca50b92cbcdfca22ee87e6154ace27a213fa193bd135343b571cf13d', 'Yorne', 'Thys', 'Crew', 'Camera', 'yorne.thys@gmail.com', '049524986', 'admin');
INSERT INTO user (id, username, password, first_name, last_name, function, job_title, email, phone_number, user_restrictions)
values (nextval('user_seq'),'gebruiker2', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Jef', 'Jefferson', 'Crew', 'Acteur', 'jef@spetnzas.be', '0465722250', 'user');
INSERT INTO user (id, username, password, first_name, last_name, function, job_title, email, phone_number, user_restrictions)
values (nextval('user_seq'),'willem', '9fe6cbb9e933ad0b8b4fa94066474e091ee8be696c224b1c1678fcec5a1885cb', 'Willem', 'Teughels', 'Crew', 'Director', 'willemteughels@gmail.com', '0495249719', 'admin');
INSERT INTO user (id, username, password, first_name, last_name, function, job_title, email, phone_number, user_restrictions)
values (nextval('user_seq'),'gebruiker3', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Tom', 'Vandyck', 'Cast', 'Acteur', 'tomvandyck@spetnzas.be', '0465342275', 'user');
INSERT INTO user (id, username, password, first_name, last_name, function, job_title, email, phone_number, user_restrictions)
values (nextval('user_seq'),'gebruiker4', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Goddelieve', 'Clerinkx', 'Crew', 'Director', 'goddelieveclerinkx@woestijnvis.be', '0465775252', 'user');
INSERT INTO user (id, username, password, first_name, last_name, function, job_title, email, phone_number, user_restrictions)
values (nextval('user_seq'),'gebruiker5', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Annick', 'Op De Berg', 'Crew', 'Geluid', 'annickopdeberg@woestijnvis.be', '0465722125', 'user');
INSERT INTO user (id, username, password, first_name, last_name, function, job_title, email, phone_number, user_restrictions)
values (nextval('user_seq'),'gebruiker6', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Rick', 'Morty', 'Crew', 'Camera', 'pickle-rick@madlad.be', '0469696969', 'user');
INSERT INTO user (id, username, password, first_name, last_name, function, job_title, email, phone_number, user_restrictions)
values (nextval('user_seq'),'gebruiker7', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Brigitte', 'Johnson', 'Cast', 'Acteur', 'brigittejohnson@woestijnvis.be', '0465725225', 'user');
INSERT INTO user (id, username, password, first_name, last_name, function, job_title, email, phone_number, user_restrictions)
values (nextval('user_seq'),'gebruiker8', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Max', 'Wampus', 'Cast', 'Acteur', 'maxwampus@woestijnvis.be', '0465725225', 'user');
INSERT INTO user (id, username, password, first_name, last_name, function, job_title, email, phone_number, user_restrictions)
values (nextval('user_seq'),'yoram', 'f9c6d11c4e24264c7cb7259e4b0559d139575946a24529c0040cd3dfef696175', 'Yoram', 'Hernalsteen', 'Crew', 'Geluid', 'yoram.hernalsteen@gmail.com', '0495249524', 'admin');

INSERT INTO production (id, name, description, production_company_id) VALUES (nextval('production_seq'), 'Team Scheire', 'Dit is een programma waar Lieve Scheire op zoek gaat naar oplossingen voor mensen met een beperking door een samenwerking van verschillende uitvinders en specialisten',0);
INSERT INTO production (id, name, description, production_company_id) VALUES (nextval('production_seq'), 'De Parelvissers', 'Dit is een moordemisterie drama',1);
INSERT INTO production (id, name, description, production_company_id) VALUES (nextval('production_seq'), 'Clan', 'Comische drama reeks',1);

INSERT INTO shooting_location (id, name, adres, zipcode, city, type, extra_info, production_company_id) VALUES (nextval('shooting_location_seq'), 'Studio 1', 'Klokstraat 14', '2600', 'Berchem', 'Studio', 'Format purpose only', 0);
INSERT INTO shooting_location (id, name, adres, zipcode, city, type, extra_info, production_company_id) VALUES (nextval('shooting_location_seq'), 'Wei', 'Dorpstraat 65', '3118', 'Werchter', 'Veld', 'Format purpose only', 0);
INSERT INTO shooting_location (id, name, adres, zipcode, city, type, extra_info, production_company_id) VALUES (nextval('shooting_location_seq'), 'Veld, geen hoogspannings torens', 'Blokkenstraat 14', '3060', 'Bertem', 'Veld', 'Format purpose only', 0);
INSERT INTO shooting_location (id, name, adres, zipcode, city, type, extra_info, production_company_id) VALUES (nextval('shooting_location_seq'), 'Bokrijk', 'Bokrijklaan 1', '3600', 'Genk', 'Speeltuin', 'Format purpose only', 1);
INSERT INTO shooting_location (id, name, adres, zipcode, city, type, extra_info, production_company_id) VALUES (nextval('shooting_location_seq'), 'Brussel Metro', 'Wetstraat 84', '3000', 'Brussel', 'Stad', 'Format purpose only', 1);
INSERT INTO shooting_location (id, name, adres, zipcode, city, type, extra_info, production_company_id) VALUES (nextval('shooting_location_seq'), 'Studio', 'Ambachtslaan 105', '3000', 'Brussel', 'Studio', 'Format purpose only', 1);


INSERT INTO availability_user(id, date, available, user_id) VALUES (nextval('user_availability_seq'), '2020-06-12', false, 1);
INSERT INTO availability_user(id, date, available, user_id) VALUES (nextval('user_availability_seq'), '2020-06-12', true, 2);
INSERT INTO availability_user(id, date, available, user_id) VALUES (nextval('user_availability_seq'), '2020-06-12', true, 3);
INSERT INTO availability_user(id, date, available, user_id) VALUES (nextval('user_availability_seq'), '2020-06-12', true, 4);
INSERT INTO availability_user(id, date, available, user_id) VALUES (nextval('user_availability_seq'), '2020-06-12', true, 1);

-- team scheire
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-01', '08:30:00', 0, 0, 2);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-02', '09:30:00', 0, 0, 0);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-03', '08:00:00', 0, 0, 0);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-04', '08:00:00', 0, 0, 0);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-05', '08:30:00', 0, 0, 2);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-08', '10:00:00', 0, 0, 2);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-09', '06:00:00', 0, 0, 1);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-10', '06:30:00', 0, 0, 2);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-11', '08:00:00', 0, 0, 1);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-12', '08:00:00', 0, 0, 1);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-15', '08:00:00', 0, 0, 0);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-16', '08:00:00', 0, 0, 0);

-- parelvissers
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-01', '10:00:00', 1, 1, 3);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-02', '09:40:00', 1, 1, 4);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-03', '06:50:00', 1, 1, 5);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-04', '06:00:00', 1, 1, 3);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-05', '06:00:00', 1, 1, 3);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-08', '12:00:00', 1, 1, 4);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-09', '12:00:00', 1, 1, 5);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-10', '10:00:00', 1, 1, 4);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-11', '09:00:00', 1, 1, 3);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-12', '08:00:00', 1, 1, 3);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-13', '08:00:00', 1, 1, 4);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-15', '08:00:00', 1, 1, 4);

-- clan
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-01', '09:00:00', 2, 1, 3);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-02', '09:00:00', 2, 1, 3);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-03', '09:30:00', 2, 1, 3);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-04', '09:15:00', 2, 1, 4);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-05', '09:15:00', 2, 1, 5);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-08', '10:00:00', 2, 1, 5);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-09', '10:00:00', 2, 1, 4);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-10', '09:00:00', 2, 1, 3);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-11', '10:00:00', 2, 1, 3);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-12', '09:45:00', 2, 1, 4);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-15', '09:45:00', 2, 1, 5);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-16', '08:00:00', 2, 1, 5);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-17', '08:00:00', 2, 1, 3);
INSERT INTO callsheet (id, date, calltime, production_id, production_company_id, shooting_location_id) VALUES (nextval('callsheet_seq'), '2020-06-18', '08:00:00', 2, 1, 4);

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

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 4);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 4);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 4);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 4);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 4);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 4);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 5);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 5);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 5);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 5);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 5);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 5);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 6);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 6);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 6);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 6);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 6);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 6);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 7);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 7);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 7);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 7);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 7);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 7);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 8);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 8);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 8);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 8);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 8);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 8);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 9);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 9);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 9);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 9);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 9);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 9);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 10);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 10);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 10);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 10);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 10);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 10);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 11);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 11);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 11);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 11);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 11);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 11);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 12);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 12);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 12);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 12);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 12);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 12);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 13);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 13);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 13);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 13);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 13);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 13);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 14);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 14);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 14);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 14);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 14);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 14);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 15);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 15);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 15);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 15);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 15);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 15);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 16);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 16);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 16);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 16);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 16);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 16);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 17);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 17);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 17);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 17);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 17);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 17);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 18);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 18);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 18);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 18);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 18);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 18);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 19);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 19);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 19);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 19);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 19);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 19);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 20);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 20);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 20);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 20);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 20);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 20);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 21);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 21);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 21);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 21);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 21);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 21);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 22);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 22);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 22);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 22);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 22);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 22);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 23);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 23);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 23);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 23);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 23);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 23);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 24);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 24);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 24);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 24);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 24);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 24);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 25);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 25);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 25);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 25);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 25);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 25);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 26);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 26);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 26);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 26);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 26);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 26);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 27);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 27);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 27);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 27);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 27);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 27);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 28);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 28);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 28);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 28);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 28);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 28);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 29);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 29);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 29);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 29);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 29);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 29);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 30);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 30);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 30);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 30);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 30);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 30);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 31);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 31);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 31);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 31);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 31);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 31);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 32);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 32);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 32);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 32);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 32);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 32);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 3);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 33);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 33);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 33);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 33);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 33);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 34);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 34);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 34);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 34);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 34);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 34);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 35);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 35);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 35);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 35);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 35);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 35);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 36);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 36);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 36);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 36);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 36);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 36);

INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:00', '9:30', 'Samenkomen op locatie', 'Locatie 1', 37);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '9:30', '10:00', 'klaarzetten voor opname', 'Locatie 1', 37);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '10:00', '12:00', 'opname deel 1', 'Locatie 1', 37);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '13:00', '15:00', 'opname deel 2', 'Locatie 1', 37);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '15:00', '17:00', 'opname deel 3', 'Locatie 1', 37);
INSERT INTO day_planning(id, time_start, time_end, description, location, callsheet_id) VALUES (nextval('planning_seq'), '17:00', '17:45', 'opruimen', 'Locatie 1', 37);

INSERT INTO user_production_company(users_id, production_company_id) VALUES (0, 0);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (1, 0);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (2, 0);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (3, 0);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (4, 0);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (5, 0);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (5, 0);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (6, 1);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (7, 1);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (8, 1);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (9, 1);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (10, 1);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (11, 1);
INSERT INTO user_production_company(users_id, production_company_id) VALUES (12, 1);

INSERT INTO user_production(users_id, production_id) VALUES (0, 0);
INSERT INTO user_production(users_id, production_id) VALUES (0, 1);
INSERT INTO user_production(users_id, production_id) VALUES (0, 2);
INSERT INTO user_production(users_id, production_id) VALUES (1, 0);
INSERT INTO user_production(users_id, production_id) VALUES (2, 0);
INSERT INTO user_production(users_id, production_id) VALUES (3, 0);
INSERT INTO user_production(users_id, production_id) VALUES (4, 0);
INSERT INTO user_production(users_id, production_id) VALUES (5, 1);
INSERT INTO user_production(users_id, production_id) VALUES (6, 1);
INSERT INTO user_production(users_id, production_id) VALUES (7, 1);
INSERT INTO user_production(users_id, production_id) VALUES (8, 1);
INSERT INTO user_production(users_id, production_id) VALUES (9, 2);
INSERT INTO user_production(users_id, production_id) VALUES (10, 2);
INSERT INTO user_production(users_id, production_id) VALUES (11, 2);
INSERT INTO user_production(users_id, production_id) VALUES (12, 2);

--team scheire
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (0, 1);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (0, 2);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (0, 3);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (0, 4);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (1, 1);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (1, 2);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (1, 3);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (1, 4);


INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (2, 1);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (2, 2);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (2, 3);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (2, 4);


INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (3, 1);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (3, 2);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (3, 3);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (3, 4);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (4, 1);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (4, 2);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (4, 3);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (4, 4);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (5, 1);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (5, 2);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (5, 3);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (5, 4);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (6, 1);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (6, 2);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (6, 3);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (6, 4);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (7, 1);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (7, 2);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (7, 3);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (7, 4);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (8, 1);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (8, 2);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (8, 3);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (8, 4);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (9, 1);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (9, 2);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (9, 3);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (9, 4);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (10, 1);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (10, 2);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (10, 3);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (10, 4);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (11, 1);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (11, 2);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (11, 3);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (11, 4);

--parelvissers
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (12, 5);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (12, 6);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (12, 7);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (12, 8);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (13, 5);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (13, 6);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (13, 7);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (13, 8);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (14, 5);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (14, 6);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (14, 7);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (14, 8);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (15, 5);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (15, 6);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (15, 7);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (15, 8);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (16, 5);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (16, 6);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (16, 7);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (16, 8);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (17, 5);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (17, 6);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (17, 7);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (17, 8);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (18, 5);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (18, 6);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (18, 7);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (18, 8);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (19, 5);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (19, 6);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (19, 7);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (19, 8);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (20, 5);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (20, 6);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (20, 7);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (20, 8);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (21, 5);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (21, 6);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (21, 7);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (21, 8);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (22, 5);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (22, 6);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (22, 7);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (22, 8);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (23, 5);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (23, 6);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (23, 7);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (23, 8);

--clan
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (24, 9);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (24, 10);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (24, 11);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (24, 12);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (25, 9);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (25, 10);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (25, 11);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (25, 12);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (26, 9);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (26, 10);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (26, 11);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (26, 12);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (27, 9);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (27, 10);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (27, 11);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (27, 12);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (28, 9);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (28, 10);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (28, 11);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (28, 12);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (29, 9);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (29, 10);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (29, 11);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (29, 12);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (30, 9);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (30, 10);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (30, 11);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (30, 12);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (31, 9);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (31, 10);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (31, 11);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (31, 12);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (32, 9);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (32, 10);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (32, 11);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (32, 12);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (33, 9);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (33, 10);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (33, 11);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (33, 12);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (34, 9);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (34, 10);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (34, 11);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (34, 12);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (35, 9);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (35, 10);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (35, 11);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (35, 12);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (36, 9);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (36, 10);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (36, 11);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (36, 12);

INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (37, 9);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (37, 10);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (37, 11);
INSERT INTO callsheet_users(callsheets_id, users_id) VALUES (37, 12);


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

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'21:30',4,1);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'06:30',4,2);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'12:30',4,3);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'05:30',4,4);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'16:30',5,1);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'04:30',5,2);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'11:30',5,3);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'13:30',5,4);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'20:30',6,1);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'05:30',6,2);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'17:30',6,3);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'01:30',6,4);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'21:30',7,1);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'10:30',7,2);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'13:30',7,3);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'09:30',7,4);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'23:30',8,1);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'09:30',8,2);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'12:30',8,3);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'03:30',8,4);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'17:30',9,1);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'08:30',9,2);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'14:30',9,3);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'09:30',9,4);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'20:30',10,1);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'05:30',10,2);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'17:30',10,3);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'01:30',10,4);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'22:30',11,1);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'09:30',11,2);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'12:30',11,3);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'10:30',11,4);

--parelvissers
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'08:30',12,5);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'19:30',12,6);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'14:30',12,7);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'12:30',12,8);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'10:30',13,5);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'12:30',13,6);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'16:30',13,7);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'14:30',13,8);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'08:30',14,5);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'20:30',14,6);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'17:30',14,7);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'11:30',14,8);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'09:30',15,5);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'08:30',15,6);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'19:30',15,7);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'13:30',15,8);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'09:30',16,5);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'11:30',16,6);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'10:30',16,7);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'12:30',16,8);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'16:30',17,5);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'10:30',17,6);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'12:30',17,7);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'10:30',17,8);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'08:30',18,5);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'19:30',18,6);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'14:30',18,7);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'12:30',18,8);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'01:30',19,5);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'16:30',19,6);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'14:30',19,7);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'13:30',19,8);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'10:30',20,5);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'07:30',20,6);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'06:30',20,7);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'05:30',20,8);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'08:30',21,5);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'19:30',21,6);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'14:30',21,7);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'12:30',21,8);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'08:30',22,5);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'10:30',22,6);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'12:30',22,7);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'08:30',22,8);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'23:30',23,5);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'16:30',23,6);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'10:30',23,7);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'11:30',23,8);

--clan
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'23:30',24,9);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'16:30',24,10);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'10:30',24,11);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'11:30',24,12);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'10:30',25,9);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'12:30',25,10);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'18:30',25,11);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'09:30',25,12);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'17:30',26,9);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'16:00',26,10);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'10:00',26,11);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'11:00',26,12);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'23:00',27,9);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'12:00',27,10);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'10:45',27,11);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'11:15',27,12);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'09:30',28,9);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'12:30',28,10);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'17:30',28,11);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'07:30',28,12);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'20:30',29,9);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'12:30',29,10);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'18:30',29,11);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'19:30',29,12);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'23:00',30,9);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'12:00',30,10);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'10:45',30,11);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'11:15',30,12);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'07:00',31,9);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'06:00',31,10);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'05:45',31,11);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'09:15',31,12);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'12:00',32,9);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'19:00',32,10);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'08:45',32,11);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'16:15',32,12);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'12:00',33,9);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'23:00',33,10);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'07:45',33,11);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'05:15',33,12);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'22:00',34,9);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'08:00',34,10);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'09:45',34,11);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'05:15',34,12);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'12:00',35,9);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'16:00',35,10);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'05:45',35,11);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'04:15',35,12);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'17:00',36,9);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'16:00',36,10);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'11:45',36,11);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'12:15',36,12);

insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'22:00',37,9);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'13:00',37,10);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'15:45',37,11);
insert into INDIVIDUAL_CALLTIME  (ID, CALLTIME, CALLSHEET_ID, USER_ID) values (nextval('individual_seq'),'16:15',37,12);



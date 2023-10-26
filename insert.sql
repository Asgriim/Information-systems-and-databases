INSERT INTO pilot(NAME, SURNAME, BIRTHDAY) VALUES ('aboba','zhmih','2028-11-11');
INSERT INTO pilot(NAME, SURNAME, BIRTHDAY) VALUES ('GAV','NO','2028-11-11');
INSERT INTO pilot(NAME, SURNAME, BIRTHDAY) VALUES ('Nill', 'Kiggers','2228-01-02');
INSERT INTO pilot(NAME, SURNAME, BIRTHDAY) VALUES ('Ryan','Gosling','2222-03-03');


INSERT INTO galaxy(name) VALUES ('Milky way');

INSERT INTO spaceship(type, name, capacity, speed, fuel) VALUES ('cargo','Discovery',1000,150,300);
INSERT INTO spaceship(type, name, capacity, speed, fuel) VALUES ('combat','Drive',100,500,250);

INSERT INTO licence(pilot_id, spaceship_id) VALUES (4,2);
INSERT INTO licence(PILOT_ID, SPACESHIP_ID) VALUES (3,1);

INSERT INTO planet(NAME, TYPE, X, Y, Z, GALAXY_ID) VALUES ('Jupiter','gas giant',1337.2,1,3,1);
INSERT INTO planet(NAME, TYPE, X, Y, Z, GALAXY_ID) VALUES ('Mars','rocky',223.2,123,323,1);

INSERT INTO base(FUEL_CAPACITY, MISSIONS_NUM, CAPACITY) VALUES (1000,2,3);
INSERT INTO base(FUEL_CAPACITY, MISSIONS_NUM, CAPACITY) VALUES (2000,0,5);

INSERT INTO mission(NAME, GOAL, PLANET_ID, DEADLINE, BASE_ID) VALUES ('j-12','search gravity field of jupiter',1,NULL,1);
INSERT INTO mission(NAME, GOAL, PLANET_ID, DEADLINE, BASE_ID) VALUES ('j-13','get elements',1,NULL,1);
INSERT INTO mission(NAME, GOAL, PLANET_ID, DEADLINE, BASE_ID) VALUES ('ER-14/88','dig rock return to base',2,'2250-05-04',1);

insert into on_mission(mission_id, pilot_id) VALUES (1,3);
insert into on_mission(mission_id, pilot_id) VALUES (2,3);

INSERT INTO on_base(BASE_ID, SPACESHIP_ID) VALUES (1,2);
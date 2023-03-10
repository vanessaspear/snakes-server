CREATE TABLE `Species` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name` NVARCHAR(50) NOT NULL
);
INSERT INTO `Species` (id, name) VALUES (1, 'Procyon cancrivorus');
INSERT INTO `Species` (id, name) VALUES (2, 'Aonyx cinerea');
INSERT INTO `Species` (id, name) VALUES (3, 'Pitangus sulphuratus');
INSERT INTO `Species` (id, name) VALUES (4, 'Nannopterum harrisi');
INSERT INTO `Species` (id, name) VALUES (5, 'Tamiasciurus hudsonicus');

SELECT * FROM `Species`

CREATE TABLE `Owners` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`first_name` NVARCHAR(50) NOT NULL,
	`last_name` NVARCHAR(50) NOT NULL,
	`email` NVARCHAR(50) NOT NULL
);
INSERT INTO `Owners` (id, first_name, last_name, email) VALUES (1, 'Jarrett', 'Thunder', 'jthunder0@amazon.de');
INSERT INTO `Owners` (id, first_name, last_name, email) VALUES (2, 'Charline', 'Manton', 'cmanton1@china.com.cn');
INSERT INTO `Owners` (id, first_name, last_name, email) VALUES (3, 'Lura', 'Cornbell', 'lcornbell2@ning.com');
INSERT INTO `Owners` (id, first_name, last_name, email) VALUES (4, 'Bo', 'Pearn', 'bpearn3@hp.com');
INSERT INTO `Owners` (id, first_name, last_name, email) VALUES (5, 'Veronike', 'Hellings', 'vhellings4@utexas.edu');
INSERT INTO `Owners` (id, first_name, last_name, email) VALUES (6, 'Yule', 'Tilmouth', 'ytilmouth5@nps.gov');
INSERT INTO `Owners` (id, first_name, last_name, email) VALUES (7, 'Agata', 'Vasilmanov', 'avasilmanov6@fema.gov');
INSERT INTO `Owners` (id, first_name, last_name, email) VALUES (8, 'Irvin', 'Folshom', 'ifolshom7@mapquest.com');
INSERT INTO `Owners` (id, first_name, last_name, email) VALUES (9, 'Jeanna', 'Dyas', 'jdyas8@amazon.co.uk');
INSERT INTO `Owners` (id, first_name, last_name, email) VALUES (10, 'Ulick', 'Drinkhill', 'udrinkhill9@wsj.com');

SELECT * FROM `Owners`

CREATE TABLE `Snakes` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name` NVARCHAR(50) NOT NULL,
	`owner_id` INTEGER NOT NULL,
	`species_id` INTEGER NOT NULL,
	`gender` NVARCHAR(50) NOT NULL,
	`color` NVARCHAR(50) NOT NULL,
    FOREIGN KEY(`owner_id`) REFERENCES `Owners`(`id`),
    FOREIGN KEY(`species_id`) REFERENCES `Species`(`id`)
);

INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (1, 'Annot??e', 2, 2, 'Female', 'Turquoise');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (2, 'Lor??ne', 1, 1, 'Male', 'Green');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (3, 'Aliz??e', 8, 1, 'Female', 'Blue');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (4, 'Oc??ane', 7, 1, 'Male', 'Khaki');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (5, 'Alm??rinda', 4, 4, 'Male', 'Yellow');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (6, 'Ath??na', 3, 5, 'Female', 'Violet');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (7, 'B??n??dicte', 8, 2, 'Male', 'Mauv');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (8, 'Sol??ne', 2, 3, 'Male', 'Yellow');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (9, 'A??', 6, 4, 'Female', 'Goldenrod');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (10, 'Andr??a', 9, 5, 'Male', 'Turquoise');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (11, 'No??mie', 6, 2, 'Male', 'Crimson');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (12, 'Gwena??lle', 4, 1, 'Male', 'Puce');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (13, 'Oc??ane', 9, 5, 'Male', 'Turquoise');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (14, 'B??reng??re', 5, 2, 'Female', 'Turquoise');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (15, 'Lys??a', 7, 2, 'Male', 'Fuscia');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (16, 'M??ghane', 1, 2, 'Male', 'Crimson');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (17, 'L??onore', 5, 1, 'Female', 'Yellow');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (18, 'Ana??l', 6, 5, 'Female', 'Puce');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (19, 'N??lie', 7, 1, 'Female', 'Pink');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (20, 'B??atrice', 9, 1, 'Female', 'Green');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (21, 'G??sta', 5, 2, 'Female', 'Mauv');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (22, 'Cl??lia', 5, 3, 'Male', 'Purple');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (23, 'M??ng', 2, 5, 'Female', 'Khaki');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (24, 'Ang??lique', 2, 1, 'Female', 'Mauv');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (25, 'Aim??e', 10, 2, 'Female', 'Pink');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (26, 'Marie-fran??oise', 2, 1, 'Female', 'Green');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (27, 'T??n', 4, 2, 'Female', 'Teal');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (28, 'Andr??anne', 5, 4, 'Female', 'Green');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (29, 'St??phanie', 8, 5, 'Female', 'Purple');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (30, 'Li??', 7, 1, 'Female', 'Maroon');

SELECT * FROM `Snakes`

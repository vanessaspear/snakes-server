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

INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (1, 'Annotée', 2, 2, 'Female', 'Turquoise');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (2, 'Lorène', 1, 1, 'Male', 'Green');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (3, 'Alizée', 8, 1, 'Female', 'Blue');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (4, 'Océane', 7, 1, 'Male', 'Khaki');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (5, 'Almérinda', 4, 4, 'Male', 'Yellow');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (6, 'Athéna', 3, 5, 'Female', 'Violet');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (7, 'Bénédicte', 8, 2, 'Male', 'Mauv');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (8, 'Solène', 2, 3, 'Male', 'Yellow');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (9, 'Aí', 6, 4, 'Female', 'Goldenrod');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (10, 'Andréa', 9, 5, 'Male', 'Turquoise');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (11, 'Noémie', 6, 2, 'Male', 'Crimson');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (12, 'Gwenaëlle', 4, 1, 'Male', 'Puce');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (13, 'Océane', 9, 5, 'Male', 'Turquoise');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (14, 'Bérengère', 5, 2, 'Female', 'Turquoise');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (15, 'Lyséa', 7, 2, 'Male', 'Fuscia');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (16, 'Méghane', 1, 2, 'Male', 'Crimson');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (17, 'Léonore', 5, 1, 'Female', 'Yellow');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (18, 'Anaël', 6, 5, 'Female', 'Puce');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (19, 'Nélie', 7, 1, 'Female', 'Pink');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (20, 'Béatrice', 9, 1, 'Female', 'Green');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (21, 'Gösta', 5, 2, 'Female', 'Mauv');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (22, 'Clélia', 5, 3, 'Male', 'Purple');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (23, 'Méng', 2, 5, 'Female', 'Khaki');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (24, 'Angélique', 2, 1, 'Female', 'Mauv');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (25, 'Aimée', 10, 2, 'Female', 'Pink');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (26, 'Marie-françoise', 2, 1, 'Female', 'Green');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (27, 'Tán', 4, 2, 'Female', 'Teal');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (28, 'Andréanne', 5, 4, 'Female', 'Green');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (29, 'Stéphanie', 8, 5, 'Female', 'Purple');
INSERT INTO `Snakes` (id, name, owner_id, species_id, gender, color) VALUES (30, 'Liè', 7, 1, 'Female', 'Maroon');

SELECT * FROM `Snakes`

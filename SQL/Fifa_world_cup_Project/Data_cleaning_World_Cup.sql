
SELECT * FROM world_cup_2026_sql ;

CREATE TABLE world_cup_stage_1 LIKE world_cup_2026_sql;

SELECT * FROM world_cup_stage_1;

INSERT INTO world_cup_stage_1
SELECT *  FROM world_cup_2026_sql;

SELECT * FROM world_cup_stage_1;

CREATE TABLE `world_cup_stage_2` (
  `player_name` text,
  `country` text,
  `current_club` text,
  `transfer_value` text,
  `player_height` text,
  `player_weight` text,
  `shirt_number` int DEFAULT NULL,
  `predicted_world_cup_finish` text,
  `current_world_ranking` int DEFAULT NULL,
  `row_num`int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO world_cup_stage_2
SELECT *, ROW_NUMBER() OVER(PARTITION BY player_name, country, current_club, transfer_value, player_height, player_weight) AS row_num
FROM world_cup_stage_1;

SELECT * FROM world_cup_stage_2;
SELECT * FROM world_cup_stage_2 WHERE row_num > 1;
DELETE FROM world_cup_stage_2 WHERE row_Num > 1;

SELECT DISTINCT player_name FROM world_cup_stage_2;
SELECT DISTINCT country, player_name, current_club, transfer_value,player_height,player_weight,shirt_number,predicted_world_cup_finish,current_world_ranking FROM world_cup_stage_2 ORDER BY country ASC;

SELECT * FROM world_cup_stage_2 WHERE player_name LIKE "Virgil%";


UPDATE world_cup_stage_2
SET current_club = "Liverpool" WHERE current_club = "None";

UPDATE world_cup_stage_2
SET transfer_value = "130m" WHERE transfer_value = "";

UPDATE world_cup_stage_2
SET player_weight = "66 kg" WHERE player_weight = "66";

UPDATE world_cup_stage_2
SET country = "Argentina" WHERE country LIKE "Arg%";

UPDATE world_cup_stage_2
SET player_height = "177cm" WHERE player_height = "";

UPDATE world_cup_stage_2
SET player_weight = "91 kg" WHERE player_weight = "";

SELECT player_height_in_cm FROM world_cup_stage_2;

SELECT player_name, player_weight_in_kg FROM world_cup_stage_2 WHERE player_weight_in_kg > 85;

UPDATE world_cup_stage_2
SET player_height_in_cm = "178" WHERE player_height_in_cm = "178cm";

ALTER TABLE world_cup_stage_2
MODIFY COLUMN player_height_in_cm INT;

UPDATE world_cup_stage_2
SET transfer_value = REPLACE(transfer_value,"m","");

ALTER TABLE world_cup_stage_2
MODIFY COLUMN transfer_value INT;

ALTER TABLE world_cup_stage_2
RENAME COLUMN transfer_value TO transfer_value_in_millions;

SELECT * FROM world_cup_stage_2;


ALTER TABLE world_cup_stage_2
DROP COLUMN row_num;

DROP TABLE IF EXISTS final_table;

CREATE TABLE final_table LIKE world_cup_stage_2;
INSERT INTO final_table
SELECT * FROM world_cup_stage_2 order by country;


ALTER TABLE final_table
DROP COLUMN players_per_country;

SELECT * FROM  final_table;








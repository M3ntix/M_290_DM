CREATE DATABASE Kantineverwaltung;

use Kantineverwaltung;


-- Erstelle die Tabelle für Menüpläne
CREATE TABLE menu_plans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    week_start_date DATE,
    budget DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    archived BOOLEAN DEFAULT 0
);
_
-- Erstelle die Tabelle für Menüoptionen
CREATE TABLE menu_options (
    id INT AUTO_INCREMENT PRIMARY KEY,
    menu_plan_id INT,
    name VARCHAR(255),
    description TEXT,
    is_pork BOOLEAN DEFAULT 0,
    is_vegan BOOLEAN DEFAULT 0,
    FOREIGN KEY (menu_plan_id) REFERENCES menu_plans(id)
);

-- Füge einen weiteren Menüplan hinzu
INSERT INTO menu_plans (week_start_date, budget) VALUES ('2024-01-17', 120.00);

-- Füge Menüoptionen für den neuen Menüplan hinzu
INSERT INTO menu_options (menu_plan_id, name, description, is_pork, is_vegan) VALUES
(2, 'Hähnchen Menü', 'Ein Menü mit Hähnchenfleisch', 0, 0),
(2, 'Veganes Menü', 'Ein veganes Menü ohne Fleisch', 0, 1),
(2, 'Rindfleisch Menü', 'Ein Menü mit Rindfleisch', 0, 0);

-- Füge einen weiteren Menüplan hinzu
INSERT INTO menu_plans (week_start_date, budget) VALUES ('2024-01-24', 110.00);

-- Füge Menüoptionen für den neuen Menüplan hinzu
INSERT INTO menu_options (menu_plan_id, name, description, is_pork, is_vegan) VALUES
(3, 'Lachs Menü', 'Ein Menü mit Lachs', 0, 0),
(3, 'Veganes Menü', 'Ein veganes Menü ohne Fleisch', 0, 1),
(3, 'Putenfleisch Menü', 'Ein Menü mit Putenfleisch', 0, 0);

-- Füge weitere Menüoptionen für den ersten Menüplan hinzu
INSERT INTO menu_options (menu_plan_id, name, description, is_pork, is_vegan) VALUES
(1, 'Hühnchen Menü', 'Ein Menü mit Hühnchenfleisch', 0, 0),
(1, 'Veganes Menü', 'Ein veganes Menü ohne Fleisch', 0, 1);


-- Füge Menüoptionen für den neuen Menüplan hinzu
INSERT INTO menu_options (menu_plan_id, name, description, is_pork, is_vegan) VALUES
(3, 'Lachs Menü', 'Ein Menü mit Lachs', 0, 0),
(3, 'Veganes Menü', 'Ein veganes Menü ohne Fleisch', 0, 1),
(3, 'Putenfleisch Menü', 'Ein Menü mit Putenfleisch', 0, 0);

-- Füge weitere Menüoptionen für den ersten Menüplan hinzu
INSERT INTO menu_options (menu_plan_id, name, description, is_pork, is_vegan) VALUES
(1, 'Hühnchen Menü', 'Ein Menü mit Hühnchenfleisch', 0, 0),
(1, 'Veganes Menü', 'Ein veganes Menü ohne Fleisch', 0, 1);

INSERT INTO menu_options (menu_plan_id, name, description, is_pork, is_vegan) VALUES
(1, 'Lachs Menü', 'Ein Menü mit Lachs', 0, 0),
(1, 'Gemüse-Pasta Menü', 'Eine vegetarische Pasta', 0, 1),
(2, 'Rindfleisch Menü', 'Ein Menü mit Rindfleisch', 0, 0),
(2, 'Spinat-Quiche Menü', 'Ein vegetarisches Quiche', 0, 1),
(3, 'Hühnchen-Menü', 'Ein Menü mit Hühnchenfleisch', 0, 0),
(3, 'Gemüse-Curry Menü', 'Ein vegetarisches Curry', 0, 1);

use Kantineverwaltung;



/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

SHOW DATABASES;

-- ---------------------------------------------------------------------------------------------------------------------
-- 2.2 Gegebenenfalls müssen wir DB-Instanzen löschen
-- ---------------------------------------------------------------------------------------------------------------------
DROP DATABASE appDB;



-- ---------------------------------------------------------------------------------------------------------------------
-- 2.3 Anlegen einer druckfrischen Datenbank-Instanz
-- ---------------------------------------------------------------------------------------------------------------------
CREATE DATABASE appDB /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

SELECT user FROM mysql.user;
DROP USER 'appAdmin'@'localhost';
CREATE USER  'appAdmin'@'localhost' IDENTIFIED BY'appAdminPW';
ALTER USER 'appAdmin'@'localhost' IDENTIFIED WITH mysql_native_password BY 'appAdminPW';
--    host: 'localhost',
--    user: 'appAdmin',
--    password: 'appAdminPW',
--    database: 'appDB',

GRANT all privileges ON appDB.* TO 'appAdmin'@'localhost';
const mysql = require("mysql");

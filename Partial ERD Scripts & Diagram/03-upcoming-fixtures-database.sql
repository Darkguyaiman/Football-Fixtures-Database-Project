SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP DATABASE IF EXISTS `upcoming_fixtures_db`;
CREATE DATABASE `upcoming_fixtures_db` 
    DEFAULT CHARACTER SET utf8mb4 
    COLLATE utf8mb4_unicode_ci;

USE `upcoming_fixtures_db`;

-- Competition table
CREATE TABLE `competitions` (
    `competition_id` INT AUTO_INCREMENT PRIMARY KEY,
    `competition_name` VARCHAR(100) NOT NULL,
    `season` VARCHAR(20),
    `country` VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Stadium table
CREATE TABLE `stadiums` (
    `stadium_id` INT AUTO_INCREMENT PRIMARY KEY,
    `stadium_name` VARCHAR(100) NOT NULL,
    `location` VARCHAR(100) NOT NULL,
    `city` VARCHAR(50),
    `country` VARCHAR(50),
    `capacity` INT UNSIGNED,
    
    UNIQUE KEY `uk_stadium_name_city` (`stadium_name`, `city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Referee table
CREATE TABLE `referees` (
    `referee_id` INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `nationality` VARCHAR(50),
    `fifa_badge` BOOLEAN DEFAULT FALSE,
    
    INDEX `idx_referee_name` (`last_name`, `first_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Team table
CREATE TABLE `teams` (
    `team_id` INT AUTO_INCREMENT PRIMARY KEY,
    `team_name` VARCHAR(100) NOT NULL,
    `short_name` VARCHAR(10),
    
    UNIQUE KEY `uk_team_name` (`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Fixture table
CREATE TABLE `fixtures` (
    `fixture_id` INT AUTO_INCREMENT PRIMARY KEY,
    `match_date` DATE NOT NULL,
    `kick_off_time` TIME NOT NULL,
    `home_team_id` INT NOT NULL,
    `away_team_id` INT NOT NULL,
    `competition_id` INT NOT NULL,
    `stadium_id` INT NOT NULL,
    `referee_id` INT,
    `match_week` TINYINT UNSIGNED,
    `status` ENUM('Scheduled', 'Live', 'Finished', 'Postponed', 'Cancelled') DEFAULT 'Scheduled',
    `attendance` INT UNSIGNED,
    
    INDEX `idx_fixture_date` (`match_date`),
    INDEX `idx_fixture_home_team` (`home_team_id`),
    INDEX `idx_fixture_away_team` (`away_team_id`),
    INDEX `idx_fixture_status` (`status`),
    
    FOREIGN KEY (`home_team_id`) REFERENCES `teams`(`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`away_team_id`) REFERENCES `teams`(`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`competition_id`) REFERENCES `competitions`(`competition_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`stadium_id`) REFERENCES `stadiums`(`stadium_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (`referee_id`) REFERENCES `referees`(`referee_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Upcoming Fixtures View
CREATE VIEW `upcoming_fixtures` AS
SELECT 
    f.fixture_id,
    f.match_date,
    f.kick_off_time,
    ht.team_name as home_team,
    at.team_name as away_team,
    c.competition_name,
    s.stadium_name,
    CONCAT(r.first_name, ' ', r.last_name) as referee_name
FROM `fixtures` f
JOIN `teams` ht ON f.home_team_id = ht.team_id
JOIN `teams` at ON f.away_team_id = at.team_id
JOIN `competitions` c ON f.competition_id = c.competition_id
JOIN `stadiums` s ON f.stadium_id = s.stadium_id
LEFT JOIN `referees` r ON f.referee_id = r.referee_id
WHERE f.match_date >= CURDATE() AND f.status = 'Scheduled'
ORDER BY f.match_date, f.kick_off_time;

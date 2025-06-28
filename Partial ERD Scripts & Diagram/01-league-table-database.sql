SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP DATABASE IF EXISTS `league_table_db`;
CREATE DATABASE `league_table_db` 
    DEFAULT CHARACTER SET utf8mb4 
    COLLATE utf8mb4_unicode_ci;

USE `league_table_db`;


CREATE TABLE `competitions` (
    `competition_id` INT AUTO_INCREMENT PRIMARY KEY,
    `competition_name` VARCHAR(100) NOT NULL,
    `sponsor` VARCHAR(100),
    `season` VARCHAR(20),
    `country` VARCHAR(50),
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    UNIQUE KEY `uk_competition_name_season` (`competition_name`, `season`),
    INDEX `idx_competition_country` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `teams` (
    `team_id` INT AUTO_INCREMENT PRIMARY KEY,
    `team_name` VARCHAR(100) NOT NULL,
    `short_name` VARCHAR(10),
    `founded_year` YEAR,
    `primary_color` VARCHAR(20),
    `secondary_color` VARCHAR(20),
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    UNIQUE KEY `uk_team_name` (`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `team_statistics` (
    `team_stats_id` INT AUTO_INCREMENT PRIMARY KEY,
    `team_id` INT NOT NULL,
    `season` VARCHAR(20) NOT NULL,
    `competition_id` INT,
    `matches_played` SMALLINT UNSIGNED DEFAULT 0,
    `wins` SMALLINT UNSIGNED DEFAULT 0,
    `draws` SMALLINT UNSIGNED DEFAULT 0,
    `losses` SMALLINT UNSIGNED DEFAULT 0,
    `goals_for` SMALLINT UNSIGNED DEFAULT 0,
    `goals_against` SMALLINT UNSIGNED DEFAULT 0,
    `goal_difference` SMALLINT DEFAULT 0,
    `points` SMALLINT UNSIGNED DEFAULT 0,
    `clean_sheets` SMALLINT UNSIGNED DEFAULT 0,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    UNIQUE KEY `uk_team_season_competition` (`team_id`, `season`, `competition_id`),
    INDEX `idx_team_stats_season` (`season`),
    INDEX `idx_team_stats_points` (`points` DESC),
    
    FOREIGN KEY (`team_id`) REFERENCES `teams`(`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`competition_id`) REFERENCES `competitions`(`competition_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- League Table View
CREATE VIEW `league_table` AS
SELECT 
    t.team_name,
    ts.matches_played,
    ts.wins,
    ts.draws,
    ts.losses,
    ts.goals_for,
    ts.goals_against,
    ts.goal_difference,
    ts.points,
    RANK() OVER (PARTITION BY ts.competition_id ORDER BY ts.points DESC, ts.goal_difference DESC, ts.goals_for DESC) as position
FROM `team_statistics` ts
JOIN `teams` t ON ts.team_id = t.team_id
JOIN `competitions` c ON ts.competition_id = c.competition_id
WHERE ts.season = '2024-25';

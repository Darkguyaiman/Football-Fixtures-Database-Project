SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP DATABASE IF EXISTS `player_performance_db`;
CREATE DATABASE `player_performance_db` 
    DEFAULT CHARACTER SET utf8mb4 
    COLLATE utf8mb4_unicode_ci;

USE `player_performance_db`;

-- Competition table
CREATE TABLE `competitions` (
    `competition_id` INT AUTO_INCREMENT PRIMARY KEY,
    `competition_name` VARCHAR(100) NOT NULL,
    `season` VARCHAR(20),
    `country` VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Position table
CREATE TABLE `positions` (
    `position_id` INT AUTO_INCREMENT PRIMARY KEY,
    `position_name` VARCHAR(50) NOT NULL,
    `position_code` VARCHAR(5) NOT NULL,
    `position_category` ENUM('Goalkeeper', 'Defender', 'Midfielder', 'Forward') NOT NULL,
    
    UNIQUE KEY `uk_position_name` (`position_name`),
    UNIQUE KEY `uk_position_code` (`position_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Team table
CREATE TABLE `teams` (
    `team_id` INT AUTO_INCREMENT PRIMARY KEY,
    `team_name` VARCHAR(100) NOT NULL,
    `short_name` VARCHAR(10),
    
    UNIQUE KEY `uk_team_name` (`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Player table
CREATE TABLE `players` (
    `player_id` INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `date_of_birth` DATE,
    `nationality` VARCHAR(50),
    `squad_number` TINYINT UNSIGNED,
    `team_id` INT,
    `position_id` INT,
    
    UNIQUE KEY `uk_player_squad_team` (`squad_number`, `team_id`),
    INDEX `idx_player_name` (`last_name`, `first_name`),
    INDEX `idx_player_team` (`team_id`),
    INDEX `idx_player_position` (`position_id`),
    
    FOREIGN KEY (`team_id`) REFERENCES `teams`(`team_id`) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (`position_id`) REFERENCES `positions`(`position_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Player Statistics table
CREATE TABLE `player_statistics` (
    `stats_id` INT AUTO_INCREMENT PRIMARY KEY,
    `player_id` INT NOT NULL,
    `season` VARCHAR(20) NOT NULL,
    `competition_id` INT,
    `matches_played` SMALLINT UNSIGNED DEFAULT 0,
    `matches_started` SMALLINT UNSIGNED DEFAULT 0,
    `minutes_played` INT UNSIGNED DEFAULT 0,
    `goals_scored` SMALLINT UNSIGNED DEFAULT 0,
    `assists` SMALLINT UNSIGNED DEFAULT 0,
    `yellow_cards` SMALLINT UNSIGNED DEFAULT 0,
    `red_cards` SMALLINT UNSIGNED DEFAULT 0,
    `pass_accuracy` DECIMAL(5,2),
    
    UNIQUE KEY `uk_player_season_competition` (`player_id`, `season`, `competition_id`),
    INDEX `idx_stats_player` (`player_id`),
    INDEX `idx_stats_season` (`season`),
    
    FOREIGN KEY (`player_id`) REFERENCES `players`(`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`competition_id`) REFERENCES `competitions`(`competition_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Player Performance View
CREATE VIEW `player_performance` AS
SELECT 
    CONCAT(p.first_name, ' ', p.last_name) as player_name,
    t.team_name,
    pos.position_name,
    ps.matches_played,
    ps.goals_scored,
    ps.assists,
    ps.yellow_cards,
    ps.red_cards,
    ROUND(ps.minutes_played / NULLIF(ps.matches_played, 0), 0) as avg_minutes_per_match,
    ps.pass_accuracy
FROM `player_statistics` ps
JOIN `players` p ON ps.player_id = p.player_id
JOIN `teams` t ON p.team_id = t.team_id
JOIN `positions` pos ON p.position_id = pos.position_id
WHERE ps.season = '2024-25' AND ps.matches_played > 0;

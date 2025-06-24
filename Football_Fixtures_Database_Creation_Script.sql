SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- Create database with proper character set and collation
DROP DATABASE IF EXISTS `football_fixtures_db`;
CREATE DATABASE `football_fixtures_db` 
    DEFAULT CHARACTER SET utf8mb4 
    COLLATE utf8mb4_unicode_ci;

USE `football_fixtures_db`;

-- Competition table
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

-- Stadium table
CREATE TABLE `stadiums` (
    `stadium_id` INT AUTO_INCREMENT PRIMARY KEY,
    `stadium_name` VARCHAR(100) NOT NULL,
    `location` VARCHAR(100) NOT NULL,
    `city` VARCHAR(50),
    `country` VARCHAR(50),
    `capacity` INT UNSIGNED,
    `surface_type` ENUM('Grass', 'Artificial', 'Hybrid') DEFAULT 'Grass',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    UNIQUE KEY `uk_stadium_name_city` (`stadium_name`, `city`),
    INDEX `idx_stadium_location` (`city`, `country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Coach table
CREATE TABLE `coaches` (
    `coach_id` INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `nationality` VARCHAR(50),
    `date_of_birth` DATE,
    `license_level` VARCHAR(20),
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX `idx_coach_name` (`last_name`, `first_name`),
    INDEX `idx_coach_nationality` (`nationality`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Team table
CREATE TABLE `teams` (
    `team_id` INT AUTO_INCREMENT PRIMARY KEY,
    `team_name` VARCHAR(100) NOT NULL,
    `short_name` VARCHAR(10),
    `founded_year` YEAR,
    `coach_id` INT,
    `home_stadium_id` INT,
    `primary_color` VARCHAR(20),
    `secondary_color` VARCHAR(20),
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    UNIQUE KEY `uk_team_name` (`team_name`),
    INDEX `idx_team_coach` (`coach_id`),
    INDEX `idx_team_stadium` (`home_stadium_id`),
    
    FOREIGN KEY (`coach_id`) REFERENCES `coaches`(`coach_id`) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (`home_stadium_id`) REFERENCES `stadiums`(`stadium_id`) ON DELETE SET NULL ON UPDATE CASCADE
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

-- Player Status table
CREATE TABLE `player_statuses` (
    `status_id` INT AUTO_INCREMENT PRIMARY KEY,
    `status_name` VARCHAR(50) NOT NULL,
    `status_description` TEXT,
    
    UNIQUE KEY `uk_status_name` (`status_name`)
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
    `status_id` INT DEFAULT 1,
    `height_cm` SMALLINT UNSIGNED,
    `weight_kg` SMALLINT UNSIGNED,
    `preferred_foot` ENUM('Left', 'Right', 'Both'),
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    UNIQUE KEY `uk_player_squad_team` (`squad_number`, `team_id`),
    INDEX `idx_player_name` (`last_name`, `first_name`),
    INDEX `idx_player_team` (`team_id`),
    INDEX `idx_player_position` (`position_id`),
    INDEX `idx_player_nationality` (`nationality`),
    
    FOREIGN KEY (`team_id`) REFERENCES `teams`(`team_id`) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (`position_id`) REFERENCES `positions`(`position_id`) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (`status_id`) REFERENCES `player_statuses`(`status_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Referee table
CREATE TABLE `referees` (
    `referee_id` INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `nationality` VARCHAR(50),
    `fifa_badge` BOOLEAN DEFAULT FALSE,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX `idx_referee_name` (`last_name`, `first_name`)
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
    `weather_conditions` VARCHAR(100),
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX `idx_fixture_date` (`match_date`),
    INDEX `idx_fixture_home_team` (`home_team_id`),
    INDEX `idx_fixture_away_team` (`away_team_id`),
    INDEX `idx_fixture_competition` (`competition_id`),
    INDEX `idx_fixture_status` (`status`),
    
    FOREIGN KEY (`home_team_id`) REFERENCES `teams`(`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`away_team_id`) REFERENCES `teams`(`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`competition_id`) REFERENCES `competitions`(`competition_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`stadium_id`) REFERENCES `stadiums`(`stadium_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (`referee_id`) REFERENCES `referees`(`referee_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Match Result table
CREATE TABLE `match_results` (
    `result_id` INT AUTO_INCREMENT PRIMARY KEY,
    `fixture_id` INT NOT NULL,
    `home_goals` TINYINT UNSIGNED DEFAULT 0,
    `away_goals` TINYINT UNSIGNED DEFAULT 0,
    `home_goals_ht` TINYINT UNSIGNED DEFAULT 0,
    `away_goals_ht` TINYINT UNSIGNED DEFAULT 0,
    `winner_team_id` INT,
    `result_type` ENUM('Regular', 'Extra Time', 'Penalties') DEFAULT 'Regular',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    UNIQUE KEY `uk_fixture_result` (`fixture_id`),
    INDEX `idx_result_winner` (`winner_team_id`),
    
    FOREIGN KEY (`fixture_id`) REFERENCES `fixtures`(`fixture_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`winner_team_id`) REFERENCES `teams`(`team_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Goal table
CREATE TABLE `goals` (
    `goal_id` INT AUTO_INCREMENT PRIMARY KEY,
    `fixture_id` INT NOT NULL,
    `player_id` INT NOT NULL,
    `team_id` INT NOT NULL,
    `minute` TINYINT UNSIGNED NOT NULL,
    `added_time` TINYINT UNSIGNED DEFAULT 0,
    `goal_type` ENUM('Regular', 'Penalty', 'Free Kick', 'Header', 'Own Goal') DEFAULT 'Regular',
    `is_own_goal` BOOLEAN DEFAULT FALSE,
    `body_part` ENUM('Left Foot', 'Right Foot', 'Head', 'Other') DEFAULT 'Right Foot',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX `idx_goal_fixture` (`fixture_id`),
    INDEX `idx_goal_player` (`player_id`),
    INDEX `idx_goal_team` (`team_id`),
    INDEX `idx_goal_minute` (`minute`),
    
    FOREIGN KEY (`fixture_id`) REFERENCES `fixtures`(`fixture_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`player_id`) REFERENCES `players`(`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`team_id`) REFERENCES `teams`(`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Assist table
CREATE TABLE `assists` (
    `assist_id` INT AUTO_INCREMENT PRIMARY KEY,
    `goal_id` INT NOT NULL,
    `player_id` INT NOT NULL,
    `assist_type` ENUM('Pass', 'Cross', 'Through Ball', 'Set Piece') DEFAULT 'Pass',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE KEY `uk_goal_assist` (`goal_id`),
    INDEX `idx_assist_player` (`player_id`),
    
    FOREIGN KEY (`goal_id`) REFERENCES `goals`(`goal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`player_id`) REFERENCES `players`(`player_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Cards table
CREATE TABLE `cards` (
    `card_id` INT AUTO_INCREMENT PRIMARY KEY,
    `fixture_id` INT NOT NULL,
    `player_id` INT NOT NULL,
    `team_id` INT NOT NULL,
    `card_type` ENUM('Yellow', 'Red', 'Second Yellow') NOT NULL,
    `minute` TINYINT UNSIGNED NOT NULL,
    `added_time` TINYINT UNSIGNED DEFAULT 0,
    `reason` VARCHAR(200),
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX `idx_card_fixture` (`fixture_id`),
    INDEX `idx_card_player` (`player_id`),
    INDEX `idx_card_type` (`card_type`),
    
    FOREIGN KEY (`fixture_id`) REFERENCES `fixtures`(`fixture_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`player_id`) REFERENCES `players`(`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`team_id`) REFERENCES `teams`(`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Match Events table
CREATE TABLE `match_events` (
    `event_id` INT AUTO_INCREMENT PRIMARY KEY,
    `fixture_id` INT NOT NULL,
    `player_id` INT,
    `team_id` INT NOT NULL,
    `event_type` ENUM('Substitution', 'Injury', 'VAR Check', 'Offside', 'Foul', 'Corner', 'Throw In') NOT NULL,
    `minute` TINYINT UNSIGNED NOT NULL,
    `added_time` TINYINT UNSIGNED DEFAULT 0,
    `description` TEXT,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX `idx_event_fixture` (`fixture_id`),
    INDEX `idx_event_player` (`player_id`),
    INDEX `idx_event_type` (`event_type`),
    
    FOREIGN KEY (`fixture_id`) REFERENCES `fixtures`(`fixture_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`player_id`) REFERENCES `players`(`player_id`) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (`team_id`) REFERENCES `teams`(`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
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
    `clean_sheets` SMALLINT UNSIGNED DEFAULT 0,
    `saves` SMALLINT UNSIGNED DEFAULT 0,
    `pass_accuracy` DECIMAL(5,2),
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    UNIQUE KEY `uk_player_season_competition` (`player_id`, `season`, `competition_id`),
    INDEX `idx_stats_player` (`player_id`),
    INDEX `idx_stats_season` (`season`),
    
    FOREIGN KEY (`player_id`) REFERENCES `players`(`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`competition_id`) REFERENCES `competitions`(`competition_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Team Statistics table
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

-- Player Fixture Performance table
CREATE TABLE `player_fixture_stats` (
    `player_fixture_id` INT AUTO_INCREMENT PRIMARY KEY,
    `player_id` INT NOT NULL,
    `fixture_id` INT NOT NULL,
    `minutes_played` TINYINT UNSIGNED DEFAULT 0,
    `goals_scored` TINYINT UNSIGNED DEFAULT 0,
    `assists` TINYINT UNSIGNED DEFAULT 0,
    `yellow_cards` TINYINT UNSIGNED DEFAULT 0,
    `red_cards` TINYINT UNSIGNED DEFAULT 0,
    `shots_on_target` TINYINT UNSIGNED DEFAULT 0,
    `shots_off_target` TINYINT UNSIGNED DEFAULT 0,
    `passes_completed` SMALLINT UNSIGNED DEFAULT 0,
    `passes_attempted` SMALLINT UNSIGNED DEFAULT 0,
    `rating` DECIMAL(3,1),
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE KEY `uk_player_fixture` (`player_id`, `fixture_id`),
    INDEX `idx_pfs_fixture` (`fixture_id`),
    INDEX `idx_pfs_rating` (`rating` DESC),
    
    FOREIGN KEY (`player_id`) REFERENCES `players`(`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`fixture_id`) REFERENCES `fixtures`(`fixture_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Player Contracts table
CREATE TABLE `player_contracts` (
    `contract_id` INT AUTO_INCREMENT PRIMARY KEY,
    `player_id` INT NOT NULL,
    `team_id` INT NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `weekly_salary` DECIMAL(10,2),
    `signing_bonus` DECIMAL(12,2),
    `contract_type` ENUM('Professional', 'Youth', 'Loan', 'Trial') DEFAULT 'Professional',
    `is_active` BOOLEAN DEFAULT TRUE,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX `idx_contract_player` (`player_id`),
    INDEX `idx_contract_team` (`team_id`),
    INDEX `idx_contract_dates` (`start_date`, `end_date`),
    INDEX `idx_contract_active` (`is_active`),
    
    FOREIGN KEY (`player_id`) REFERENCES `players`(`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`team_id`) REFERENCES `teams`(`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Medical Records table
CREATE TABLE `medical_records` (
    `record_id` INT AUTO_INCREMENT PRIMARY KEY,
    `player_id` INT NOT NULL,
    `injury_type` VARCHAR(100) NOT NULL,
    `injury_description` TEXT,
    `injury_date` DATE NOT NULL,
    `expected_return_date` DATE,
    `actual_return_date` DATE,
    `severity` ENUM('Minor', 'Moderate', 'Severe', 'Career Threatening') DEFAULT 'Minor',
    `treatment_notes` TEXT,
    `medical_staff` VARCHAR(100),
    `is_active` BOOLEAN DEFAULT TRUE,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX `idx_medical_player` (`player_id`),
    INDEX `idx_medical_injury_date` (`injury_date`),
    INDEX `idx_medical_active` (`is_active`),
    INDEX `idx_medical_severity` (`severity`),
    
    FOREIGN KEY (`player_id`) REFERENCES `players`(`player_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Team Staff table
CREATE TABLE `team_staff` (
    `staff_id` INT AUTO_INCREMENT PRIMARY KEY,
    `team_id` INT NOT NULL,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `role` VARCHAR(50) NOT NULL,
    `department` ENUM('Coaching', 'Medical', 'Technical', 'Administrative', 'Security') NOT NULL,
    `hire_date` DATE,
    `salary` DECIMAL(10,2),
    `is_active` BOOLEAN DEFAULT TRUE,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX `idx_staff_team` (`team_id`),
    INDEX `idx_staff_role` (`role`),
    INDEX `idx_staff_department` (`department`),
    INDEX `idx_staff_active` (`is_active`),
    
    FOREIGN KEY (`team_id`) REFERENCES `teams`(`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Insert Player Positions
INSERT INTO `positions` (`position_name`, `position_code`, `position_category`) VALUES
('Goalkeeper', 'GK', 'Goalkeeper'),
('Centre-Back', 'CB', 'Defender'),
('Left-Back', 'LB', 'Defender'),
('Right-Back', 'RB', 'Defender'),
('Wing-Back', 'WB', 'Defender'),
('Defensive Midfielder', 'CDM', 'Midfielder'),
('Central Midfielder', 'CM', 'Midfielder'),
('Attacking Midfielder', 'CAM', 'Midfielder'),
('Left Midfielder', 'LM', 'Midfielder'),
('Right Midfielder', 'RM', 'Midfielder'),
('Left Winger', 'LW', 'Forward'),
('Right Winger', 'RW', 'Forward'),
('Centre-Forward', 'CF', 'Forward'),
('Striker', 'ST', 'Forward');

-- Insert Player Statuses
INSERT INTO `player_statuses` (`status_name`, `status_description`) VALUES
('Active', 'Player is available for selection'),
('Injured', 'Player is currently injured'),
('Suspended', 'Player is suspended from matches'),
('On Loan', 'Player is on loan to another club'),
('Retired', 'Player has retired from professional football'),
('Transfer Listed', 'Player is available for transfer'),
('Youth Development', 'Player is in youth development program');

-- Insert Sample Competitions
INSERT INTO `competitions` (`competition_name`, `sponsor`, `season`, `country`) VALUES
('Premier League', 'Barclays', '2024-25', 'England'),
('Championship', 'Sky Bet', '2024-25', 'England'),
('FA Cup', 'Emirates', '2024-25', 'England'),
('UEFA Champions League', 'Heineken', '2024-25', 'Europe'),
('UEFA Europa League', 'Just Eat', '2024-25', 'Europe');


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

-- Top Scorers View
CREATE VIEW `top_scorers` AS
SELECT 
    CONCAT(p.first_name, ' ', p.last_name) as player_name,
    t.team_name,
    ps.goals_scored,
    ps.assists,
    ps.matches_played,
    ROUND(ps.goals_scored / NULLIF(ps.matches_played, 0), 2) as goals_per_match
FROM `player_statistics` ps
JOIN `players` p ON ps.player_id = p.player_id
JOIN `teams` t ON p.team_id = t.team_id
WHERE ps.season = '2024-25'
ORDER BY ps.goals_scored DESC, ps.assists DESC;

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

-- =====================================================
-- Stored Procedures for Common Operations
-- =====================================================

DELIMITER //

-- Procedure to update team statistics after a match
CREATE PROCEDURE `UpdateTeamStatistics`(
    IN p_fixture_id INT
)
BEGIN
    DECLARE v_home_team_id INT;
    DECLARE v_away_team_id INT;
    DECLARE v_home_goals INT;
    DECLARE v_away_goals INT;
    DECLARE v_competition_id INT;
    DECLARE v_season VARCHAR(20);
    
    -- Get match details
    SELECT 
        f.home_team_id, f.away_team_id, f.competition_id,
        COALESCE(mr.home_goals, 0), COALESCE(mr.away_goals, 0),
        c.season
    INTO 
        v_home_team_id, v_away_team_id, v_competition_id,
        v_home_goals, v_away_goals, v_season
    FROM fixtures f
    JOIN competitions c ON f.competition_id = c.competition_id
    LEFT JOIN match_results mr ON f.fixture_id = mr.fixture_id
    WHERE f.fixture_id = p_fixture_id;
    
    -- Update home team statistics
    INSERT INTO team_statistics (team_id, season, competition_id, matches_played, wins, draws, losses, goals_for, goals_against, goal_difference, points)
    VALUES (v_home_team_id, v_season, v_competition_id, 1, 
            CASE WHEN v_home_goals > v_away_goals THEN 1 ELSE 0 END,
            CASE WHEN v_home_goals = v_away_goals THEN 1 ELSE 0 END,
            CASE WHEN v_home_goals < v_away_goals THEN 1 ELSE 0 END,
            v_home_goals, v_away_goals, v_home_goals - v_away_goals,
            CASE WHEN v_home_goals > v_away_goals THEN 3 
                 WHEN v_home_goals = v_away_goals THEN 1 ELSE 0 END)
    ON DUPLICATE KEY UPDATE
        matches_played = matches_played + 1,
        wins = wins + CASE WHEN v_home_goals > v_away_goals THEN 1 ELSE 0 END,
        draws = draws + CASE WHEN v_home_goals = v_away_goals THEN 1 ELSE 0 END,
        losses = losses + CASE WHEN v_home_goals < v_away_goals THEN 1 ELSE 0 END,
        goals_for = goals_for + v_home_goals,
        goals_against = goals_against + v_away_goals,
        goal_difference = goals_for - goals_against,
        points = points + CASE WHEN v_home_goals > v_away_goals THEN 3 
                              WHEN v_home_goals = v_away_goals THEN 1 ELSE 0 END;
    
    -- Update away team statistics
    INSERT INTO team_statistics (team_id, season, competition_id, matches_played, wins, draws, losses, goals_for, goals_against, goal_difference, points)
    VALUES (v_away_team_id, v_season, v_competition_id, 1,
            CASE WHEN v_away_goals > v_home_goals THEN 1 ELSE 0 END,
            CASE WHEN v_away_goals = v_home_goals THEN 1 ELSE 0 END,
            CASE WHEN v_away_goals < v_home_goals THEN 1 ELSE 0 END,
            v_away_goals, v_home_goals, v_away_goals - v_home_goals,
            CASE WHEN v_away_goals > v_home_goals THEN 3 
                 WHEN v_away_goals = v_home_goals THEN 1 ELSE 0 END)
    ON DUPLICATE KEY UPDATE
        matches_played = matches_played + 1,
        wins = wins + CASE WHEN v_away_goals > v_home_goals THEN 1 ELSE 0 END,
        draws = draws + CASE WHEN v_away_goals = v_home_goals THEN 1 ELSE 0 END,
        losses = losses + CASE WHEN v_away_goals < v_home_goals THEN 1 ELSE 0 END,
        goals_for = goals_for + v_away_goals,
        goals_against = goals_against + v_home_goals,
        goal_difference = goals_for - goals_against,
        points = points + CASE WHEN v_away_goals > v_home_goals THEN 3 
                              WHEN v_away_goals = v_home_goals THEN 1 ELSE 0 END;
END //

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- Show all created tables
SHOW TABLES;

-- Verify reference data was inserted
SELECT 'Positions' as table_name, COUNT(*) as record_count FROM positions
UNION ALL
SELECT 'Player Statuses', COUNT(*) FROM player_statuses
UNION ALL
SELECT 'Competitions', COUNT(*) FROM competitions;

-- Show table structure for key tables
DESCRIBE fixtures;
DESCRIBE players;
DESCRIBE teams;

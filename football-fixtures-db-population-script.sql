USE `football_fixtures_db`;

SET FOREIGN_KEY_CHECKS = 0;

INSERT IGNORE INTO `stadiums` (`stadium_name`, `location`, `city`, `country`, `capacity`, `surface_type`) VALUES
('Old Trafford', 'Sir Matt Busby Way', 'Manchester', 'England', 74879, 'Grass'),
('Emirates Stadium', 'Hornsey Road', 'London', 'England', 60704, 'Grass'),
('Anfield', 'Anfield Road', 'Liverpool', 'England', 53394, 'Grass'),
('Stamford Bridge', 'Fulham Road', 'London', 'England', 40834, 'Grass'),
('Etihad Stadium', 'Etihad Campus', 'Manchester', 'England', 55017, 'Grass'),
('Tottenham Hotspur Stadium', 'High Road', 'London', 'England', 62850, 'Hybrid'),
('London Stadium', 'Queen Elizabeth Olympic Park', 'London', 'England', 66000, 'Grass'),
('Goodison Park', 'Goodison Road', 'Liverpool', 'England', 39414, 'Grass'),
('Villa Park', 'Trinity Road', 'Birmingham', 'England', 42749, 'Grass'),
('St. James Park', 'Barrack Road', 'Newcastle', 'England', 52305, 'Grass'),
('Elland Road', 'Elland Road', 'Leeds', 'England', 37890, 'Grass'),
('Bramall Lane', 'Bramall Lane', 'Sheffield', 'England', 32050, 'Grass'),
('Carrow Road', 'Carrow Road', 'Norwich', 'England', 27244, 'Grass'),
('The Hawthorns', 'Halfords Lane', 'West Bromwich', 'England', 26850, 'Grass'),
('Craven Cottage', 'Stevenage Road', 'London', 'England', 19359, 'Grass');

INSERT IGNORE INTO `coaches` (`first_name`, `last_name`, `nationality`, `date_of_birth`, `license_level`) VALUES
('Erik', 'ten Hag', 'Netherlands', '1970-02-02', 'UEFA Pro'),
('Mikel', 'Arteta', 'Spain', '1982-03-26', 'UEFA Pro'),
('Jurgen', 'Klopp', 'Germany', '1967-06-16', 'UEFA Pro'),
('Mauricio', 'Pochettino', 'Argentina', '1972-03-02', 'UEFA Pro'),
('Pep', 'Guardiola', 'Spain', '1971-01-18', 'UEFA Pro'),
('Antonio', 'Conte', 'Italy', '1969-07-31', 'UEFA Pro'),
('David', 'Moyes', 'Scotland', '1963-04-25', 'UEFA Pro'),
('Sean', 'Dyche', 'England', '1971-06-28', 'UEFA Pro'),
('Unai', 'Emery', 'Spain', '1971-11-03', 'UEFA Pro'),
('Eddie', 'Howe', 'England', '1977-11-29', 'UEFA Pro'),
('Jesse', 'Marsch', 'United States', '1973-11-08', 'UEFA A'),
('Chris', 'Wilder', 'England', '1967-09-23', 'UEFA Pro'),
('Daniel', 'Farke', 'Germany', '1976-10-30', 'UEFA Pro'),
('Steve', 'Bruce', 'England', '1960-12-31', 'UEFA Pro'),
('Marco', 'Silva', 'Portugal', '1977-07-12', 'UEFA Pro');

INSERT IGNORE INTO `teams` (`team_name`, `short_name`, `founded_year`, `coach_id`, `home_stadium_id`, `primary_color`, `secondary_color`) VALUES
('Manchester United', 'MUN', NULL, 1, 1, 'Red', 'White'),
('Arsenal', 'ARS', NULL, 2, 2, 'Red', 'White'),
('Liverpool', 'LIV', NULL, 3, 3, 'Red', 'White'),
('Chelsea', 'CHE', 1905, 4, 4, 'Blue', 'White'),
('Manchester City', 'MCI', NULL, 5, 5, 'Sky Blue', 'White'),
('Tottenham Hotspur', 'TOT', NULL, 6, 6, 'White', 'Navy Blue'),
('West Ham United', 'WHU', NULL, 7, 7, 'Claret', 'Blue'),
('Everton', 'EVE', NULL, 8, 8, 'Blue', 'White'),
('Aston Villa', 'AVL', NULL, 9, 9, 'Claret', 'Blue'),
('Newcastle United', 'NEW', NULL, 10, 10, 'Black', 'White'),
('Leeds United', 'LEE', 1919, 11, 11, 'White', 'Blue'),
('Sheffield United', 'SHU', NULL, 12, 12, 'Red', 'White'),
('Norwich City', 'NOR', 1902, 13, 13, 'Yellow', 'Green'),
('West Bromwich Albion', 'WBA', NULL, 14, 14, 'Navy Blue', 'White'),
('Fulham', 'FUL', NULL, 15, 15, 'White', 'Black');


INSERT IGNORE INTO `referees` (`first_name`, `last_name`, `nationality`, `fifa_badge`) VALUES
('Michael', 'Oliver', 'England', TRUE),
('Anthony', 'Taylor', 'England', TRUE),
('Paul', 'Tierney', 'England', TRUE),
('Craig', 'Pawson', 'England', TRUE),
('Stuart', 'Attwell', 'England', TRUE),
('Simon', 'Hooper', 'England', FALSE),
('David', 'Coote', 'England', FALSE),
('Jarred', 'Gillett', 'Australia', TRUE),
('Andre', 'Marriner', 'England', TRUE),
('Chris', 'Kavanagh', 'England', FALSE),
('Robert', 'Jones', 'England', FALSE),
('Peter', 'Bankes', 'England', FALSE),
('Graham', 'Scott', 'England', FALSE),
('Darren', 'England', 'England', FALSE),
('John', 'Brooks', 'England', FALSE);

-- Manchester United Players
INSERT IGNORE INTO `players` (`first_name`, `last_name`, `date_of_birth`, `nationality`, `squad_number`, `team_id`, `position_id`, `status_id`, `height_cm`, `weight_kg`, `preferred_foot`) VALUES
('David', 'De Gea', '1990-11-07', 'Spain', 1, 1, 1, 1, 192, 82, 'Right'),
('Harry', 'Maguire', '1993-03-05', 'England', 5, 1, 2, 1, 194, 100, 'Right'),
('Luke', 'Shaw', '1995-07-12', 'England', 23, 1, 3, 1, 185, 75, 'Left'),
('Aaron', 'Wan-Bissaka', '1997-11-26', 'England', 29, 1, 4, 1, 183, 69, 'Right'),
('Casemiro', 'Silva', '1992-02-23', 'Brazil', 18, 1, 6, 1, 185, 84, 'Right'),
('Bruno', 'Fernandes', '1994-09-08', 'Portugal', 8, 1, 8, 1, 179, 69, 'Right'),
('Marcus', 'Rashford', '1997-10-31', 'England', 10, 1, 11, 1, 180, 70, 'Right'),
('Jadon', 'Sancho', '2000-03-25', 'England', 25, 1, 12, 1, 180, 76, 'Right'),
('Anthony', 'Martial', '1995-12-05', 'France', 9, 1, 14, 1, 181, 76, 'Right'),
('Raphael', 'Varane', '1993-04-25', 'France', 19, 1, 2, 1, 191, 81, 'Right'),
('Christian', 'Eriksen', '1992-02-14', 'Denmark', 14, 1, 7, 1, 182, 76, 'Right');

-- Arsenal Players
INSERT IGNORE INTO `players` (`first_name`, `last_name`, `date_of_birth`, `nationality`, `squad_number`, `team_id`, `position_id`, `status_id`, `height_cm`, `weight_kg`, `preferred_foot`) VALUES
('Aaron', 'Ramsdale', '1998-05-14', 'England', 1, 2, 1, 1, 188, 82, 'Right'),
('William', 'Saliba', '2001-03-24', 'France', 12, 2, 2, 1, 192, 83, 'Right'),
('Kieran', 'Tierney', '1997-06-05', 'Scotland', 3, 2, 3, 1, 178, 69, 'Left'),
('Ben', 'White', '1997-10-08', 'England', 4, 2, 4, 1, 186, 73, 'Right'),
('Thomas', 'Partey', '1993-06-13', 'Ghana', 5, 2, 6, 1, 185, 77, 'Right'),
('Martin', 'Odegaard', '1998-12-17', 'Norway', 8, 2, 8, 1, 178, 68, 'Right'),
('Gabriel', 'Martinelli', '2001-06-18', 'Brazil', 11, 2, 11, 1, 175, 70, 'Left'),
('Bukayo', 'Saka', '2001-09-05', 'England', 7, 2, 12, 1, 178, 70, 'Left'),
('Gabriel', 'Jesus', '1997-04-03', 'Brazil', 9, 2, 14, 1, 175, 73, 'Right'),
('Granit', 'Xhaka', '1992-09-27', 'Switzerland', 34, 2, 7, 1, 185, 82, 'Left'),
('Eddie', 'Nketiah', '1999-05-30', 'England', 14, 2, 14, 1, 175, 68, 'Right');

-- Liverpool Players
INSERT IGNORE INTO `players` (`first_name`, `last_name`, `date_of_birth`, `nationality`, `squad_number`, `team_id`, `position_id`, `status_id`, `height_cm`, `weight_kg`, `preferred_foot`) VALUES
('Alisson', 'Becker', '1993-10-02', 'Brazil', 1, 3, 1, 1, 191, 91, 'Right'),
('Virgil', 'van Dijk', '1991-07-08', 'Netherlands', 4, 3, 2, 1, 195, 92, 'Right'),
('Andrew', 'Robertson', '1994-03-11', 'Scotland', 26, 3, 3, 1, 178, 64, 'Left'),
('Trent', 'Alexander-Arnold', '1998-10-07', 'England', 66, 3, 4, 1, 180, 69, 'Right'),
('Fabinho', 'Tavares', '1993-10-23', 'Brazil', 3, 3, 6, 1, 188, 78, 'Right'),
('Jordan', 'Henderson', '1990-06-17', 'England', 14, 3, 7, 1, 182, 67, 'Right'),
('Sadio', 'Mane', '1992-04-10', 'Senegal', 10, 3, 11, 1, 175, 69, 'Right'),
('Mohamed', 'Salah', '1992-06-15', 'Egypt', 11, 3, 12, 1, 175, 71, 'Left'),
('Roberto', 'Firmino', '1991-10-02', 'Brazil', 9, 3, 13, 1, 181, 76, 'Right'),
('Thiago', 'Alcantara', '1991-04-11', 'Spain', 6, 3, 7, 1, 174, 70, 'Right'),
('Diogo', 'Jota', '1996-12-04', 'Portugal', 20, 3, 14, 1, 178, 73, 'Right');

-- Add more players for other teams
INSERT IGNORE INTO `players` (`first_name`, `last_name`, `date_of_birth`, `nationality`, `squad_number`, `team_id`, `position_id`, `status_id`, `height_cm`, `weight_kg`, `preferred_foot`) VALUES
-- Chelsea
('Kepa', 'Arrizabalaga', '1994-10-03', 'Spain', 1, 4, 1, 1, 186, 80, 'Right'),
('Thiago', 'Silva', '1984-09-22', 'Brazil', 6, 4, 2, 1, 183, 79, 'Right'),
('Reece', 'James', '1999-12-08', 'England', 24, 4, 4, 1, 182, 85, 'Right'),
('N\'Golo', 'Kante', '1991-03-29', 'France', 7, 4, 6, 1, 168, 70, 'Right'),
('Mason', 'Mount', '1999-01-10', 'England', 19, 4, 8, 1, 181, 70, 'Right'),
-- Manchester City
('Ederson', 'Moraes', '1993-08-17', 'Brazil', 31, 5, 1, 1, 188, 86, 'Left'),
('Ruben', 'Dias', '1997-05-14', 'Portugal', 3, 5, 2, 1, 187, 82, 'Right'),
('Joao', 'Cancelo', '1994-05-27', 'Portugal', 7, 5, 4, 1, 182, 74, 'Right'),
('Kevin', 'De Bruyne', '1991-06-28', 'Belgium', 17, 5, 8, 1, 181, 70, 'Right'),
('Erling', 'Haaland', '2000-07-21', 'Norway', 9, 5, 14, 1, 194, 88, 'Left');


INSERT IGNORE INTO `fixtures` (`match_date`, `kick_off_time`, `home_team_id`, `away_team_id`, `competition_id`, `stadium_id`, `referee_id`, `match_week`, `status`) VALUES
-- Premier League Fixtures
('2024-08-17', '15:00:00', 1, 2, 1, 1, 1, 1, 'Finished'),
('2024-08-17', '17:30:00', 3, 4, 1, 3, 2, 1, 'Finished'),
('2024-08-18', '14:00:00', 5, 6, 1, 5, 3, 1, 'Finished'),
('2024-08-18', '16:30:00', 7, 8, 1, 7, 4, 1, 'Finished'),
('2024-08-24', '15:00:00', 2, 3, 1, 2, 5, 2, 'Finished'),
('2024-08-24', '17:30:00', 4, 5, 1, 4, 6, 2, 'Finished'),
('2024-08-25', '14:00:00', 6, 7, 1, 6, 7, 2, 'Finished'),
('2024-08-25', '16:30:00', 8, 1, 1, 8, 8, 2, 'Finished'),
('2024-08-31', '15:00:00', 1, 3, 1, 1, 9, 3, 'Finished'),
('2024-08-31', '17:30:00', 5, 2, 1, 5, 10, 3, 'Finished'),
-- Upcoming fixtures
('2024-12-21', '15:00:00', 2, 4, 1, 2, 1, 18, 'Scheduled'),
('2024-12-21', '17:30:00', 3, 5, 1, 3, 2, 18, 'Scheduled'),
('2024-12-22', '14:00:00', 6, 1, 1, 6, 3, 18, 'Scheduled'),
('2024-12-26', '12:30:00', 1, 7, 1, 1, 4, 19, 'Scheduled'),
('2024-12-26', '15:00:00', 4, 8, 1, 4, 5, 19, 'Scheduled'),
-- FA Cup fixtures
('2024-01-06', '15:00:00', 11, 12, 3, 11, 11, 3, 'Scheduled'),
('2024-01-07', '14:00:00', 13, 14, 3, 13, 12, 3, 'Scheduled'),
-- Champions League fixtures
('2024-09-19', '20:00:00', 1, 2, 4, 1, 1, 1, 'Scheduled'),
('2024-10-03', '20:00:00', 3, 4, 4, 3, 2, 2, 'Scheduled');

INSERT IGNORE INTO `match_results` (`fixture_id`, `home_goals`, `away_goals`, `home_goals_ht`, `away_goals_ht`, `winner_team_id`, `result_type`) VALUES
(1, 2, 1, 1, 0, 1, 'Regular'),
(2, 1, 1, 0, 1, NULL, 'Regular'),
(3, 3, 0, 2, 0, 5, 'Regular'),
(4, 0, 2, 0, 1, 8, 'Regular'),
(5, 2, 3, 1, 2, 3, 'Regular'),
(6, 1, 0, 0, 0, 4, 'Regular'),
(7, 2, 2, 1, 1, NULL, 'Regular'),
(8, 1, 3, 0, 1, 1, 'Regular'),
(9, 4, 1, 2, 0, 1, 'Regular'),
(10, 0, 1, 0, 0, 2, 'Regular');


INSERT IGNORE INTO `goals` (`fixture_id`, `player_id`, `team_id`, `minute`, `added_time`, `goal_type`, `is_own_goal`, `body_part`) VALUES
-- Match 1: Man United 2-1 Arsenal
(1, 7, 1, 23, 0, 'Regular', FALSE, 'Right Foot'),
(1, 9, 1, 67, 2, 'Regular', FALSE, 'Left Foot'),
(1, 17, 2, 45, 1, 'Regular', FALSE, 'Right Foot'),
-- Match 2: Liverpool 1-1 Chelsea
(2, 26, 3, 34, 0, 'Regular', FALSE, 'Left Foot'),
(2, 25, 4, 78, 0, 'Regular', FALSE, 'Right Foot'),
-- Match 3: Man City 3-0 Tottenham
(3, 30, 5, 15, 0, 'Regular', FALSE, 'Left Foot'),
(3, 30, 5, 33, 0, 'Regular', FALSE, 'Right Foot'),
(3, 29, 5, 89, 3, 'Regular', FALSE, 'Right Foot'),
-- Match 4: West Ham 0-2 Everton
(4, 8, 8, 56, 0, 'Regular', FALSE, 'Right Foot'),
(4, 8, 8, 82, 0, 'Regular', FALSE, 'Left Foot'),
-- Match 5: Arsenal 2-3 Liverpool
(5, 17, 2, 12, 0, 'Regular', FALSE, 'Right Foot'),
(5, 19, 2, 67, 0, 'Regular', FALSE, 'Right Foot'),
(5, 26, 3, 23, 0, 'Regular', FALSE, 'Left Foot'),
(5, 28, 3, 45, 2, 'Regular', FALSE, 'Right Foot'),
(5, 31, 3, 90, 4, 'Regular', FALSE, 'Right Foot');


INSERT IGNORE INTO `assists` (`goal_id`, `player_id`, `assist_type`) VALUES
(1, 6, 'Pass'),
(2, 11, 'Cross'),
(3, 18, 'Through Ball'),
(4, 22, 'Pass'),
(5, 23, 'Cross'),
(6, 29, 'Pass'),
(7, 29, 'Through Ball'),
(8, 28, 'Cross'),
(9, 18, 'Pass'),
(10, 26, 'Through Ball');

INSERT IGNORE INTO `cards` (`fixture_id`, `player_id`, `team_id`, `card_type`, `minute`, `added_time`, `reason`) VALUES
(1, 3, 1, 'Yellow', 34, 0, 'Unsporting behavior'),
(1, 13, 2, 'Yellow', 67, 0, 'Dissent'),
(2, 24, 3, 'Yellow', 23, 0, 'Reckless challenge'),
(2, 22, 4, 'Red', 85, 2, 'Serious foul play'),
(3, 27, 6, 'Yellow', 45, 1, 'Delaying the game'),
(4, 8, 8, 'Yellow', 78, 0, 'Unsporting behavior'),
(5, 15, 2, 'Yellow', 56, 0, 'Reckless challenge'),
(5, 25, 3, 'Yellow', 89, 3, 'Time wasting');

INSERT IGNORE INTO `match_events` (`fixture_id`, `player_id`, `team_id`, `event_type`, `minute`, `added_time`, `description`) VALUES
(1, 7, 1, 'Substitution', 75, 0, 'Marcus Rashford substituted'),
(1, 17, 2, 'Injury', 89, 2, 'Gabriel Martinelli injured'),
(2, 26, 3, 'VAR Check', 34, 0, 'Goal confirmed after VAR check'),
(3, 30, 5, 'Corner', 15, 0, 'Corner kick leading to goal'),
(4, 8, 8, 'Penalty', 56, 0, 'Penalty awarded and scored'),
(5, 31, 3, 'Offside', 67, 0, 'Goal disallowed for offside');

INSERT IGNORE INTO `player_statistics` (`player_id`, `season`, `competition_id`, `matches_played`, `matches_started`, `minutes_played`, `goals_scored`, `assists`, `yellow_cards`, `red_cards`, `pass_accuracy`) VALUES
-- Manchester United players
(7, '2024-25', 1, 8, 7, 630, 5, 2, 1, 0, 78.5),
(9, '2024-25', 1, 6, 4, 420, 3, 1, 0, 0, 82.1),
(6, '2024-25', 1, 8, 8, 720, 1, 4, 2, 0, 89.3),
-- Arsenal players
(17, '2024-25', 1, 7, 6, 540, 4, 1, 1, 0, 76.8),
(18, '2024-25', 1, 8, 8, 720, 2, 6, 0, 0, 91.2),
(19, '2024-25', 1, 8, 8, 720, 6, 3, 0, 0, 85.7),
-- Liverpool players
(26, '2024-25', 1, 8, 8, 720, 7, 4, 1, 0, 88.9),
(28, '2024-25', 1, 8, 8, 720, 8, 2, 0, 0, 87.3),
(31, '2024-25', 1, 6, 5, 450, 3, 2, 0, 0, 83.4);


INSERT IGNORE INTO `team_statistics` (`team_id`, `season`, `competition_id`, `matches_played`, `wins`, `draws`, `losses`, `goals_for`, `goals_against`, `goal_difference`, `points`) VALUES
(1, '2024-25', 1, 10, 6, 2, 2, 18, 12, 6, 20),
(2, '2024-25', 1, 10, 5, 3, 2, 16, 13, 3, 18),
(3, '2024-25', 1, 10, 7, 1, 2, 22, 10, 12, 22),
(4, '2024-25', 1, 10, 4, 4, 2, 14, 11, 3, 16),
(5, '2024-25', 1, 10, 8, 1, 1, 25, 8, 17, 25),
(6, '2024-25', 1, 10, 3, 3, 4, 12, 16, -4, 12),
(7, '2024-25', 1, 10, 4, 2, 4, 13, 15, -2, 14),
(8, '2024-25', 1, 10, 5, 2, 3, 15, 14, 1, 17);

INSERT IGNORE INTO `player_fixture_stats` (`player_id`, `fixture_id`, `minutes_played`, `goals_scored`, `assists`, `yellow_cards`, `red_cards`, `shots_on_target`, `shots_off_target`, `passes_completed`, `passes_attempted`, `rating`) VALUES
(7, 1, 90, 1, 0, 0, 0, 3, 2, 28, 35, 7.8),
(9, 1, 75, 1, 1, 0, 0, 2, 1, 22, 28, 8.2),
(17, 1, 90, 1, 0, 0, 0, 4, 1, 31, 38, 7.5),
(26, 2, 90, 1, 0, 1, 0, 2, 3, 45, 52, 7.3),
(30, 3, 90, 2, 0, 0, 0, 5, 2, 38, 42, 9.1),
(8, 4, 90, 2, 0, 1, 0, 3, 1, 25, 31, 8.7);

INSERT IGNORE INTO `player_contracts` (`player_id`, `team_id`, `start_date`, `end_date`, `weekly_salary`, `signing_bonus`, `contract_type`, `is_active`) VALUES
(7, 1, '2022-07-01', '2027-06-30', 250000.00, 5000000.00, 'Professional', TRUE),
(9, 1, '2019-07-01', '2025-06-30', 200000.00, 0.00, 'Professional', TRUE),
(17, 2, '2021-07-01', '2026-06-30', 180000.00, 2000000.00, 'Professional', TRUE),
(19, 2, '2019-07-01', '2025-06-30', 220000.00, 0.00, 'Professional', TRUE),
(26, 3, '2017-07-01', '2025-06-30', 300000.00, 0.00, 'Professional', TRUE),
(28, 3, '2017-07-01', '2025-06-30', 350000.00, 0.00, 'Professional', TRUE),
(30, 5, '2022-07-01', '2029-06-30', 400000.00, 15000000.00, 'Professional', TRUE);

INSERT IGNORE INTO `medical_records` (`player_id`, `injury_type`, `injury_description`, `injury_date`, `expected_return_date`, `severity`, `treatment_notes`, `medical_staff`, `is_active`) VALUES
(3, 'Hamstring Strain', 'Grade 1 hamstring strain during training', '2024-08-15', '2024-09-01', 'Minor', 'Rest and physiotherapy', 'Dr. Smith', FALSE),
(13, 'Ankle Sprain', 'Twisted ankle during match', '2024-08-20', '2024-09-10', 'Moderate', 'Ice, compression, elevation', 'Dr. Johnson', FALSE),
(22, 'Knee Injury', 'Meniscus tear', '2024-08-25', '2024-11-15', 'Severe', 'Arthroscopic surgery required', 'Dr. Williams', TRUE),
(15, 'Muscle Fatigue', 'General muscle fatigue', '2024-09-01', '2024-09-05', 'Minor', 'Rest and recovery', 'Dr. Brown', FALSE);

INSERT IGNORE INTO `team_staff` (`team_id`, `first_name`, `last_name`, `role`, `department`, `hire_date`, `salary`, `is_active`) VALUES
-- Manchester United staff
(1, 'Mitchell', 'van der Gaag', 'Assistant Coach', 'Coaching', '2022-07-01', 150000.00, TRUE),
(1, 'Gary', 'Walker', 'Fitness Coach', 'Coaching', '2020-01-15', 80000.00, TRUE),
(1, 'Dr. Steve', 'McNally', 'Team Doctor', 'Medical', '2018-06-01', 120000.00, TRUE),
-- Arsenal staff
(2, 'Albert', 'Stuivenberg', 'Assistant Coach', 'Coaching', '2019-12-20', 140000.00, TRUE),
(2, 'Andreas', 'Georgson', 'Goalkeeping Coach', 'Coaching', '2021-07-01', 90000.00, TRUE),
(2, 'Dr. Gary', 'O\'Driscoll', 'Head of Medical', 'Medical', '2009-05-01', 130000.00, TRUE),
-- Liverpool staff
(3, 'Pepijn', 'Lijnders', 'Assistant Coach', 'Coaching', '2018-01-01', 160000.00, TRUE),
(3, 'John', 'Achterberg', 'Goalkeeping Coach', 'Coaching', '2009-07-01', 95000.00, TRUE),
(3, 'Dr. Jim', 'Moxon', 'Team Doctor', 'Medical', '2013-08-01', 125000.00, TRUE);

SET FOREIGN_KEY_CHECKS = 1;

-- Check record counts for all populated tables
SELECT 'stadiums' as table_name, COUNT(*) as record_count FROM stadiums
UNION ALL SELECT 'coaches', COUNT(*) FROM coaches
UNION ALL SELECT 'teams', COUNT(*) FROM teams
UNION ALL SELECT 'referees', COUNT(*) FROM referees
UNION ALL SELECT 'players', COUNT(*) FROM players
UNION ALL SELECT 'fixtures', COUNT(*) FROM fixtures
UNION ALL SELECT 'match_results', COUNT(*) FROM match_results
UNION ALL SELECT 'goals', COUNT(*) FROM goals
UNION ALL SELECT 'assists', COUNT(*) FROM assists
UNION ALL SELECT 'cards', COUNT(*) FROM cards
UNION ALL SELECT 'match_events', COUNT(*) FROM match_events
UNION ALL SELECT 'player_statistics', COUNT(*) FROM player_statistics
UNION ALL SELECT 'team_statistics', COUNT(*) FROM team_statistics
UNION ALL SELECT 'player_fixture_stats', COUNT(*) FROM player_fixture_stats
UNION ALL SELECT 'player_contracts', COUNT(*) FROM player_contracts
UNION ALL SELECT 'medical_records', COUNT(*) FROM medical_records
UNION ALL SELECT 'team_staff', COUNT(*) FROM team_staff;

-- Testing Key Relationships
SELECT 
    t.team_name,
    CONCAT(c.first_name, ' ', c.last_name) as coach_name,
    s.stadium_name,
    COUNT(p.player_id) as player_count
FROM teams t
LEFT JOIN coaches c ON t.coach_id = c.coach_id
LEFT JOIN stadiums s ON t.home_stadium_id = s.stadium_id
LEFT JOIN players p ON t.team_id = p.team_id
GROUP BY t.team_id, t.team_name, c.first_name, c.last_name, s.stadium_name
ORDER BY t.team_name;

SELECT 'Data population completed successfully!' as status;

COMMIT;

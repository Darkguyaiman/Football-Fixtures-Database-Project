USE `football_fixtures_db`;

SET FOREIGN_KEY_CHECKS = 0;

-- Insert Stadiums data
INSERT INTO `stadiums` (`stadium_name`, `location`, `city`, `country`, `capacity`, `surface_type`) VALUES
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
('Craven Cottage', 'Stevenage Road', 'London', 'England', 19359, 'Grass'),
('Molineux Stadium', 'Waterloo Road', 'Wolverhampton', 'England', 31700, 'Grass'),
('Amex Stadium', 'Village Way', 'Brighton', 'England', 30750, 'Grass'),
('Vicarage Road', 'Vicarage Road', 'Watford', 'England', 22220, 'Grass'),
('Turf Moor', 'Harry Potts Way', 'Burnley', 'England', 21944, 'Grass'),
('Selhurst Park', 'Holmesdale Road', 'London', 'England', 25486, 'Grass');

-- Insert Coaches data
INSERT INTO `coaches` (`first_name`, `last_name`, `nationality`, `date_of_birth`, `license_level`) VALUES
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
('Marco', 'Silva', 'Portugal', '1977-07-12', 'UEFA Pro'),
('Gary', 'O\'Neil', 'England', '1983-05-18', 'UEFA Pro'),
('Roberto', 'De Zerbi', 'Italy', '1979-06-06', 'UEFA Pro'),
('Rob', 'Edwards', 'Wales', '1982-12-25', 'UEFA A'),
('Vincent', 'Kompany', 'Belgium', '1986-04-10', 'UEFA Pro'),
('Oliver', 'Glasner', 'Austria', '1974-08-28', 'UEFA Pro');

-- Insert Teams data
INSERT INTO `teams` (`team_name`, `short_name`, `founded_year`, `coach_id`, `home_stadium_id`, `primary_color`, `secondary_color`) VALUES
('Manchester United', 'MUN', 1878, 1, 1, 'Red', 'White'),
('Arsenal', 'ARS', 1886, 2, 2, 'Red', 'White'),
('Liverpool', 'LIV', 1892, 3, 3, 'Red', 'White'),
('Chelsea', 'CHE', 1905, 4, 4, 'Blue', 'White'),
('Manchester City', 'MCI', 1880, 5, 5, 'Sky Blue', 'White'),
('Tottenham Hotspur', 'TOT', 1882, 6, 6, 'White', 'Navy Blue'),
('West Ham United', 'WHU', 1895, 7, 7, 'Claret', 'Blue'),
('Everton', 'EVE', 1878, 8, 8, 'Blue', 'White'),
('Aston Villa', 'AVL', 1874, 9, 9, 'Claret', 'Blue'),
('Newcastle United', 'NEW', 1892, 10, 10, 'Black', 'White'),
('Leeds United', 'LEE', 1919, 11, 11, 'White', 'Blue'),
('Sheffield United', 'SHU', 1889, 12, 12, 'Red', 'White'),
('Norwich City', 'NOR', 1902, 13, 13, 'Yellow', 'Green'),
('West Bromwich Albion', 'WBA', 1878, 14, 14, 'Navy Blue', 'White'),
('Fulham', 'FUL', 1879, 15, 15, 'White', 'Black'),
('Wolverhampton Wanderers', 'WOL', 1877, 16, 16, 'Gold', 'Black'),
('Brighton & Hove Albion', 'BHA', 1901, 17, 17, 'Blue', 'White'),
('Watford', 'WAT', 1881, 18, 18, 'Yellow', 'Red'),
('Burnley', 'BUR', 1882, 19, 19, 'Claret', 'Blue'),
('Crystal Palace', 'CRY', 1905, 20, 20, 'Blue', 'Red');

-- Insert Referees data
INSERT INTO `referees` (`first_name`, `last_name`, `nationality`, `fifa_badge`) VALUES
('Michael', 'Oliver', 'England', TRUE),
('Anthony', 'Taylor', 'England', TRUE),
('Paul', 'Tierney', 'England', TRUE),
('Craig', 'Pawson', 'England', TRUE),
('Stuart', 'Attwell', 'England', TRUE),
('Simon', 'Hooper', 'England', TRUE),
('David', 'Coote', 'England', TRUE),
('Jarred', 'Gillett', 'Australia', TRUE),
('Andre', 'Marriner', 'England', TRUE),
('Chris', 'Kavanagh', 'England', TRUE),
('Robert', 'Jones', 'England', TRUE),
('Peter', 'Bankes', 'England', TRUE),
('Graham', 'Scott', 'England', TRUE),
('Darren', 'England', 'England', TRUE),
('John', 'Brooks', 'England', TRUE),
('Tim', 'Robinson', 'England', FALSE),
('Andy', 'Madley', 'England', FALSE),
('Darren', 'Bond', 'England', FALSE),
('Keith', 'Stroud', 'England', FALSE),
('Tony', 'Harrington', 'England', FALSE);

-- Insert Players data
-- Manchester United Players
INSERT INTO `players` (`first_name`, `last_name`, `date_of_birth`, `nationality`, `squad_number`, `team_id`, `position_id`, `status_id`, `height_cm`, `weight_kg`, `preferred_foot`) VALUES
('Andre', 'Onana', '1996-04-02', 'Cameroon', 24, 1, 1, 1, 190, 88, 'Right'),
('Harry', 'Maguire', '1993-03-05', 'England', 5, 1, 2, 1, 194, 100, 'Right'),
('Luke', 'Shaw', '1995-07-12', 'England', 23, 1, 3, 1, 185, 75, 'Left'),
('Diogo', 'Dalot', '1999-03-18', 'Portugal', 20, 1, 4, 1, 183, 73, 'Right'),
('Casemiro', 'Santos', '1992-02-23', 'Brazil', 18, 1, 6, 1, 185, 84, 'Right'),
('Bruno', 'Fernandes', '1994-09-08', 'Portugal', 8, 1, 8, 1, 179, 69, 'Right'),
('Marcus', 'Rashford', '1997-10-31', 'England', 10, 1, 11, 1, 180, 70, 'Right'),
('Antony', 'Santos', '2000-02-24', 'Brazil', 21, 1, 12, 1, 172, 62, 'Left'),
('Rasmus', 'Hojlund', '2003-02-04', 'Denmark', 11, 1, 14, 1, 191, 87, 'Left'),
('Raphael', 'Varane', '1993-04-25', 'France', 19, 1, 2, 1, 191, 81, 'Right'),
('Christian', 'Eriksen', '1992-02-14', 'Denmark', 14, 1, 7, 1, 182, 76, 'Right');

-- Arsenal Players
INSERT INTO `players` (`first_name`, `last_name`, `date_of_birth`, `nationality`, `squad_number`, `team_id`, `position_id`, `status_id`, `height_cm`, `weight_kg`, `preferred_foot`) VALUES
('David', 'Raya', '1995-09-15', 'Spain', 22, 2, 1, 1, 183, 74, 'Right'),
('William', 'Saliba', '2001-03-24', 'France', 2, 2, 2, 1, 192, 83, 'Right'),
('Oleksandr', 'Zinchenko', '1996-12-15', 'Ukraine', 35, 2, 3, 1, 175, 64, 'Left'),
('Ben', 'White', '1997-10-08', 'England', 4, 2, 4, 1, 186, 73, 'Right'),
('Declan', 'Rice', '1999-01-14', 'England', 41, 2, 6, 1, 185, 72, 'Right'),
('Martin', 'Odegaard', '1998-12-17', 'Norway', 8, 2, 8, 1, 178, 68, 'Right'),
('Gabriel', 'Martinelli', '2001-06-18', 'Brazil', 11, 2, 11, 1, 175, 70, 'Left'),
('Bukayo', 'Saka', '2001-09-05', 'England', 7, 2, 12, 1, 178, 70, 'Left'),
('Gabriel', 'Jesus', '1997-04-03', 'Brazil', 9, 2, 14, 1, 175, 73, 'Right'),
('Gabriel', 'Magalhaes', '1997-12-19', 'Brazil', 6, 2, 2, 1, 190, 84, 'Left'),
('Kai', 'Havertz', '1999-06-11', 'Germany', 29, 2, 13, 1, 190, 82, 'Left');

-- Liverpool Players
INSERT INTO `players` (`first_name`, `last_name`, `date_of_birth`, `nationality`, `squad_number`, `team_id`, `position_id`, `status_id`, `height_cm`, `weight_kg`, `preferred_foot`) VALUES
('Alisson', 'Becker', '1993-10-02', 'Brazil', 1, 3, 1, 1, 191, 91, 'Right'),
('Virgil', 'van Dijk', '1991-07-08', 'Netherlands', 4, 3, 2, 1, 195, 92, 'Right'),
('Andrew', 'Robertson', '1994-03-11', 'Scotland', 26, 3, 3, 1, 178, 64, 'Left'),
('Trent', 'Alexander-Arnold', '1998-10-07', 'England', 66, 3, 4, 1, 180, 69, 'Right'),
('Alexis', 'Mac Allister', '1998-12-24', 'Argentina', 10, 3, 6, 1, 174, 67, 'Right'),
('Dominik', 'Szoboszlai', '2000-10-25', 'Hungary', 8, 3, 7, 1, 186, 74, 'Right'),
('Luis', 'Diaz', '1997-01-13', 'Colombia', 7, 3, 11, 1, 178, 67, 'Right'),
('Mohamed', 'Salah', '1992-06-15', 'Egypt', 11, 3, 12, 1, 175, 71, 'Left'),
('Darwin', 'Nunez', '1999-06-24', 'Uruguay', 9, 3, 14, 1, 187, 81, 'Right'),
('Ibrahima', 'Konate', '1999-05-25', 'France', 5, 3, 2, 1, 194, 95, 'Right'),
('Ryan', 'Gravenberch', '2002-05-16', 'Netherlands', 38, 3, 7, 1, 190, 78, 'Right');

-- Chelsea Players
INSERT INTO `players` (`first_name`, `last_name`, `date_of_birth`, `nationality`, `squad_number`, `team_id`, `position_id`, `status_id`, `height_cm`, `weight_kg`, `preferred_foot`) VALUES
('Robert', 'Sanchez', '1997-11-18', 'Spain', 1, 4, 1, 1, 197, 85, 'Right'),
('Thiago', 'Silva', '1984-09-22', 'Brazil', 6, 4, 2, 1, 183, 79, 'Right'),
('Ben', 'Chilwell', '1996-12-21', 'England', 21, 4, 3, 1, 178, 77, 'Left'),
('Reece', 'James', '1999-12-08', 'England', 24, 4, 4, 1, 182, 85, 'Right'),
('Enzo', 'Fernandez', '2001-01-17', 'Argentina', 5, 4, 6, 1, 178, 72, 'Right'),
('Conor', 'Gallagher', '2000-02-06', 'England', 23, 4, 8, 1, 182, 68, 'Right'),
('Raheem', 'Sterling', '1994-12-08', 'England', 17, 4, 11, 1, 170, 69, 'Right'),
('Noni', 'Madueke', '2002-03-10', 'England', 31, 4, 12, 1, 174, 73, 'Right'),
('Nicolas', 'Jackson', '2001-06-20', 'Senegal', 15, 4, 14, 1, 185, 75, 'Right'),
('Levi', 'Colwill', '2003-02-26', 'England', 26, 4, 2, 1, 187, 75, 'Left'),
('Moises', 'Caicedo', '2001-11-02', 'Ecuador', 25, 4, 6, 1, 176, 68, 'Right');

-- Manchester City Players
INSERT INTO `players` (`first_name`, `last_name`, `date_of_birth`, `nationality`, `squad_number`, `team_id`, `position_id`, `status_id`, `height_cm`, `weight_kg`, `preferred_foot`) VALUES
('Ederson', 'Moraes', '1993-08-17', 'Brazil', 31, 5, 1, 1, 188, 86, 'Left'),
('Ruben', 'Dias', '1997-05-14', 'Portugal', 3, 5, 2, 1, 187, 82, 'Right'),
('Josko', 'Gvardiol', '2002-01-23', 'Croatia', 24, 5, 3, 1, 185, 80, 'Left'),
('Kyle', 'Walker', '1990-05-28', 'England', 2, 5, 4, 1, 178, 70, 'Right'),
('Rodri', 'Hernandez', '1996-06-22', 'Spain', 16, 5, 6, 1, 191, 82, 'Right'),
('Kevin', 'De Bruyne', '1991-06-28', 'Belgium', 17, 5, 8, 1, 181, 70, 'Right'),
('Jack', 'Grealish', '1995-09-10', 'England', 10, 5, 11, 1, 180, 76, 'Right'),
('Riyad', 'Mahrez', '1991-02-21', 'Algeria', 26, 5, 12, 1, 179, 67, 'Left'),
('Erling', 'Haaland', '2000-07-21', 'Norway', 9, 5, 14, 1, 194, 88, 'Left'),
('John', 'Stones', '1994-05-28', 'England', 5, 5, 2, 1, 188, 70, 'Right'),
('Bernardo', 'Silva', '1994-08-10', 'Portugal', 20, 5, 7, 1, 173, 64, 'Left');

-- Tottenham Players
INSERT INTO `players` (`first_name`, `last_name`, `date_of_birth`, `nationality`, `squad_number`, `team_id`, `position_id`, `status_id`, `height_cm`, `weight_kg`, `preferred_foot`) VALUES
('Guglielmo', 'Vicario', '1996-10-07', 'Italy', 13, 6, 1, 1, 194, 83, 'Right'),
('Cristian', 'Romero', '1998-04-27', 'Argentina', 17, 6, 2, 1, 185, 79, 'Right'),
('Destiny', 'Udogie', '2002-11-28', 'Italy', 38, 6, 3, 1, 185, 75, 'Left'),
('Pedro', 'Porro', '1999-09-13', 'Spain', 23, 6, 4, 1, 177, 65, 'Right'),
('Yves', 'Bissouma', '1996-08-30', 'Mali', 8, 6, 6, 1, 182, 70, 'Right'),
('James', 'Maddison', '1996-11-23', 'England', 10, 6, 8, 1, 175, 73, 'Right'),
('Son', 'Heung-min', '1992-07-08', 'South Korea', 7, 6, 11, 1, 183, 77, 'Right'),
('Dejan', 'Kulusevski', '2000-04-25', 'Sweden', 21, 6, 12, 1, 186, 74, 'Left'),
('Richarlison', 'Andrade', '1997-05-10', 'Brazil', 9, 6, 14, 1, 179, 80, 'Right'),
('Micky', 'van de Ven', '2001-04-19', 'Netherlands', 37, 6, 2, 1, 193, 80, 'Left'),
('Pape', 'Sarr', '2002-09-14', 'Senegal', 29, 6, 7, 1, 184, 70, 'Right');

-- Insert Fixtures data
INSERT INTO `fixtures` (`match_date`, `kick_off_time`, `home_team_id`, `away_team_id`, `competition_id`, `stadium_id`, `referee_id`, `match_week`, `status`, `attendance`, `weather_conditions`) VALUES
-- Premier League Fixtures
('2024-08-17', '15:00:00', 1, 2, 1, 1, 1, 1, 'Finished', 74500, 'Clear, 22°C'),
('2024-08-17', '17:30:00', 3, 4, 1, 3, 2, 1, 'Finished', 53200, 'Partly cloudy, 19°C'),
('2024-08-18', '14:00:00', 5, 6, 1, 5, 3, 1, 'Finished', 54800, 'Sunny, 25°C'),
('2024-08-18', '16:30:00', 7, 8, 1, 7, 4, 1, 'Finished', 65900, 'Overcast, 18°C'),
('2024-08-24', '15:00:00', 2, 3, 1, 2, 5, 2, 'Finished', 60400, 'Light rain, 16°C'),
('2024-08-24', '17:30:00', 4, 5, 1, 4, 6, 2, 'Finished', 40600, 'Clear, 21°C'),
('2024-08-25', '14:00:00', 6, 7, 1, 6, 7, 2, 'Finished', 62500, 'Sunny, 24°C'),
('2024-08-25', '16:30:00', 8, 1, 1, 8, 8, 2, 'Finished', 39200, 'Partly cloudy, 20°C'),
('2024-08-31', '15:00:00', 1, 3, 1, 1, 9, 3, 'Finished', 74700, 'Clear, 23°C'),
('2024-08-31', '17:30:00', 5, 2, 1, 5, 10, 3, 'Finished', 54900, 'Overcast, 17°C'),
-- Upcoming fixtures
('2024-12-21', '15:00:00', 2, 4, 1, 2, 1, 18, 'Scheduled', 0, 'TBD'),
('2024-12-21', '17:30:00', 3, 5, 1, 3, 2, 18, 'Scheduled', 0, 'TBD'),
('2024-12-22', '14:00:00', 6, 1, 1, 6, 3, 18, 'Scheduled', 0, 'TBD'),
('2024-12-26', '12:30:00', 1, 7, 1, 1, 4, 19, 'Scheduled', 0, 'TBD'),
('2024-12-26', '15:00:00', 4, 8, 1, 4, 5, 19, 'Scheduled', 0, 'TBD');

-- Insert Match Results data
INSERT INTO `match_results` (`fixture_id`, `home_goals`, `away_goals`, `home_goals_ht`, `away_goals_ht`, `winner_team_id`, `result_type`) VALUES
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

-- Insert Goals data
INSERT INTO `goals` (`fixture_id`, `player_id`, `team_id`, `minute`, `added_time`, `goal_type`, `is_own_goal`, `body_part`) VALUES
-- Match 1: Man United 2-1 Arsenal
(1, 7, 1, 23, 0, 'Regular', FALSE, 'Right Foot'),
(1, 9, 1, 67, 2, 'Regular', FALSE, 'Left Foot'),
(1, 17, 2, 45, 1, 'Regular', FALSE, 'Right Foot'),
-- Match 2: Liverpool 1-1 Chelsea
(2, 26, 3, 34, 0, 'Regular', FALSE, 'Left Foot'),
(2, 25, 4, 78, 0, 'Regular', FALSE, 'Right Foot'),
-- Match 3: Man City 3-0 Tottenham
(3, 50, 5, 15, 0, 'Regular', FALSE, 'Left Foot'),
(3, 50, 5, 33, 0, 'Regular', FALSE, 'Right Foot'),
(3, 49, 5, 89, 3, 'Regular', FALSE, 'Right Foot'),
-- Match 4: West Ham 0-2 Everton
(4, 8, 8, 56, 0, 'Regular', FALSE, 'Right Foot'),
(4, 8, 8, 82, 0, 'Regular', FALSE, 'Left Foot'),
-- Match 5: Arsenal 2-3 Liverpool
(5, 17, 2, 12, 0, 'Regular', FALSE, 'Right Foot'),
(5, 19, 2, 67, 0, 'Regular', FALSE, 'Right Foot'),
(5, 26, 3, 23, 0, 'Regular', FALSE, 'Left Foot'),
(5, 28, 3, 45, 2, 'Regular', FALSE, 'Right Foot'),
(5, 29, 3, 90, 4, 'Regular', FALSE, 'Right Foot');

-- Insert Assists data
INSERT INTO `assists` (`goal_id`, `player_id`, `assist_type`) VALUES
(1, 6, 'Pass'),
(2, 11, 'Cross'),
(3, 18, 'Through Ball'),
(4, 22, 'Pass'),
(5, 23, 'Cross'),
(6, 49, 'Pass'),
(7, 49, 'Through Ball'),
(8, 28, 'Cross'),
(9, 18, 'Pass'),
(10, 26, 'Through Ball');

-- Insert Cards data
INSERT INTO `cards` (`fixture_id`, `player_id`, `team_id`, `card_type`, `minute`, `added_time`, `reason`) VALUES
(1, 3, 1, 'Yellow', 34, 0, 'Unsporting behavior'),
(1, 13, 2, 'Yellow', 67, 0, 'Dissent'),
(2, 24, 3, 'Yellow', 23, 0, 'Reckless challenge'),
(2, 22, 4, 'Red', 85, 2, 'Serious foul play'),
(3, 57, 6, 'Yellow', 45, 1, 'Delaying the game'),
(4, 8, 8, 'Yellow', 78, 0, 'Unsporting behavior'),
(5, 15, 2, 'Yellow', 56, 0, 'Reckless challenge'),
(5, 25, 3, 'Yellow', 89, 3, 'Time wasting');

-- Insert Match Events data
INSERT INTO `match_events` (`fixture_id`, `player_id`, `team_id`, `event_type`, `minute`, `added_time`, `description`) VALUES
(1, 7, 1, 'Substitution', 75, 0, 'Marcus Rashford substituted'),
(1, 17, 2, 'Injury', 89, 2, 'Gabriel Martinelli injured'),
(2, 26, 3, 'VAR Check', 34, 0, 'Goal confirmed after VAR check'),
(3, 50, 5, 'Corner', 15, 0, 'Corner kick leading to goal'),
(4, 8, 8, 'Substitution', 56, 0, 'Player substituted after penalty'),
(5, 29, 3, 'Offside', 67, 0, 'Goal initially disallowed for offside');

-- Insert Player Statistics data
INSERT INTO `player_statistics` (`player_id`, `season`, `competition_id`, `matches_played`, `matches_started`, `minutes_played`, `goals_scored`, `assists`, `yellow_cards`, `red_cards`, `clean_sheets`, `saves`, `pass_accuracy`) VALUES
-- Manchester United players
(7, '2024-25', 1, 8, 7, 630, 5, 2, 1, 0, 0, 0, 78.5),
(9, '2024-25', 1, 6, 4, 420, 3, 1, 0, 0, 0, 0, 82.1),
(6, '2024-25', 1, 8, 8, 720, 1, 4, 2, 0, 0, 0, 89.3),
-- Arsenal players
(17, '2024-25', 1, 7, 6, 540, 4, 1, 1, 0, 0, 0, 76.8),
(18, '2024-25', 1, 8, 8, 720, 2, 6, 0, 0, 0, 0, 91.2),
(19, '2024-25', 1, 8, 8, 720, 6, 3, 0, 0, 0, 0, 85.7),
-- Liverpool players
(26, '2024-25', 1, 8, 8, 720, 7, 4, 1, 0, 0, 0, 88.9),
(28, '2024-25', 1, 8, 8, 720, 8, 2, 0, 0, 0, 0, 87.3),
(29, '2024-25', 1, 6, 5, 450, 3, 2, 0, 0, 0, 0, 83.4),
-- Goalkeepers
(1, '2024-25', 1, 8, 8, 720, 0, 0, 0, 0, 4, 32, 75.2),
(12, '2024-25', 1, 8, 8, 720, 0, 0, 1, 0, 5, 28, 82.1),
(23, '2024-25', 1, 8, 8, 720, 0, 0, 0, 0, 6, 25, 88.5);

-- Insert Team Statistics data
INSERT INTO `team_statistics` (`team_id`, `season`, `competition_id`, `matches_played`, `wins`, `draws`, `losses`, `goals_for`, `goals_against`, `goal_difference`, `points`, `clean_sheets`) VALUES
(1, '2024-25', 1, 10, 6, 2, 2, 18, 12, 6, 20, 4),
(2, '2024-25', 1, 10, 5, 3, 2, 16, 13, 3, 18, 3),
(3, '2024-25', 1, 10, 7, 1, 2, 22, 10, 12, 22, 6),
(4, '2024-25', 1, 10, 4, 4, 2, 14, 11, 3, 16, 4),
(5, '2024-25', 1, 10, 8, 1, 1, 25, 8, 17, 25, 7),
(6, '2024-25', 1, 10, 3, 3, 4, 12, 16, -4, 12, 2),
(7, '2024-25', 1, 10, 4, 2, 4, 13, 15, -2, 14, 3),
(8, '2024-25', 1, 10, 5, 2, 3, 15, 14, 1, 17, 4);

-- Insert Player Fixture data
INSERT INTO `player_fixture_stats` (`player_id`, `fixture_id`, `minutes_played`, `goals_scored`, `assists`, `yellow_cards`, `red_cards`, `shots_on_target`, `shots_off_target`, `passes_completed`, `passes_attempted`, `rating`) VALUES
(7, 1, 90, 1, 0, 0, 0, 3, 2, 28, 35, 7.8),
(9, 1, 75, 1, 1, 0, 0, 2, 1, 22, 28, 8.2),
(17, 1, 90, 1, 0, 0, 0, 4, 1, 31, 38, 7.5),
(26, 2, 90, 1, 0, 1, 0, 2, 3, 45, 52, 7.3),
(50, 3, 90, 2, 0, 0, 0, 5, 2, 38, 42, 9.1),
(8, 4, 90, 2, 0, 1, 0, 3, 1, 25, 31, 8.7);

-- Insert Player Contracts data
INSERT INTO `player_contracts` (`player_id`, `team_id`, `start_date`, `end_date`, `weekly_salary`, `signing_bonus`, `contract_type`, `is_active`) VALUES
(7, 1, '2022-07-01', '2027-06-30', 250000.00, 5000000.00, 'Professional', TRUE),
(9, 1, '2019-07-01', '2025-06-30', 200000.00, 2000000.00, 'Professional', TRUE),
(17, 2, '2021-07-01', '2026-06-30', 180000.00, 2000000.00, 'Professional', TRUE),
(19, 2, '2019-07-01', '2025-06-30', 220000.00, 3000000.00, 'Professional', TRUE),
(26, 3, '2017-07-01', '2025-06-30', 300000.00, 8000000.00, 'Professional', TRUE),
(28, 3, '2017-07-01', '2025-06-30', 350000.00, 10000000.00, 'Professional', TRUE),
(50, 5, '2022-07-01', '2029-06-30', 400000.00, 15000000.00, 'Professional', TRUE);

-- Insert Medical Records data
INSERT INTO `medical_records` (`player_id`, `injury_type`, `injury_description`, `injury_date`, `expected_return_date`, `actual_return_date`, `severity`, `treatment_notes`, `medical_staff`, `is_active`) VALUES
(3, 'Hamstring Strain', 'Grade 1 hamstring strain during training', '2024-08-15', '2024-09-01', '2024-08-30', 'Minor', 'Rest and physiotherapy', 'Dr. Smith', FALSE),
(13, 'Ankle Sprain', 'Twisted ankle during match', '2024-08-20', '2024-09-10', '2024-09-08', 'Moderate', 'Ice, compression, elevation', 'Dr. Johnson', FALSE),
(22, 'Knee Injury', 'Meniscus tear', '2024-08-25', '2024-11-15', NULL, 'Severe', 'Arthroscopic surgery required', 'Dr. Williams', TRUE),
(15, 'Muscle Fatigue', 'General muscle fatigue', '2024-09-01', '2024-09-05', '2024-09-04', 'Minor', 'Rest and recovery', 'Dr. Brown', FALSE);

-- Insert Team Staff data
INSERT INTO `team_staff` (`team_id`, `first_name`, `last_name`, `role`, `department`, `hire_date`, `salary`, `is_active`) VALUES
-- Manchester United staff
(1, 'Mitchell', 'van der Gaag', 'Assistant Coach', 'Coaching', '2022-07-01', 150000.00, TRUE),
(1, 'Gary', 'Walker', 'Fitness Coach', 'Coaching', '2020-01-15', 80000.00, TRUE),
(1, 'Dr. Steve', 'McNally', 'Team Doctor', 'Medical', '2018-06-01', 120000.00, TRUE),
(1, 'Richard', 'Hartis', 'Goalkeeping Coach', 'Coaching', '2022-07-01', 90000.00, TRUE),
-- Arsenal staff
(2, 'Albert', 'Stuivenberg', 'Assistant Coach', 'Coaching', '2019-12-20', 140000.00, TRUE),
(2, 'Inaki', 'Cana', 'Goalkeeping Coach', 'Coaching', '2021-07-01', 90000.00, TRUE),
(2, 'Dr. Gary', 'O\'Driscoll', 'Head of Medical', 'Medical', '2009-05-01', 130000.00, TRUE),
(2, 'Carlos', 'Cuesta', 'Set Piece Coach', 'Coaching', '2019-12-20', 75000.00, TRUE),
-- Liverpool staff
(3, 'Pepijn', 'Lijnders', 'Assistant Coach', 'Coaching', '2018-01-01', 160000.00, TRUE),
(3, 'John', 'Achterberg', 'Goalkeeping Coach', 'Coaching', '2009-07-01', 95000.00, TRUE),
(3, 'Dr. Jim', 'Moxon', 'Team Doctor', 'Medical', '2013-08-01', 125000.00, TRUE),
(3, 'Vitor', 'Matos', 'Elite Development Coach', 'Coaching', '2020-01-01', 85000.00, TRUE);

SET FOREIGN_KEY_CHECKS = 1;

-- Successful completion message
SELECT 'Data population completed successfully!' as status;

COMMIT;

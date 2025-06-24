<div align="center">

# ⚽ Football Fixtures Database

*A comprehensive, production-ready MySQL database system for managing football leagues, teams, players, and match data*

[![MySQL](https://img.shields.io/badge/MySQL-8.0+-blue.svg)](https://mysql.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Database](https://img.shields.io/badge/Tables-17+-orange.svg)](#database-schema)
[![Views](https://img.shields.io/badge/Views-4-purple.svg)](#database-views)
[![Procedures](https://img.shields.io/badge/Stored_Procedures-1-red.svg)](#stored-procedures)

---

*Transform your football data management with a robust, scalable database solution designed for modern sports analytics and applications.*

</div>

## 🌟 Overview

The **Football Fixtures Database** is a comprehensive MySQL database system designed to handle all aspects of football league management. From player contracts and medical records to match statistics and team performance analytics, this database provides a complete foundation for football-related applications.

### ✨ Key Highlights

- **🏗️ 17+ Interconnected Tables** - Complete relational structure
- **📊 4 Pre-built Views** - Ready-to-use data perspectives  
- **⚙️ Stored Procedures** - Automated statistics updates
- **🔍 Advanced Indexing** - Optimized for performance
- **🌍 Multi-League Support** - Handle multiple competitions
- **📈 Real-time Statistics** - Live match and player tracking
- **🏥 Medical Tracking** - Comprehensive injury management
- **💼 Contract Management** - Player contract lifecycle

---

## 🚀 Quick Start

### Prerequisites

- MySQL 8.0 or higher
- Database administration tool (MySQL Workbench, phpMyAdmin, etc.)
- Sufficient storage space (recommended: 1GB+ for production data)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/football-fixtures-database.git
   cd football-fixtures-database
   ```

2. **Create the database schema**
   ```bash
   mysql -u your_username -p < Football_Fixtures_Database_Creation_Script.sql
   ```

3. **Populate with sample data**
   ```bash
   mysql -u your_username -p < football-fixtures-db-population-script.sql
   ```

4. **Verify installation**
   ```sql
   USE football_fixtures_db;
   SHOW TABLES;
   SELECT COUNT(*) FROM fixtures;
   ```

---

## 🏗️ Database Schema

### Core Tables Structure

<details>
<summary><strong>🏆 Competition Management</strong></summary>

| Table | Purpose | Key Fields |
|-------|---------|------------|
| **competitions** | League/tournament data | name, sponsor, season, country |
| **team_statistics** | Season performance | wins, draws, losses, points, goal_difference |

</details>

<details>
<summary><strong>🏟️ Infrastructure</strong></summary>

| Table | Purpose | Key Fields |
|-------|---------|------------|
| **stadiums** | Venue information | name, location, capacity, surface_type |
| **referees** | Match officials | name, nationality, fifa_badge |

</details>

<details>
<summary><strong>👥 Personnel Management</strong></summary>

| Table | Purpose | Key Fields |
|-------|---------|------------|
| **teams** | Club information | name, founded_year, colors, home_stadium |
| **coaches** | Coaching staff | name, nationality, license_level |
| **players** | Player profiles | name, position, nationality, squad_number |
| **team_staff** | Support personnel | role, department, salary |

</details>

<details>
<summary><strong>⚽ Match Management</strong></summary>

| Table | Purpose | Key Fields |
|-------|---------|------------|
| **fixtures** | Match scheduling | date, teams, competition, status |
| **match_results** | Final scores | home_goals, away_goals, winner |
| **goals** | Goal tracking | player, minute, goal_type, body_part |
| **assists** | Assist tracking | goal_id, player, assist_type |
| **cards** | Disciplinary actions | player, card_type, minute, reason |
| **match_events** | Match incidents | event_type, minute, description |

</details>

<details>
<summary><strong>📊 Analytics & Performance</strong></summary>

| Table | Purpose | Key Fields |
|-------|---------|------------|
| **player_statistics** | Season stats | goals, assists, matches_played, pass_accuracy |
| **player_fixture_stats** | Match performance | minutes, rating, shots, passes |

</details>

<details>
<summary><strong>💼 Business Management</strong></summary>

| Table | Purpose | Key Fields |
|-------|---------|------------|
| **player_contracts** | Contract details | start_date, end_date, salary, contract_type |
| **medical_records** | Injury tracking | injury_type, severity, return_date |

</details>

### 🔗 Relationship Highlights

- **Foreign Key Constraints** ensure data integrity
- **Cascading Updates** maintain consistency
- **Optimized Indexes** for fast queries
- **ENUM Types** for standardized values

---

## 📊 Database Views

Pre-built views for common queries:

### 🏆 League Table
```sql
SELECT * FROM league_table 
WHERE competition_id = 1 
ORDER BY position;
```

### ⚽ Top Scorers
```sql
SELECT * FROM top_scorers 
ORDER BY goals_scored DESC 
LIMIT 10;
```

### 📅 Upcoming Fixtures
```sql
SELECT * FROM upcoming_fixtures 
WHERE match_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY);
```

### 📈 Player Performance
```sql
SELECT * FROM player_performance 
WHERE team_name = 'Manchester United'
ORDER BY goals_scored DESC;
```

---

## ⚙️ Stored Procedures

### UpdateTeamStatistics
Automatically updates team statistics after match completion:

```sql
CALL UpdateTeamStatistics(fixture_id);
```

**Features:**
- Calculates points based on match result
- Updates goal difference
- Maintains win/draw/loss records
- Handles both home and away team statistics

---

## 💡 Usage Examples

### 🔍 Common Queries

**Get next 5 Premier League matches:**
```sql
SELECT 
    f.match_date,
    f.kick_off_time,
    ht.team_name AS home_team,
    at.team_name AS away_team,
    s.stadium_name
FROM fixtures f
JOIN teams ht ON f.home_team_id = ht.team_id
JOIN teams at ON f.away_team_id = at.team_id
JOIN competitions c ON f.competition_id = c.competition_id
JOIN stadiums s ON f.stadium_id = s.stadium_id
WHERE c.competition_name = 'Premier League'
  AND f.match_date >= CURDATE()
  AND f.status = 'Scheduled'
ORDER BY f.match_date, f.kick_off_time
LIMIT 5;
```

**Player goal statistics:**
```sql
SELECT 
    CONCAT(p.first_name, ' ', p.last_name) AS player_name,
    t.team_name,
    COUNT(g.goal_id) AS total_goals,
    COUNT(CASE WHEN g.goal_type = 'Penalty' THEN 1 END) AS penalties,
    COUNT(CASE WHEN g.body_part = 'Head' THEN 1 END) AS headers
FROM players p
JOIN teams t ON p.team_id = t.team_id
LEFT JOIN goals g ON p.player_id = g.player_id
GROUP BY p.player_id, p.first_name, p.last_name, t.team_name
HAVING total_goals > 0
ORDER BY total_goals DESC;
```

**Team form analysis:**
```sql
SELECT 
    t.team_name,
    ts.matches_played,
    ROUND((ts.wins / ts.matches_played) * 100, 1) AS win_percentage,
    ts.goals_for,
    ts.goals_against,
    ROUND(ts.goals_for / ts.matches_played, 2) AS goals_per_match
FROM team_statistics ts
JOIN teams t ON ts.team_id = t.team_id
WHERE ts.season = '2024-25' AND ts.competition_id = 1
ORDER BY win_percentage DESC;
```

---

## 🎯 Features

### 🔧 Technical Features
- **UTF8MB4 Character Set** - Full Unicode support
- **InnoDB Engine** - ACID compliance and foreign keys
- **Optimized Indexes** - Fast query performance
- **Data Validation** - ENUM constraints and checks
- **Audit Trails** - Created/updated timestamps

### 📊 Functional Features
- **Multi-Competition Support** - Handle various leagues/tournaments
- **Real-time Match Tracking** - Live score updates
- **Player Career Management** - Complete player lifecycle
- **Medical Record Keeping** - Injury tracking and recovery
- **Contract Management** - Financial and legal tracking
- **Statistical Analysis** - Comprehensive performance metrics

### 🔒 Security Features
- **Foreign Key Constraints** - Data integrity
- **Input Validation** - Prevent invalid data
- **Role-based Access** - Configurable permissions
- **Backup-friendly** - Easy data export/import

---

## 📈 Sample Data Included

The database comes pre-populated with realistic sample data:

- **🏟️ 15 Premier League Stadiums** - Including capacity and surface type
- **👨‍💼 15 Professional Coaches** - With qualifications and nationalities  
- **⚽ 31 Professional Players** - Across multiple teams with detailed profiles
- **🏆 5 Major Competitions** - Premier League, Championship, FA Cup, Champions League, Europa League
- **📅 18+ Match Fixtures** - Mix of completed and scheduled matches
- **📊 Complete Statistics** - Goals, assists, cards, and performance data
- **💼 Contract Information** - Salary and contract duration data
- **🏥 Medical Records** - Injury tracking examples

---

## 🛠️ Customization

### Adding New Competitions
```sql
INSERT INTO competitions (competition_name, sponsor, season, country) 
VALUES ('La Liga', 'Santander', '2024-25', 'Spain');
```

### Extending Player Attributes
The flexible schema allows easy addition of new player attributes:
- Performance metrics
- Physical measurements  
- Social media handles
- Market valuations

### Custom Views
Create specialized views for your specific needs:
```sql
CREATE VIEW team_discipline AS
SELECT 
    t.team_name,
    COUNT(CASE WHEN c.card_type = 'Yellow' THEN 1 END) AS yellow_cards,
    COUNT(CASE WHEN c.card_type = 'Red' THEN 1 END) AS red_cards
FROM teams t
LEFT JOIN players p ON t.team_id = p.team_id
LEFT JOIN cards c ON p.player_id = c.player_id
GROUP BY t.team_id, t.team_name;
```

---

## 🤝 Contributing

We welcome contributions! Here's how you can help:

1. **🐛 Report Issues** - Found a bug? Let us know!
2. **💡 Suggest Features** - Have ideas for improvements?
3. **📝 Improve Documentation** - Help make our docs better
4. **🔧 Submit Code** - Fork, develop, and create pull requests

### Development Setup
```bash
# Fork the repository
git clone https://github.com/yourusername/football-fixtures-database.git

# Create feature branch
git checkout -b feature/amazing-feature

# Make changes and test
mysql -u root -p < your-changes.sql

# Commit and push
git commit -m "Add amazing feature"
git push origin feature/amazing-feature
```


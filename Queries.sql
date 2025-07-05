
-- Stadium utilization report
SELECT 
    s.stadium_name,
    s.capacity,
    COUNT(f.fixture_id) AS matches_hosted,
    AVG(f.attendance) AS avg_attendance,
    ROUND((AVG(f.attendance) / s.capacity) * 100, 1) AS capacity_utilization_percent
FROM stadiums s
LEFT JOIN fixtures f ON s.stadium_id = f.stadium_id
WHERE f.status = 'Finished'
GROUP BY s.stadium_id, s.stadium_name, s.capacity
ORDER BY capacity_utilization_percent DESC;


-- Player injury history report
SELECT 
    CONCAT(p.first_name, ' ', p.last_name) AS player_name,
    t.team_name,
    mr.injury_type,
    mr.injury_date,
    mr.expected_return_date,
    mr.severity,
    DATEDIFF(COALESCE(mr.actual_return_date, CURDATE()), mr.injury_date) AS days_out
FROM medical_records mr
JOIN players p ON mr.player_id = p.player_id
JOIN teams t ON p.team_id = t.team_id
WHERE mr.injury_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
ORDER BY mr.injury_date DESC;


-- Most Disciplined vs Most Aggressive Players
SELECT 
    CONCAT(p.first_name, ' ', p.last_name) AS player_name,
    t.team_name,
    pos.position_name,
    COUNT(CASE WHEN c.card_type = 'Yellow' THEN 1 END) AS yellow_cards,
    COUNT(CASE WHEN c.card_type = 'Red' THEN 1 END) AS red_cards,
    COUNT(c.card_id) AS total_cards,
    ROUND(AVG(c.minute), 1) AS avg_card_minute,
    CASE 
        WHEN COUNT(c.card_id) = 0 THEN 'Disciplined'
        WHEN COUNT(c.card_id) >= 3 THEN 'Aggressive'
        ELSE 'Moderate'
    END AS discipline_rating
FROM players p
JOIN teams t ON p.team_id = t.team_id
JOIN positions pos ON p.position_id = pos.position_id
LEFT JOIN cards c ON p.player_id = c.player_id
GROUP BY p.player_id, p.first_name, p.last_name, t.team_name, pos.position_name
ORDER BY total_cards DESC, yellow_cards DESC;


-- Increase salaries for top performers
UPDATE player_contracts pc
JOIN players p ON pc.player_id = p.player_id
JOIN player_statistics ps ON p.player_id = ps.player_id
SET pc.weekly_salary = pc.weekly_salary * 1.15
WHERE ps.season = '2024-25' 
  AND ps.competition_id = 1
  AND (ps.goals_scored >= 5 OR ps.assists >= 4)
  AND pc.is_active = TRUE;
  -- We are running another SELECT query just to see the updates for clarity.
    SELECT pc.player_id, pc.weekly_salary, ps.goals_scored, ps.assists
    FROM player_contracts pc
    JOIN players p ON pc.player_id = p.player_id
    JOIN player_statistics ps ON p.player_id = ps.player_id
    WHERE ps.season = '2024-25'
    AND ps.competition_id = 1
    AND (ps.goals_scored >= 5 OR ps.assists >= 4)
    AND pc.is_active = TRUE;


-- Remove old medical records for recovered players
DELETE FROM medical_records 
WHERE is_active = FALSE 
  AND actual_return_date IS NOT NULL 
  AND actual_return_date < DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
  AND severity IN ('Minor', 'Moderate');

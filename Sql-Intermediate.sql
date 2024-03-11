--Binary Tree Nodes
SELECT N,
       CASE
           WHEN P IS NULL THEN 'Root'
           WHEN N IN (SELECT DISTINCT P FROM BST) THEN 'Inner'
           ELSE 'Leaf'
       END
FROM BST
ORDER BY N;

--Ollivander's Inventory
select w.id, wp.age,w.coins_needed, w.power
from Wands w
join Wands_property wp on w.code=wp.code
WHERE wP.IS_EVIL = 0 AND W.COINS_NEEDED = (SELECT MIN(COINS_NEEDED) 
                                          FROM WANDS AS X
                                          JOIN WANDS_PROPERTY AS Y 
                                          ON (X.CODE = Y.CODE) 
                                          WHERE X.POWER = W.POWER AND Y.AGE = wp.AGE) 
ORDER BY W.POWER DESC, wP.AGE DESC;


--Top Competitors
SELECT h.hacker_id, h.name
FROM Hackers h
JOIN Submissions s ON h.hacker_id = s.hacker_id
JOIN Challenges c ON s.challenge_id = c.challenge_id
WHERE s.score = (SELECT MAX(score) FROM Difficulty WHERE difficulty_level = c.difficulty_level)
GROUP BY h.hacker_id, h.name
HAVING COUNT(DISTINCT s.challenge_id) > 1
ORDER BY COUNT(DISTINCT s.challenge_id) DESC, h.hacker_id;

--Contest Leaderboard
select m.hacker_id, h.name, sum(score) as total_score from
(select hacker_id, challenge_id, max(score) as score
from Submissions group by hacker_id, challenge_id) as m
join Hackers as h
on m.hacker_id = h.hacker_id
group by m.hacker_id, h.name
having total_score > 0
order by total_score desc, m.hacker_id;

--New Companies
SELECT 
    Company.company_code, 
    Company.founder,
    COUNT(DISTINCT lm.lead_manager_code) AS lead_manager_count,
    COUNT(DISTINCT sm.senior_manager_code) AS senior_manager_count,
    COUNT(DISTINCT m.manager_code) AS manager_count,
    COUNT(DISTINCT e.employee_code) AS employee_count
FROM 
    Company
LEFT JOIN 
    Lead_Manager lm ON Company.company_code = lm.company_code
LEFT JOIN  
    Senior_Manager sm ON Company.company_code = sm.company_code
LEFT JOIN 
    Manager m ON Company.company_code = m.company_code
LEFT JOIN 
    Employee e ON Company.company_code = e.company_code
GROUP BY 
    Company.company_code, 
    Company.founder
ORDER BY 
    Company.company_code;

--Placements
select s.name from
Students s
inner join Friends f on s.id=f.id
inner join packages p1 on s.id=p1.id
inner join packages p2 on f.friend_id=p2.id
where p1.salary<p2.salary
order by p2.salary;

--Weather Observation Station 5
(
    SELECT CITY, LENGTH(CITY) AS name_length
    FROM STATION
    ORDER BY name_length, CITY
    LIMIT 1
)
UNION ALL
(
    SELECT CITY, LENGTH(CITY) AS name_length
    FROM STATION
    ORDER BY name_length DESC, CITY
    LIMIT 1
);
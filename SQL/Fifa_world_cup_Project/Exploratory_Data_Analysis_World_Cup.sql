 -- Exploratory data analysis
 
 SELECT * FROM final_table;
 
 -- NUmber of players from each country
 SELECT country, COUNT(country) AS Players_per_country
 FROM final_table
 GROUP BY country
 ORDER BY Players_per_country;
 
 -- Player value per country
 SELECT country, Sum(transfer_value_in_millions) AS Country_Transfer_Value_In_Millions
 FROM final_table
 GROUP BY country
 ORDER BY Country_Transfer_Value_In_Millions;
 
 
 
 -- Average height per country
 SELECT 
    country,
    round(AVG(player_height_in_cm)) AS Avg_height_per_country,
    CASE
        WHEN round(AVG(player_height_in_cm)) < 178 THEN 'Short average squad'
        WHEN round(AVG(player_height_in_cm)) >= 178 THEN 'Tall average squad'
    END AS Diagnosis
FROM final_table
GROUP BY country
ORDER BY Avg_height_per_country;

-- Tier of nation

SELECT country, current_world_ranking,
CASE
WHEN (current_world_ranking <= 10 and  current_world_ranking > 0) THEN "Top Tier Nation"
WHEN (current_world_ranking > 10 and  current_world_ranking <= 20) THEN "Mid Tier Nation"
WHEN (current_world_ranking > 20 and  current_world_ranking <= 40) THEN "Low-Mid Tier Nation"
ELSE "Low Tier Nation"
END AS Country_Tier_Ranking
FROM final_table
GROUP BY country, current_world_ranking
ORDER BY current_world_ranking;

 
 
 
 

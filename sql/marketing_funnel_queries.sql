SELECT channel,
       COUNT(*) AS visitors,
       SUM(CASE WHEN purchase_completed = 'Yes' THEN 1 ELSE 0 END) AS purchases,
       ROUND(100.0 * SUM(CASE WHEN purchase_completed = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS conversion_rate,
       ROUND(SUM(revenue), 2) AS revenue
FROM marketing_funnel
GROUP BY channel
ORDER BY conversion_rate DESC;

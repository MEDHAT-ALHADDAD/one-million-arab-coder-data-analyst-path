SELECT DATE_PART('year',o.o
ccurred_at) "year", DATE_PART('month',
o.occurred_at) "MONTH",  			 SUM(o.gloss_amt_usd)

 FROM orders o
 JOIN accounts a
  ON o.account_id = a.id
where a.name = 'Walmart'
GROUP BY 1 , 2
ORDER BY 3 DESC
LIMIT 1;

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>
SELECT a.name , SUM(o.total_amt_usd) "SUM",            
   CASE WHEN SUM(o.total_amt_usd)>200000 THEN '
greater than 200k'
		WHEN (SUM(o.total_amt_usd)>100000 
AND SUM(o.total_amt_usd)<100000) THEN '100k-200k'
        ELSE '<100k' END
 FROM accounts a
 JOIN orders o
  ON o.account_id = a.id
 GROUP BY a.name
 ORDER BY 2 DESC

SELECT a.name , SUM(o.total_amt_usd) "SUM",   
             CASE WHEN SUM(o.total_amt_usd)>200000
 THEN 'greater than 200k'
		WHEN SUM(o.total_amt_usd)>100000
 AND SUM(o.total_amt_usd)<100000 THEN '100k-200k'
        ELSE '<100k' END
 FROM accounts a
 JOIN orders o
  ON o.account_id = a.id AND (DATE_PART('year',o.occurred_at)
 = '2017' OR DATE_PART('year',o.occurred_at) = '2016')
 GROUP BY a.name
 ORDER BY 2 DESC


SELECT s.name , count(o.account_id),     
   CASE WHEN  count(o.account_id)>200 THEN
 'yes' ELSE 'no' END
FROM sales_reps s
JOIN accounts a
 ON a.SAles_rep_id = s.id
JOIN orders o
 ON o.account_id = a.id
GROUP BY s.name
ORDER BY 2 DESC


SELECT s.name , count(o.account_id),  SUM (o.total_amt_usd),  
	CASE WHEN  (count(o.account_id)>200 OR SUM 			
(o.total_amt_usd)>750000)THEN 'top'
	     WHEN  ((count(o.account_id)>150 AND 			
count(o.account_id)<200) OR (SUM 			
	(o.total_amt_usd)>500000 AND SUM 	
	(o.total_amt_usd)<750000))THEN 'middle'
ELSE 'low' END
FROM sales_reps s
JOIN accounts a
 ON a.SAles_rep_id = s.id
JOIN orders o
 ON o.account_id = a.id
GROUP BY s.name
ORDER BY 3 DESC


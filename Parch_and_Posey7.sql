SELECT *
FROM (
  SELECT region_name,MAX(sum) sum
  FROM(
      SELECT  r.name REGION_NAME,s.name,       		  	    SUM(o.total_amt_usd)
      FROM region r
      JOIN sales_reps s
       ON s.region_id = r.id
      JOIN accounts a
       ON a.sales_rep_id = s.id
      JOIN orders o
       ON o.account_id = a.id
      GROUP BY 1,2
      ORDER BY 1,3 DESC)t1
	  GROUP BY 1)t2
  JOIN  (SELECT  r.name REGION_NAME,s.name,       	       SUM(o.total_amt_usd)
        FROM region r
        JOIN sales_reps s
         ON s.region_id = r.id
        JOIN accounts a
         ON a.sales_rep_id = s.id
        JOIN orders o
         ON o.account_id = a.id
        GROUP BY 1,2
        ORDER BY 1,3 DESC)t3
  ON t3.region_name = t2.region_name AND t3.sum = t2.sum







SELECT *
FROM (SELECT  r.name REGION_NAME,      		  	    	  SUM(o.total_amt_usd)
      FROM region r
      JOIN sales_reps s
       ON s.region_id = r.id
      JOIN accounts a
       ON a.sales_rep_id = s.id
      JOIN orders o
       ON o.account_id = a.id
      GROUP BY 1
      ORDER BY 2 DESC
      LIMIT 1)t1
JOIN (SELECT r.name REGION_NAME,count(o.*)
      FROM region r
      JOIN sales_reps s
       ON s.region_id = r.id
      JOIN accounts a
       ON a.sales_rep_id = s.id
      JOIN orders o
       ON o.account_id = a.id
      GROUP BY 1)t2
 ON t2.region_name = t1.region_name





SELECT COUNT(*)
FROM(SELECT a.name , SUM(o.total) 
 FROM accounts a
 JOIN orders o
  ON o.account_id = a.id
 GROUP BY 1
 HAVING  SUM(o.total)  > (SELECT sum_TOTAL
	 FROM(SELECT a.name , SUM(o.standard_qty),SUM(o.total) SUM_TOTAL
     FROM accounts a
     JOIN orders o
      ON o.account_id = a.id
     GROUP BY 1
     ORDER BY 2 DESC
     LIMIT 1)t1)
 ORDER BY 2 DESC)t7



SELECT COUNT(*)
FROM(SELECT a.name , SUM(o.total) 
 FROM accounts a
 JOIN orders o
  ON o.account_id = a.id
 GROUP BY 1
 HAVING  SUM(o.total)  > (SELECT sum_TOTAL
	 FROM(SELECT a.name , SUM(o.standard_qty),SUM(o.total) SUM_TOTAL
     FROM accounts a
     JOIN orders o
      ON o.account_id = a.id
     GROUP BY 1
     ORDER BY 2 DESC
     LIMIT 1)t1)
 ORDER BY 2 DESC)t7



SELECT AVG(tot_spent)
FROM (SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
      FROM orders o
      JOIN accounts a
      ON a.id = o.account_id
      GROUP BY a.id, a.name
      ORDER BY 3 DESC
       LIMIT 10) temp;




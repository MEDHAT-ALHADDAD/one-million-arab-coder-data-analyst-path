WITH t1 AS (SELECT s.name sales_name, r.name region_name , SUM(o.total_amt_usd)
FROM region r
JOIN sales_reps s
 ON s.region_id = r.id
JOIN accounts a
 ON a.sales_rep_id = s.id
JOIN orders o
 ON o.account_id = a.id
GROUP BY 1,2
ORDER BY 2,3 DESC),

t2 AS (SELECT t1.region_name ,MAX(t1.sum) 
FROM t1
GROUP BY 1)


SELECT t1.*
FROM t1
JOIN t2
 ON t1.region_name = t2.region_name AND t1.sum = t2.max




WITH t1 AS (SELECT region_name
FROM(SELECT  r.name region_name , SUM(o.total_amt_usd)
	FROM region r
	JOIN sales_reps s
	 ON s.region_id = r.id
	JOIN accounts a
	 ON a.sales_rep_id = s.id
	JOIN orders o
	 ON o.account_id = a.id
	GROUP BY 1
	ORDER BY 2 DESC
	LIMIT 1)t0),
	   
t2 AS (SELECT  r.name region_name , o.total_amt_usd
	   FROM region r
	   JOIN sales_reps s
	    ON s.region_id = r.id
	   JOIN accounts a
	    ON a.sales_rep_id = s.id
	   JOIN orders o
	    ON o.account_id = a.id)
SELECT t2.region_name , COUNT(*)
FROM t2
JOIN t1
 ON t1.region_name = t2.region_name
GROUP BY 1




WITH t1 AS (SELECT a.website , right(a.website,3)
FROM ACCOUNTS a
GROUP BY 1)

SELECT t1.right,count(t1.right)
FROM t1
GROUP BY 1
ORDER BY 2 DESC



WITH t1 AS (SELECT a.name , left(a.name,1)
FROM ACCOUNTS a
GROUP BY 1)

SELECT t1.left,count(t1.left)
FROM t1
GROUP BY 1
ORDER BY 2 DESC



WITH t1 AS (SELECT a.name , left(a.name,1)
FROM ACCOUNTS a 
GROUP BY 1)

,t2 AS (SELECT t1.left,count(t1.left)
FROM t1
GROUP BY 1
ORDER BY 2 DESC)

,t3 AS (SELECT *,CASE WHEN t2.left NOT IN 
		('0','1','2','3','4','5','6','7','8','9') 
		THEN 'l' else 'n' END
FROM t2)

SELECT t3.case, count(t3.case)
FROM t3
GROUP BY 1



SELECT a.primary_poc,LEFT(a.primary_poc,STRPOS(a.primary_poc,' ')) FIRST_NAME,
			RIGHT(a.primary_poc,length(primary_poc)-STRPOS(a.primary_poc,' ') )LAST_NAME
FROM accounts a


SELECT a.name,LEFT(a.name,STRPOS(a.name,' ')) FIRST_NAME,
			RIGHT(a.name,length(a.name)-STRPOS(a.name,' ') )LAST_NAME
FROM sales_reps a




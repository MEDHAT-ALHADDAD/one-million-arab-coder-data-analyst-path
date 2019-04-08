SELECT sales_reps.name  , count(accounts.sales_rep_id) 
 FROM sales_reps
 JOIN accounts
  ON accounts.sales_rep_id = sales_reps.id
 GROUP BY sales_reps.name
 HAVING count(accounts.sales_rep_id) > 5
 ORDER BY count


SELECT a.name , count(o.account_id)
 FROM accounts a
 JOIN orders o
  ON a.id = o.account_id
 GROUP BY a.name
 HAVING count(o.account_id)>20
 ORDER BY count 


SELECT a.name , count(o.account_id)
 FROM accounts a
 JOIN orders o
  ON a.id = o.account_id
 GROUP BY a.name
 HAVING count(o.account_id)>20
 ORDER BY count DESC
 LIMIT 1; 


SELECT a.name , SUM(o.total_amt_usd )
 FROM accounts a
 JOIN orders o
  ON a.id = o.account_id
 GROUP BY a.name
 HAVING SUM(o.total_amt_usd)>30000
 ORDER BY SUM 


SELECT a.name , SUM(o.total_amt_usd )
 FROM accounts a
 JOIN orders o
  ON a.id = o.account_id
 GROUP BY a.name
 ORDER BY SUM 
 limit 1;
 

SELECT a.name , count(w.channel) count_facebook
 FROM accounts a
 JOIN web_events w
  ON w.account_id = a.id AND w.channel = 'facebook'
 GROUP BY a.name
 HAVING  count(w.channel)>6
 ORDER BY count_facebook


SELECT  w.channel,count (w.channel)
 FROM accounts a
 JOIN web_events w
  ON w.account_id = a.id
 GROUP BY w.channel
 ORDER BY count DESC
 LIMIT 10;
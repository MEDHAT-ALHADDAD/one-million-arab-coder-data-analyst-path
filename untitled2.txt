1-SELECT accounts.name account_name,orders.occurred_at
 FROM accounts
 JOIN orders
  ON orders.account_id = accounts.id
 ORDER BY orders.occurred_at 
 limit 1;


2-SELECT accounts.name account_name,SUM(orders.total_amt_usd) total_sale
 FROM accounts
 JOIN orders
  ON orders.account_id = accounts.id
 GROUP BY accounts.name


3-SELECT accounts.name,web_events.occurred_at,web_events.channel
 FROM accounts
 JOIN web_events
  ON web_events.account_id = accounts.id
 ORDER BY web_events.occurred_at DESC
 LIMIT 1;


4-SELECT web_events.channel, count(web_events.channel)
 FROM web_events
 GROUP BY web_events.channel


5-SELECT accounts.primary_poc
 FROM web_events w
 JOIN accounts
  ON w.account_id = accounts.id
 ORDER BY w.occurred_at
 LIMIT 1;


6-SELECT accounts.name account_name,MIN(orders.total_amt_usd) MIN_SALE
 FROM accounts
 JOIN orders
  ON orders.account_id = accounts.id
 GROUP BY accounts.name
ORDER BY MIN_SALE;

7-SELECT region.name,count(sales_reps.region_id) counts
 FROM region
 JOIN sales_reps
  ON sales_reps.region_id = region.id
 GROUP BY region.name
 ORDER BY counts



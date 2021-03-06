﻿SELECT region.name region_name ,sales_reps.name
 sales_name,accounts.name 
account_name
 FROM region
 JOIN sales_reps
  ON sales_reps.region_id = region.id
   AND region.name = 'Midwest'
 JOIN accounts
  ON accounts.sales_rep_id = sales_reps.id
ORDER BY accounts.name

SELECT region.name region_name ,sales_reps.name
 sales_name,accounts.name 
account_name
 FROM region
 JOIN sales_reps
  ON sales_reps.region_id = region.id
   AND region.name = 'Midwest'
   AND sales_reps.name LIKE 'S%'
 JOIN accounts
  ON accounts.sales_rep_id = sales_reps.id
ORDER BY accounts.name


SELECT region.name region_name ,sales_reps.name sales_name
,accounts.name
 account_name
 FROM region
 JOIN sales_reps
  ON sales_reps.region_id = region.id
   AND region.name = 'Midwest'
   AND sales_reps.name LIKE '% K%'
 JOIN accounts
  ON accounts.sales_rep_id = sales_reps.id
ORDER BY accounts.name


SELECT  region.name region_name,accounts.name
 account_name,orders.standard_qty, orders.total_amt_usd/(orders.total+0.01) "unit price"
 FROM orders 
 JOIN accounts 
  ON orders.account_id = accounts.id 
   AND orders.standard_qty > 100
 JOIN sales_reps 
  ON accounts.sales_rep_id = sales_reps.id
 JOIN region 
  ON sales_reps.region_id = region.id

SELECT  region.name region_name,accounts.name account_name,orders.standard_qty
,  orders.poster_qty, orders.total_amt_usd/(orders.total+0.01) unit_price
 FROM orders 
 JOIN accounts 
  ON orders.account_id = accounts.id 
   AND orders.standard_qty > 100
   AND orders.poster_qty > 50
 JOIN sales_reps 
  ON accounts.sales_rep_id = sales_reps.id
 JOIN region 
  ON sales_reps.region_id = region.id
ORDER BY unit_price


6-SELECT  region.name region_name,accounts.name account_name,orders.standard_qty
,  orders.poster_qty, orders.total_amt_usd/(orders.total+0.01) unit_price
 FROM orders 
 JOIN accounts 
  ON orders.account_id = accounts.id 
   AND orders.standard_qty > 100
   AND orders.poster_qty > 50
 JOIN sales_reps 
  ON accounts.sales_rep_id = sales_reps.id
 JOIN region 
  ON sales_reps.region_id = region.id
ORDER BY unit_price DESC


7-SELECT DISTINCT accounts.name account_name,web_events.channel
 FROM web_events
 JOIN accounts
  ON web_events.account_id = accounts.id
   AND accounts.id = 1001


8-SELECT o.occurred_at,a.name,o.total,o.total_amt_usd
 FROM orders o
 JOIN accounts a
  ON o.account_id = a.id
  AND (occurred_at BETWEEN '2015-01-01' AND '2016-01-01')
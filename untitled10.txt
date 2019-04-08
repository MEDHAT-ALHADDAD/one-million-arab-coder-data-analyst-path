SELECT COALESCE(a.id,a.id) AS id,name,website,lat,long,primary_poc,sales_rep_id, COALESCE(o.account_id,a.id) account_id, COALESCE(o.standard_qty,'0') standard_qty, COALESCE(o.gloss_qty,0) gloss_qty, COALESCE(o.poster_qty,0) poster_qty,
COALESCE(o.total,0) total, COALESCE(o.standard_amt_usd,0) standard_amt_usd, 
COALESCE(o.gloss_amt_usd,0) gloss_amt_usd,
COALESCE(o.poster_amt_usd,0) poster_amt_usd,
COALESCE(o.total_amt_usd,0) total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;
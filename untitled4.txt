SELECT DISTINCT a.name account_name,r.name region_name
 FROM region r
 JOIN sales_reps s
  ON s.region_id = r.id
 JOIN accounts a
  ON a.sales_rep_id = s.id
ORDER BY a.name,r.name


SELECT DISTINCT s.name sales_rep_name,a.name region_name
 FROM region r
 JOIN sales_reps s
  ON s.region_id = r.id
 JOIN accounts a
  ON a.sales_rep_id = s.id
ORDER BY s.name,a.name



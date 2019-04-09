WITH t1 AS(SELECT a.name,LEFT(a.primary_poc,POSITION(' ' IN primary_poc)) FIRST_NAME, RIGHT
(a.primary_poc,LENGTH(a.primary_poc)-POSITION(' ' IN primary_poc)) LAST_NAME
FROM accounts a )
SELECT FIRST_NAME || '.' || LAST_NAME || '@' || name || '.com' E_MAIL
FROM t1


WITH t1 AS(SELECT a.name,LEFT(a.primary_poc,POSITION(' ' IN primary_poc))
 FIRST_NAME, RIGHT(a.primary_poc,LENGTH(a.primary_poc)-POSITION(' ' IN primary_poc)) LAST_NAME
FROM accounts a )
SELECT TRIM(BOTH ' ' FROM FIRST_NAME) || '.' || TRIM(BOTH ' ' FROM LAST_NAME) || '@' || name || '.com' E_MAIL
FROM t1



WITH t1 AS(SELECT a.name,LEFT(a.primary_poc,POSITION(' ' IN primary_poc)) 
FIRST_NAME, RIGHT(a.primary_poc,LENGTH(a.primary_poc)-POSITION(' ' IN primary_poc)) LAST_NAME
FROM accounts a )
SELECT (FIRST_NAME || ' ' || LAST_NAME ) AS NAME , LOWER(LEFT(FIRST_NAME,1)) ||
 LOWER(RIGHT(REPLACE(FIRST_NAME,' ',''),1)) || LOWER(LEFT(LAST_NAME,1)) ||
 LOWER(RIGHT(REPLACE(LAST_NAME,' ',''),1)) || LENGTH(FIRST_NAME)-1 || 
LENGTH(LAST_NAME) ||TRIM(BOTH ' ' FROM UPPER(name)) AS PASSWORD
FROM t1
select * from layoffss;


select MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffss;

select country, AVG(total_laid_off) AS total
from layoffss
group by country
order by total DESC
limit 10;

select * from layoffss
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

SELECT company, SUM(total_laid_off)
from layoffss
GROUP BY company
ORDER BY SUM(total_laid_off) DESC;


SELECT MIN(`date`), MAX(`DATE`)
FROM layoffss;


SELECT industry, SUM(total_laid_off)
from layoffss
GROUP BY industry
ORDER BY SUM(total_laid_off) DESC;



SELECT YEAR(`date`) , SUM(total_laid_off)
from layoffss
GROUP BY YEAR(`date`)
ORDER BY SUM(total_laid_off) DESC;

SELECT stage , SUM(total_laid_off)
from layoffss
GROUP BY stage
ORDER BY SUM(total_laid_off) DESC;

SELECT stage, percentage_laid_off, SUM(total_laid_off)
from layoffss
GROUP BY stage, percentage_laid_off
ORDER BY 2 DESC;

select stage, AVG(percentage_laid_off)
from layoffss
GROUP BY stage
ORDER BY 2 DESC;


SELECT substring(`date`,1, 7) AS MONTH_YEAR, SUM(total_laid_off)
FROM layoffss 
WHERE substring(`date`,1, 7) IS NOT NULL
group by MONTH_YEAR
ORDER BY MONTH_YEAR DESC;

WITH Rolling_Total AS
(
SELECT substring(`date`,1, 7) AS MONTH_YEAR, SUM(total_laid_off) AS total_laidoff
FROM layoffss 
WHERE substring(`date`,1, 7) IS NOT NULL
group by MONTH_YEAR
ORDER BY MONTH_YEAR DESC
)
SELECT MONTH_YEAR, total_laidoff
,SUM(total_laidoff) OVER(order by MONTH_YEAR) AS rolling_total
FROM Rolling_Total;


WITH ranking  (company, `year`, sum_laid_off) AS
(
SELECT company, YEAR(`date`) , SUM(total_laid_off)
from layoffss
GROUP BY YEAR(`date`), company
ORDER BY SUM(total_laid_off) DESC
), top_ranking AS
(
SELECT *, DENSE_RANK() 
OVER(PARTITION BY `year` ORDER BY sum_laid_off DESC) AS `rank`
FROM ranking
WHERE `year` IS NOT NULL)

SELECT * FROM top_ranking
where `rank` <= 5
;






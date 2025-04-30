select * from  layoffs;

CREATE TABLE layoffs_staging
LIKE layoffs;


INSERT INTO layoffs_staging
select * FROM layoffs;

select  *
FROM layoffs_staging
;

with duplicates AS (select  *, ROW_NUMBER() OVER(PARTITION BY company, location, 
industry, total_laid_off, percentage_laid_off, `date`, stage, 
country, funds_raised_millions) 
as row_namberr
FROM layoffs_staging) 
delete from duplicates
where row_namberr > 1
;


insert into layoffs_staging2
select  *, ROW_NUMBER() OVER(PARTITION BY company, location, 
industry, total_laid_off, percentage_laid_off, `date`, stage, 
country, funds_raised_millions) 
as row_namberr
FROM layoffs_staging;


delete from layoffs_staging2 
WHERE `row_number` > 1
;

select * from layoffs_staging2 
WHERE `row_number` > 1
;


select  distinct country
FROM layoffs_staging2
WHERE country LIKE "united states%"
;

update layoffs_staging2
set country = "united states"
WHERE country LIKE "united states%";


select distinct industry
FROM layoffs_staging2
WHERE industry LIKE "crypto%"
;

UPDATE layoffs_staging2 
set industry = "crypto"
WHERE industry LIKE "crypto%";

select * from layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`,"%m/%d/%Y");


alter TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;


UPDATE  layoffs_staging2
SET industry = null
WHERE industry = ''
;


select * 
from layoffs_staging2 as t1
join layoffs_staging2 as t2
	on t1.company = t2. company
where t1. industry IS NULL 
AND t2. industry IS NOT NULL;

Update layoffs_staging2 as t1
join layoffs_staging2 as t2
	on t1.company = t2. company
set t1. industry = t2. industry
where t1. industry is null
and t2. industry is not null;



DELETE from layoffs_staging2
WHERE total_laid_off is null
and percentage_laid_off is null;


alter TABLE layoffs_staging2
DROP COLUMN `row_number`;


select * from layoffs_staging2;







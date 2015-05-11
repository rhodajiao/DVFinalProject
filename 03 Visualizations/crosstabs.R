firstsector <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"select
CASE
WHEN grouping(continent) = 1 THEN \\\'zTotal\\\'
ELSE continent END as continent,
CASE WHEN grouping(rank1sector) = 1 THEN \\\'yTotal\\\'
ELSE rank1sector END as rank1sector, count(*) n
from continents c join gdpbreakdown g on(c.country=g.country) group by cube (continent, rank1sector)"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_rj6793', PASS='orcl_rj6793', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); filter(firstsector, RANK1SECTOR != "null") %>% spread( RANK1SECTOR, N)

stomach_mortality <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"SELECT country, continent, stomach_male_mortality, mortality_min, stomach_male_mortality - mortality_min as mortality_diff, mortality_rank FROM(SELECT c.country, continent, stomach_male_mortality, min(stomach_male_mortality) 
OVER (PARTITION BY continent) as MORTALITY_MIN, rank() 
OVER (PARTITION BY continent order by stomach_male_mortality desc) as MORTALITY_RANK 
FROM continents c join stomach_male_mortality cr on(c.country=cr.country) where year=\\\'2002\\\')"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_rj6793', PASS='orcl_rj6793', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(colon_mortality)


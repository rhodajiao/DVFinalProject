hditabs <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"select
CASE
WHEN grouping(continent) = 1 THEN \\\'Total\\\'
ELSE continent END as continent,
CASE WHEN grouping(hdicategory) = 1 THEN \\\'Total\\\'
ELSE hdicategory END as hdicategory, count(*) n
from continents c join hdi h on(c.country=h.country) group by cube (continent, hdicategory)"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_rj6793', PASS='orcl_rj6793', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))) 
hditabs <- filter(hditabs, HDICATEGORY != "null") 
hdiorder = c("Low", "Medium", "High", "VeryHigh", "Total")
hditabs$HDICATEGORY <- ordered(hditabs$HDICATEGORY, hdiorder)
hditabs %>% arrange() %>% spread(HDICATEGORY, N)

stomach_mortality <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"SELECT country, continent, stomach_male_mortality, mortality_min, stomach_male_mortality - mortality_min as mortality_diff, mortality_rank FROM(SELECT c.country, continent, stomach_male_mortality, min(stomach_male_mortality) 
OVER (PARTITION BY continent) as MORTALITY_MIN, rank() 
OVER (PARTITION BY continent order by stomach_male_mortality desc) as MORTALITY_RANK 
FROM continents c join stomach_male_mortality cr on(c.country=cr.country) where year=\\\'2002\\\')"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_rj6793', PASS='orcl_rj6793', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(stomach_mortality)

minlifeexpectancy <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"SELECT country, year, life_expectancy as min_life_expectancy FROM (SELECT country, year, life_expectancy, min(life_expectancy) OVER(PARTITION BY country) AS min_life_expectancy FROM life_expectancy) WHERE life_expectancy = min_life_expectancy ORDER BY 2,3"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_rj6793', PASS='orcl_rj6793', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(minlifeexpectancy)

minlifeexpectancy1 <- minlifeexpectancy %>% filter(YEAR > 1955) %>% mutate(label = COUNTRY)
minlifeexpectancy2 <- minlifeexpectancy %>% filter(YEAR <= 1955) %>% mutate(label = NULL) 
minlifeexpectancy <- bind_rows(minlifeexpectancy1, minlifeexpectancy2)

print(ggplot(minlifeexpectancy, aes(x=YEAR, y=MIN_LIFE_EXPECTANCY)) + geom_point() + geom_text(label=minlifeexpectancy$label, angle = 45, size = 4, hjust = 0, vjust = 0) + ylim(15,90) + xlim(1950,2015) + ggtitle("Minimum Life Expectancy By Country (1950-2013)") + labs(x="Year", y="Minimum Life Expectancy (Years)"))

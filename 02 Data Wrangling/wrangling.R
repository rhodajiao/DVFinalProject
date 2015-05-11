aggData <- merge(breast_female_mortality, breast_female_incidence, by=c("COUNTRY", "YEAR")) %>% merge(cervix_female_mortality, by=c("COUNTRY", "YEAR")) %>% merge(cervix_female_incidence, by=c("COUNTRY", "YEAR")) %>% merge(colon_female_mortality, by=c("COUNTRY", "YEAR")) %>% merge(colon_female_incidence, by=c("COUNTRY", "YEAR")) %>% merge(colon_male_mortality, by=c("COUNTRY", "YEAR")) %>% merge(colon_male_incidence, by=c("COUNTRY", "YEAR")) %>% merge(liver_female_mortality, by=c("COUNTRY", "YEAR")) %>% merge(liver_female_incidence, by=c("COUNTRY", "YEAR")) %>% merge(liver_male_mortality, by=c("COUNTRY", "YEAR")) %>% merge(liver_male_incidence, by=c("COUNTRY", "YEAR")) %>% merge(lung_female_mortality, by=c("COUNTRY", "YEAR")) %>% merge(lung_female_incidence, by=c("COUNTRY", "YEAR")) %>% merge(lung_male_mortality, by=c("COUNTRY", "YEAR")) %>% merge(lung_male_incidence, by=c("COUNTRY", "YEAR")) %>% merge(prostate_male_mortality, by=c("COUNTRY", "YEAR")) %>% merge(prostate_male_incidence, by=c("COUNTRY", "YEAR")) %>% merge(stomach_female_mortality, by=c("COUNTRY", "YEAR")) %>% merge(stomach_female_incidence, by=c("COUNTRY", "YEAR")) %>% merge(stomach_male_mortality, by=c("COUNTRY", "YEAR")) %>% merge(stomach_male_incidence, by=c("COUNTRY", "YEAR")) %>% merge(life_expectancy, by=c("COUNTRY", "YEAR")) %>% merge(gdpbreakdown, by=c("COUNTRY")) %>% merge(hdi, by=c("COUNTRY")) %>% merge(continents,by=c("COUNTRY"))
print(tbl_df(aggData))

# Get the ratio of male to female liver cancer mortalities across all countries
MaleFemaleLiverMortalityPlotTEMP <- left_join(liver_female_mortality,liver_male_mortality,by="COUNTRY") %>% filter(YEAR.x==2002 & YEAR.y==2002) %>% mutate(LIVER_MALE_MORTALITY/LIVER_FEMALE_MORTALITY)
MaleFemaleLiverMortalityPlot <- left_join(continents,MaleFemaleLiverMortalityPlotTEMP,by="COUNTRY") %>% filter(!is.na(LIVER_MALE_MORTALITY/LIVER_FEMALE_MORTALITY))

# Get the ratio of male to female lung cancer mortalities across all countries
MaleFemaleLungMortalityPlotTEMP <- left_join(lung_female_mortality,lung_male_mortality,by="COUNTRY") %>% filter(YEAR.x==2002 & YEAR.y==2002) %>% mutate(LUNG_MALE_MORTALITY/LUNG_FEMALE_MORTALITY)
MaleFemaleLungMortalityPlot <- left_join(continents,MaleFemaleLungMortalityPlotTEMP,by="COUNTRY") %>% filter(!is.na(LUNG_MALE_MORTALITY/LUNG_FEMALE_MORTALITY))

# Get the ratio of male to female colon cancer mortalities across all countries
MaleFemaleColonMortalityPlotTEMP <- left_join(colon_female_mortality,colon_male_mortality,by="COUNTRY") %>% filter(YEAR.x==2002 & YEAR.y==2002) %>% mutate(COLON_MALE_MORTALITY/COLON_FEMALE_MORTALITY)
MaleFemaleColonMortalityPlot <- left_join(continents,MaleFemaleColonMortalityPlotTEMP,by="COUNTRY") %>% filter(!is.na(COLON_MALE_MORTALITY/COLON_FEMALE_MORTALITY))

aggDataFiltered <- aggData %>% arrange(HDINUMBER)

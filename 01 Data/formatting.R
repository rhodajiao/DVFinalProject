
file_path <- "indicator life_expectancy_at_birth.xlsx"
df <- read.xlsx(file_path, sheetName = "Data", stringsAsFactors = FALSE, check.names = F)

names(df) <- gsub(" ", "_", names(df)) 
names(df) <- gsub("&", "and", names(df))
g = ncol(df)
temp <- gather(df, "Year", "n", 2:g) %>% filter(n > 0)
colnames(temp) <- c("Country", "Year", names(df)[1])

temp <- temp %>% transform(Year, as.integer(Year))

write.csv(temp, paste(gsub(".xlsx", "", file_path), " reformatted.csv", sep=""), row.names=FALSE, na = "")


tableName <- names(df)[1]
sql <- paste("CREATE TABLE", tableName, "(COUNTRY varchar2(4000), YEAR number(38,4), ", tableName, "number(38,4));")  
cat(sql)

print("These three visualizations show scatterplots of the male to female mortality of specific types of cancer. Each is facet wrapped by continent.")
print(ggplot(MaleFemaleLiverMortalityPlot, aes(x=COUNTRY,y=LIVER_MALE_MORTALITY/LIVER_FEMALE_MORTALITY))+geom_point()+ facet_wrap(~CONTINENT)+theme(axis.text.x=element_blank())+ylab('Ratio of Male/Female Liver Cancer Deaths Per 100,000 People')+scale_y_continuous(breaks=seq(0,8,1))+ggtitle('Male to Female Liver Cancer Deaths Across the World'))

print(ggplot(MaleFemaleLungMortalityPlot, aes(x=COUNTRY,y=LUNG_MALE_MORTALITY/LUNG_FEMALE_MORTALITY))+geom_point()+ facet_wrap(~CONTINENT)+theme(axis.text.x=element_blank())+ylab('Ratio of Male/Female Lung Cancer Deaths Per 100,000 People')+scale_y_continuous(breaks=seq(0,30,1))+ggtitle('Male to Female Lung Cancer Deaths Across the World'))

print(ggplot(MaleFemaleColonMortalityPlot, aes(x=COUNTRY,y=COLON_MALE_MORTALITY/COLON_FEMALE_MORTALITY))+geom_point()+ facet_wrap(~CONTINENT)+theme(axis.text.x=element_blank())+ylab('Ratio of Male/Female Colon Cancer Deaths Per 100,000 People')+scale_y_continuous(breaks=seq(0,4,1))+ggtitle('Male to Female Colon Cancer Deaths Across the World'))
print("")

print("The following three visualizations are based on a data frame derived from the joined cancer data set that was reshaped so that the data were grouped by country and type with values of mortality and incidence. The visualizations show mortality (deaths per 100,000 people), incidence (new cases per 100,000 people), and the mortality / incidence ratio respectively, facet wrapped for type of cancer. These variables were scaled by HDI number.")
print(ggplot(MortalIncidence, aes(x=HDI_NUMBER, y=Mortality, color=CONTINENT)) + geom_point(aes(size=LIFE_EXPECTANCY)) + scale_size_continuous(range=c(2,1)) + facet_wrap(~TYPE) + ggtitle("Mortality by HDI Level (2002)") + labs(x="HDI Number", y="Mortality (per 100,000 people)") +theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))) 

print(ggplot(MortalIncidence, aes(x=HDI_NUMBER, y=Incidence, color=CONTINENT)) + geom_point(aes(size=LIFE_EXPECTANCY)) + scale_size_continuous(range=c(2,1)) + facet_wrap(~TYPE) + ggtitle("Incidence by HDI Level (2002)") + labs(x="HDI Number", y="Incidence (per 100,000 people)") +theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))) 

print(ggplot(MortalIncidence, aes(x=Incidence, y=Mortality, color=HDI_NUMBER)) + geom_point(aes(size=LIFE_EXPECTANCY)) + scale_size_continuous(range=c(2,1)) + facet_wrap(~TYPE) + xlim(0,125) + ylim(0,100) + ggtitle("Mortality to Incidence Ratio by HDI Level (2002)") + labs(x="Incidence (per 100,000 people)", y="Mortality (per 100,000 people)"))

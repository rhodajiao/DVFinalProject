print(ggplot(MaleFemaleLiverMortalityPlot, aes(x=COUNTRY,y=LIVER_MALE_MORTALITY/LIVER_FEMALE_MORTALITY))+geom_point()+ facet_wrap(~CONTINENT)+theme(axis.text.x=element_blank())+ylab('Ratio of Male to Female Liver Cancer Deaths Per 100,000 People')+scale_y_continuous(breaks=seq(0,8,1)))

print(ggplot(MaleFemaleLungMortalityPlot, aes(x=COUNTRY,y=LUNG_MALE_MORTALITY/LUNG_FEMALE_MORTALITY))+geom_point()+ facet_wrap(~CONTINENT)+theme(axis.text.x=element_blank())+ylab('Ratio of Male to Female Lung Cancer Deaths Per 100,000 People')+scale_y_continuous(breaks=seq(0,30,1)))

print(ggplot(MaleFemaleColonMortalityPlot, aes(x=COUNTRY,y=COLON_MALE_MORTALITY/COLON_FEMALE_MORTALITY))+geom_point()+ facet_wrap(~CONTINENT)+theme(axis.text.x=element_blank())+ylab('Ratio of Male to Female Colon Cancer Deaths Per 100,000 People')+scale_y_continuous(breaks=seq(0,4,1)))



# Male Rates
print(ggplot(aggData, aes(x=HDINUMBER,y=LIVER_MALE_MORTALITY,color=CONTINENT))+geom_point()+theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))+ylab('Male Liver Cancer Mortality per 100,000 people'))

print(ggplot(aggData, aes(x=HDINUMBER,y=COLON_MALE_MORTALITY,color=CONTINENT))+geom_point()+theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))+ylab('Male Colon Cancer Mortality per 100,000 people'))

print(ggplot(aggData, aes(x=HDINUMBER,y=LUNG_MALE_MORTALITY,color=CONTINENT))+geom_point()+theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))+ylab('Male Lung Cancer Mortality per 100,000 people'))

print(ggplot(aggData, aes(x=HDINUMBER,y=PROSTATE_MALE_MORTALITY,color=CONTINENT))+geom_point()+theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))+ylab('Male Prostate Cancer Mortality per 100,000 people'))

print(ggplot(aggData, aes(x=HDINUMBER,y=STOMACH_MALE_MORTALITY,color=CONTINENT))+geom_point()+theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))+ylab('Male Stomach Cancer Mortality per 100,000 people'))


# Female Rates
print(ggplot(aggData, aes(x=HDINUMBER,y=BREAST_FEMALE_MORTALITY,color=CONTINENT))+geom_point()+theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))+ylab('Female Breast Cancer Mortality per 100,000 people'))

print(ggplot(aggData, aes(x=HDINUMBER,y=CERVIX_FEMALE_MORTALITY,color=CONTINENT))+geom_point()+theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))+ylab('Female Cervix Cancer Mortality per 100,000 people'))

print(ggplot(aggData, aes(x=HDINUMBER,y=LIVER_FEMALE_MORTALITY,color=CONTINENT))+geom_point()+theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))+ylab('Female Liver Cancer Mortality per 100,000 people'))

print(ggplot(aggData, aes(x=HDINUMBER,y=COLON_FEMALE_MORTALITY,color=CONTINENT))+geom_point()+theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))+ylab('Female Colon Cancer Mortality per 100,000 people'))

print(ggplot(aggData, aes(x=HDINUMBER,y=LUNG_FEMALE_MORTALITY,color=CONTINENT))+geom_point()+theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))+ylab('Female Lung Cancer Mortality per 100,000 people'))

print(ggplot(aggData, aes(x=HDINUMBER,y=STOMACH_FEMALE_MORTALITY,color=CONTINENT))+geom_point()+theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))+ylab('Female Stomach Cancer Mortality per 100,000 people'))
#TEST DREES
# OBTENTION DE LA BASE
library(readxl)
apa2017 <- read_excel("C:/Users/loric/Downloads/beneficiaires-apa-a-domicile-base-floutee-v1.xlsx")
attach(apa2017)
#voir la base
dim(apa2017)
str(apa2017)
summary(AGE_FLOU)
summary(GIRFIN_APA)
table(GIRFIN_APA)
round(prop.table(table(GIRFIN_APA)) * 100, 2)
table(SEXE)
round(prop.table(table(SEXE)) * 100, 2)

#1

agemoyen_gir1 <- weighted.mean(
  apa2017$AGE_FLOU[apa2017$GIRFIN_APA == 1],
  apa2017$POIDS_P[apa2017$GIRFIN_APA == 1],
  na.rm = TRUE
)

agemoyen_gir1
#2
agemoyen_gir2 <- weighted.mean(
  apa2017$AGE_FLOU[apa2017$GIRFIN_APA == 2],
  apa2017$POIDS_P[apa2017$GIRFIN_APA == 2],
  na.rm = TRUE
)

agemoyen_gir2

#3
library(dplyr)
###gir1
apa2017 %>%
  filter(GIRFIN_APA == 1) %>%
  group_by(SEXE) %>%
  summarise(
    age_moyen = weighted.mean(AGE_FLOU, POIDS_P, na.rm = TRUE)
  )
###gir2
apa2017 %>%
  filter(GIRFIN_APA == 2) %>%
  group_by(SEXE) %>%
  summarise(
    age_moyen = weighted.mean(AGE_FLOU, POIDS_P, na.rm = TRUE)
  )
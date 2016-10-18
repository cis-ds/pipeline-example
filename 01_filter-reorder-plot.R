library(tidyverse)
library(forcats)
library(feather)

# FYI: there is one call to plyr::revalue() so plyr should be installed but not
# loaded

lotr_dat <- read_tsv("data/lotr_raw.tsv")


# clean the data

## reorder Film factor levels based on story
## revalue Race
## - no one knows that the Ainur are the wizards: Ainur --> Wizard
## - let's be consistent: Men --> Man
## drop least frequent Races
## reorder Race based on words spoken
## arrange the data on Race, Film, Words
lotr_dat <- lotr_dat %>%
  mutate(Film = factor(Film),
         Race = plyr::revalue(Race, c(Ainur = "Wizard", Men = "Man"))) %>%
  filter(!(Race %in% c("Gollum", "Ent", "Dead", "Nazgul"))) %>%
  mutate(Race = fct_reorder(Race, Words, fun = sum)) %>%
  arrange(Race, Film, Words) %>%
  droplevels()

# make a plot
p <- ggplot(lotr_dat, aes(x = Race, weight = Words)) +
  geom_bar()
ggsave("graphics/barchart_total-words-by-race.png", p)

# write data to file
write_feather(lotr_dat, "data/lotr_clean.feather")

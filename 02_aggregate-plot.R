library(tidyverse)
library(feather)
library(stringr)

lotr_dat <- read_feather("data/lotr_clean.feather")

# plot character word frequency, by race for each movie
p <- ggplot(lotr_dat, aes(x = Race, y = Words)) +
  facet_wrap(~ Film) +
  scale_y_log10() +
  ggtitle("The Lord of the Rings") + 
  geom_jitter(alpha = 1/2, position = position_jitter(width = 0.1))
ggsave("graphics/lotr-stripplot.png", p)

# write the total words by Race for each Film to file
lotr_dat %>%
  group_by(Film, Race) %>%
  summarize(total_words = sum(Words)) %>%
  write_feather("data/total-words-by-film-race.feather")

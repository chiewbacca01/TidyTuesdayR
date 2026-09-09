# load packages and data-------------------------------------------------
library(tidyverse)
library(tidytuesdayR)
library(ggplot2)

tuesdata <- tidytuesdayR::tt_load('2026-09-08')
cafe <- tuesdata$cafe
cappuccino_index <- tuesdata$cappuccino_index

colSums(is.na(cafe))

# Define colours and fonts-------------------------------------------------

bg_col <- "#f5eee7"
text_col <- "#341b06"


# graph 1 - cappuccino index-------------------------------------------------
p <- cappuccino_index |> 
  ggplot(mapping=aes(x=index,y=desc(country), size=n))+
  geom_point(alpha=0.6, colour="brown")+
  geom_text(aes(label=ifelse(n>100 | index > 150, country,"")),
            color="#341b06",
            size = 3,
            fontface = "bold") +
  scale_size(range = c(.1, 24), name="No. of cafes")+
  labs(
    title="Bubble Plot of Cappuccino Index",
    subtitle = "Size of bubble indicates number of cafes",
    x = "Index",
    caption = "The Cappuccino Index. James Hoffmann. YouTube."
  )+
  theme(
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    axis.title.y = element_blank(),
    plot.background = element_rect(fill = bg_col, colour = bg_col),
    panel.background = element_rect(fill = bg_col, colour = bg_col),
    legend.position = "none"
  )

# save plot ---------------------------------------------------------------

ggsave(
  plot = p,
  filename = "coffee.jpeg")

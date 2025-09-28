library(hexSticker)
library(ggplot2)
library(showtext)
font_add_google("Funnel Sans", "noto")

showtext_auto()

set.seed(62)
x <- 1:7
y <- c(3, 4, 6, 5, 7, 9, 8)
df <- data.frame(x = x, y = y)

blue_color <- "#2780e3"
white_color <- "#e5e9f0"
orange_color <- "#f0ad4e"
gray_color <- "#495057"

max_point <- df[which.max(df$y), ]

p <- ggplot(df, aes(x = x, y = y)) +
  geom_vline(
    xintercept = max_point$x,
    color = gray_color,
    linetype = "dashed",
    size = 0.25
  ) +
  geom_smooth(
    se = FALSE, method = "loess",
    span = 0.6,
    color = blue_color,
    lineend = "round"
  ) +
  geom_point(data = max_point, aes(x = x, y = y), color = orange_color) +
  theme_void() +
  theme_transparent()

sticker(
  p,
  package = "Ford Johnson",
  p_size = 12,
  p_y = 1.5,
  p_color = blue_color,
  p_family = "noto",
  s_x = 1,
  s_y = 0.9,
  s_width = 1.3,
  s_height = 1.1,
  h_fill = white_color,
  h_color = blue_color,
  filename = "images/logo/logo.png"
)

sticker(
  p,
  package = "Ford Johnson",
  p_size = 3,
  p_y = 1.5,
  p_color = blue_color,
  p_family = "noto",
  s_x = 1,
  s_y = 0.85,
  s_width = 1.1,
  s_height = 0.9,
  h_fill = white_color,
  h_color = blue_color,
  filename = "images/logo/favicon.png",
  dpi = 72,
  width = 1,
  height = 1
)

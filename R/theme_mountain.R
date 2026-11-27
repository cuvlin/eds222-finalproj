library(ggplot2)

# ---- Mountain palette (3 colors, easy to tell apart, colorblind-safe) ----
mountain_cols <- c(
  "#2F5D50",  # pine green
  "#D08C2E",  # aspen gold
  "#4A6FA5"   # alpine lake blue
)
granite <- "#4B4F54"   # dark gray for text and regression lines
snow    <- "#F7F7F4"   # off-white background
ridge   <- "#DADDD8"   # light gray gridlines

# ---- Theme ----
theme_mountain <- function(base_size = 12) {
  theme_minimal(base_size = base_size) +
    theme(
      plot.background  = element_rect(fill = snow, colour = NA),
      panel.background = element_rect(fill = snow, colour = NA),
      panel.grid.major = element_line(colour = ridge, linewidth = 0.4),
      panel.grid.minor = element_blank(),
      text             = element_text(colour = granite),
      axis.text        = element_text(colour = granite),
      plot.title       = element_text(face = "bold", size = rel(1.2)),
      legend.position  = "bottom",
      legend.title     = element_text(face = "bold")
    )
}
theme_set(theme_mountain())

# ---- Default colors for categories (up to 3) ----
options(
  ggplot2.discrete.colour = mountain_cols,
  ggplot2.discrete.fill   = mountain_cols
)

# ---- Default look for points and regression lines ----
update_geom_defaults("point",  list(colour = mountain_cols[1], size = 2, alpha = 0.7))
update_geom_defaults("smooth", list(colour = granite, fill = "#A9B4C2", linewidth = 1))
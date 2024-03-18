# Start recording ---------------------------------------------------------

library(camcorder)
gg_record(
  dir = "recording",
  device = "png",
  width = 2,
  height = 4,
  units = "in",
  dpi = 300
)


# Plot --------------------------------------------------------------------

ggplot(data = plot_data) +
  geom_point(
    mapping = aes(x = date, y = year, size = n),
    colour = highlight_col,
    fill = alpha(highlight_col, 0.5),
    pch = 21
  ) +
  facet_wrap(~location, ncol = 1) +
  scale_y_reverse(breaks = min(plot_data$year):max(plot_data$year)) +
  scale_size_area(max_size = 3) +
  guides(size = guide_legend(
    title.position = "top",
    title.hjust = 0.5,
    title = "Number of events")
  ) +
  labs(
    title = title,
    subtitle = st,
    caption = cap
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.margin = margin(5, 5, 5, 15),
    plot.background = element_rect(fill = bg_col, colour = bg_col),
    panel.background = element_rect(fill = bg_col, colour = bg_col),
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),
    panel.grid.major.x = element_line(
      colour = highlight_col,
      linewidth = 0.3
    ),
    strip.text = element_text(
      family = title_font,
      size = rel(1.2)
    ),
    axis.title = element_blank(),
    plot.title = element_textbox_simple(
      colour = text_col,
      size = rel(2),
      margin = margin(b = 10, t = 10),
      lineheight = 0.5,
      family = title_font
    ),
    plot.subtitle = element_textbox_simple(
      colour = text_col,
      margin = margin(b = 10, t = 0),
      lineheight = 0.5
    ),
    plot.caption = element_textbox_simple(
      colour = text_col,
      margin = margin(b = 10, t = 5),
      lineheight = 0.5
    ),
    plot.title.position = "plot",
    plot.caption.position = "plot",
    legend.position = "bottom",
    legend.justification.bottom = "right"
  )

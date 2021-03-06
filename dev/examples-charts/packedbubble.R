data(gapminder, package = "gapminder")

gapminder <- subset(gapminder, year == max(year))

hc <- hchart(gapminder, "packedbubble", hcaes(name = country, value = pop, group = continent))

hc

q95 <- as.numeric(quantile(gapminder$pop, .95))

hc %>% 
  hc_tooltip(
    useHTML = TRUE,
    pointFormat = "<b>{point.name}:</b> {point.value}"
  ) %>% 
  hc_plotOptions(
    packedbubble = list(
      maxSize = "150%",
      zMin = 0,
      dataLabels = list(
        enabled = TRUE,
        format = "{point.name}",
        filter = list(
          property = "y",
          operator = ">",
          value = q95
        ),
        style = list(
          color = "black",
          textOutline = "none",
          fontWeight = "normal"
        )
      )
    )
  )


hc %>% 
  hc_tooltip(
    useHTML = TRUE,
    pointFormat = "<b>{point.name}:</b> {point.value}"
  ) %>% 
  hc_plotOptions(
    packedbubble = list(
      maxSize = "150%",
      zMin = 0,
      layoutAlgorithm = list(
        gravitationalConstant =  0.05,
        splitSeries =  TRUE,
        seriesInteraction = TRUE,
        dragBetweenSeries = TRUE,
        parentNodeLimit = TRUE
      ),
      dataLabels = list(
        enabled = TRUE,
        format = "{point.name}",
        filter = list(
          property = "y",
          operator = ">",
          value = q95
        ),
        style = list(
          color = "black",
          textOutline = "none",
          fontWeight = "normal"
        )
      )
    )
  )
  

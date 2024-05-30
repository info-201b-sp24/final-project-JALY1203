library(tidyverse)
library(shiny)
library(ggplot2)
library(plotly)
library(data.table)

team_summary_wl <- read.csv("Team Summaries.csv")
team_total_stats <- read.csv("Team Totals.csv")

server <- function(input, output) {
  
  
# plot 1
  output$plot_1 <- renderPlotly({
    x3pa_fga_ratio <- team_total_stats %>%
      filter(season %inrange% input$season_range) %>%
      select(season, x3pa, fga) %>%
        group_by(season) %>%
        summarise(x3pa_total = sum(x3pa, na.rm = TRUE), 
                  fga_total = sum(fga, na.rm = TRUE))%>%
        mutate(ratio = x3pa_total / fga_total)
    
    
    plot_1 <- ggplot(data = x3pa_fga_ratio) + 
      geom_col(aes(x = season, y = ratio)) + 
      labs(title = "3 Point to Field Goal Attempt Ratio", x = "Season", y = "3PA/FGA")
    
    plotly_1 <- ggplotly(plot_1)
    
    return(plotly_1)
  })
  
  
# Plot 2
  output$plot_2 <- renderPlotly({
    pf_total <- team_total_stats %>%
      filter(season %inrange% input$season_range) %>%
      group_by(season) %>%
      summarise(pf = sum(pf, na.rm = TRUE))
    
    plot_2 <- ggplot(data = pf_total) + 
      geom_col(aes(x = season, y = pf)) + 
      labs(title = "Personal Fouls Throughout the Years", x = "Season", y = "Personal Fouls")
    
    plotly_2 <- ggplotly(plot_2)
    
    return(plotly_2)
    
  })
  
  
# Plot 3
  output$plot_3 <- renderPlotly({
  
    wins_1980_1999 <- team_summary_wl %>%
      filter(season >= 1980 & season <= 1999) %>%
      group_by(team) %>%
      summarise(w = sum(w)) %>%
      mutate(Period = "1980-1999") %>%
      filter(w == max(w))
    
    wins_2000_2019 <- team_summary_wl %>%
      filter(season >= 2000 & season <= 2019) %>%
      group_by(team) %>%
      summarise(w = sum(w)) %>%
      mutate(Period = "2000-2019") %>%
      filter(w == max(w))
    
    combined_wins <- bind_rows(wins_1980_1999, wins_2000_2019)
    combined_wins <-  combined_wins %>% 
      filter(Period %in% input$era)
    
    plot_3 <- ggplot(data = combined_wins) +
      geom_col(aes(x = team, y = w, color = Period)) + 
      labs(title = "Best Teams of Each Era", x = "Team", y = "Wins", color = "Era") 
    plotly_3 <- ggplotly(plot_3)
    
    return(plotly_3)
  })
}
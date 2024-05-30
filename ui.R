library(shiny)
library(ggplot2)
library(plotly)
library(data.table)


# Introduction tab
intro_tab <- tabPanel(
  "Introduction",
  fluidPage(
    tags$img(src = "https://logohistory.net/wp-content/uploads/2023/07/Logo-NBA.png", height=240, width=380),

    tags$h3("Introduction"),

    tags$p("Basketball, especially in the NBA, has gone through many significant transformations since the beginning. These changes include many things like strategy, rules changes, players roles, advancements, and more. The main thing that I want to identify is what changes occurred and how they affected the current NBA. This question is the main motivation for the entire project and it aims to highlight the old and current trends in basketball in the NBA. As with any game, knowing how the game has changed is incredibly important and necessary for analyzing who the best teams/players really are. Some of the questions that I aim to answer in this project is how 3 point shooting has changed throughout the years? Have personal fouls gone up or down? And what teams were most dominant in their respective eras?"),
    
    tags$h3("The Dataset"),
    tags$p("Rodney Carroll created these data sets, and the statistics were pulled and aggregated into different CSVs from Basketball Reference in order to record various seasonal stats and accolades of both players and teams."),
    

    tags$h3("Links to the Data sets"),
    tags$p("- ", HTML('<a class="link" href="https://www.kaggle.com/datasets/rodneycarroll78/nba-stats-1980-2024?select=Team+Summaries.csv">TEAM SUMMARY</a>')),
    tags$p("- ", HTML('<a class="link" href="https://www.kaggle.com/datasets/rodneycarroll78/nba-stats-1980-2024?select=Team+Totals.csv">TEAM TOTAL</a>')),


    tags$h3("How many observations (rows) are in the data?"),
    tags$p("- 1254 (TEAM SUMMARY)"),
    tags$p("- 1845 (TEAM TOTAL)"),

    tags$h3("How many features (columns) are in the data?"),
    tags$p("- 29 (TEAM SUMMARY)"),
    tags$p("- 28 (TEAM TOTAL)"),
    
    tags$h3("Ethical Questions of the Data Set"),
    tags$p("It is important to note that while data is objective, what one individual gets from the data changes from person to person, so while I might say something about the data, whatever I say should be taken at base value and deliberation on one's own part should be taken."),
    
    tags$h3("Limitations of the Data Set"),
    tags$p("Although Basketball Reference is a relatively straightforward and trusted source for basketball information and statistics, it still is not technically an official source of all NBA statistics. You could get the data straight from the NBA, but there are a lot of hidden stats that Basketball Reference includes in their data set. Not to mention that the data set that I am using is not actually straight from Basketball reference, but rather it is aggregated by a different individual to be more compact and usable in the CSV format. ")
  ),
)

# chart 1
chart_tab1 <- tabPanel(
  "3 Point Attempts to Field Goal Attempts",
  fluidPage(
    sidebarLayout(
      sliderInput(
        inputId = "season_range",
        label = "Season:",
        value = c(1980, 2022),
        min = 1980,
        max = 2022,
        step = 1
      ),
      plotlyOutput(outputId = "plot_1")),
    p("This chart shows the ratio of total 3 point attempts to total field goal attempts made seasonally from the years 1980 to 2022. You can see how the graph has a slow climb at the beginning but skyrockets roughly 2010 to 2016. And in spite of the rule change in 1995, which shortened the 3 point line (which they changed back soon after), 3 point shooting only really became prevalent well into the 2000s.")
  )
)


# chart 2
chart_tab2 <- tabPanel(
  "Personal Fouls",
  fluidPage(
    sidebarLayout(
      sliderInput(
        inputId = "season_range",
        label = "Season:",
        value = c(1980, 2022),
        min = 1980,
        max = 2022,
        step = 1
      ),
      plotlyOutput(outputId = "plot_2")),
    p("This bar chart shows the total amount personal fouls gotten by all players during the season. This statistic is important to look at because NBA discussion will often include the amount of personal fouls as reference to how physical the league was in the past versus now. In more recent years, there seems to have been a decrease in personal fouls, however overall, the league still seems to be pretty consistent in the amount of foul calls.")
  )
)

# Chart 3
chart_tab3 <- tabPanel(
  "Best Team of Each Era",
  fluidPage(
    sidebarLayout(
      selectInput(
        inputId = "era",
        label = "Era:",
        choices = c("1980-1999", "2000-2019"),
        selected = "1980-1999",
        multiple = TRUE),
      plotlyOutput(outputId = "plot_3")),
    p("This bar chart shows the two most compared eras in NBA history and how their most dominant teams in terms of wins compare to each other. In the 1980s to 1999, you can see how the Lakers had the most wins throughout that time, however, looking at 2000 - 2019, you notice that The Spurs actually edge out the Lakers by a small margin in terms of wins. This is not to say the the Lakers during the 80s and 90s are worse than the Spurs from the 2000s, because in the end, there is no way of knowing which era would beat the other unless they played each other in their primes.")
  )
)

# Conclusion tab
conclusion_tab <- tabPanel(
  "Conclusion",
  fluidPage(
    tags$img(src = "https://library.sportingnews.com/styles/crop_style_16_9_desktop_webp/s3/2022-10/FS16eiQWUAEjea_.jpg.webp"),
    tags$h3("Three Point Attempts to Field Goal Attempts"),
    tags$p("For Three point attempts, I had originally looked at the amount of attempted 3 pointers only, but after deliberation decided to look at the ratio of 3 point attempts to total field goal attempts. In the first chart, you can see how the ratio increased rather slowly at first from 1980 until 1995, where the NBA moved the 3 point line closer, causing a short jump in 3 point attempts until teams went back to their normal mid range game. From then on the ratio again was increasing quite slowly until about 2013 where 3 point shooting started becoming much more prevalent."),
    
    tags$h3("Personal Fouls"),
    tags$p("In terms of personal fouls, the statistic all throughout was actually quite consistent without too many huge jumps. In my opinion, it is hard to get a good read on what actually is happening with this statistic since when rules change, people do too, which keeps things relatively consistent. However, some points on the graph corroborate some rule changes, like the peak in 2005-2006, when hand checking became illegal, or in 2002, where zone defense was legalized, making the game slower, and more lenient of personal fouls."),
    
    tags$h3("Best Team of Each Era"),
    tags$p("For the last chart, I calculated which teams had the most wins during the 1980-1999 era, and the 2000-2019 era. It was relatively straightforward and displayed the most dominant teams of each respective era. In the 80s and 90s, the Lakers dominated with the highest number of wins, this definitely makes sense as the Lakers had some of the best players during this period with players like Shaq, Magic, James Worthy, and more. The Spurs topped the charts for most wins in the league from 2000-2019 despite having not won recently (I believe in Wembenyama). Popovich as coach in combination with players like Tim Duncan and later on, Kawhi Leonard were key in their success."),
    
    tags$h3("Insights and Broader Implication"),
    tags$p("While I might not have conveyed any new information with this, I think that confirming and being able to research and understand the changes that happened in the league helped me enjoy basketball more seeing as there are so many things beyond the game. The 3 point shooting bit was especially insightful because while I am still a relatively casual viewer that only started watching around 2 years ago, learning how the game was in the past era and how 3 point shooting actually changed the game into what it is today really helps increase my depth in knowledge of the game overall. In terms of broader implications, with how much 3 point shooting is done in modern basketball, who knows what could come next? I don’t think that the league will attempt to restrict it, but rather might look towards a 4 point line to further encourage long range shooters. This has been in debate for a while, but nothing has happened yet.")
    
  )
)


# Full UI
ui <- navbarPage(
  "How the NBA has Changed Over the Years",
  intro_tab,
  chart_tab1,
  chart_tab2,
  chart_tab3,
  conclusion_tab
)


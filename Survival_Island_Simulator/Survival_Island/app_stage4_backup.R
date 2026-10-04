# ============================================
# 🏝️ SURVIVAL ISLAND SIMULATOR
# SHINY GAME APP - STAGE 4
# ============================================

library(shiny)


# ============================================
# USER INTERFACE
# ============================================

ui <- fluidPage(
  
  # ==========================================
  # CUSTOM CSS
  # ==========================================
  
  tags$head(
    
    tags$style(HTML("

      body {
        background-color: #eef4f1;
        font-family: Arial, sans-serif;
      }

      .main-title {
        background: linear-gradient(135deg, #164a3a, #26745a);
        color: white;
        padding: 25px;
        border-radius: 15px;
        text-align: center;
        margin-bottom: 20px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
      }

      .main-title h1 {
        margin: 0;
        font-size: 38px;
        font-weight: bold;
      }

      .main-title p {
        margin-top: 10px;
        font-size: 17px;
      }

      .panel-box {
        background: white;
        border-radius: 15px;
        padding: 20px;
        margin-bottom: 20px;
        box-shadow: 0 3px 10px rgba(0,0,0,0.10);
      }

      .stat-card {
        background: white;
        border-radius: 15px;
        padding: 20px;
        margin-bottom: 20px;
        text-align: center;
        box-shadow: 0 3px 10px rgba(0,0,0,0.10);
      }

      .stat-title {
        font-size: 17px;
        font-weight: bold;
        margin-bottom: 10px;
      }

      .stat-number {
        font-size: 30px;
        font-weight: bold;
      }

      .resource-card {
        background: white;
        border-radius: 15px;
        padding: 18px;
        margin-bottom: 20px;
        text-align: center;
        box-shadow: 0 3px 10px rgba(0,0,0,0.10);
      }

      .resource-number {
        font-size: 30px;
        font-weight: bold;
      }

      .action-button {
        width: 100%;
        margin-bottom: 10px;
        border-radius: 10px !important;
        font-size: 16px !important;
        padding: 12px !important;
        font-weight: bold !important;
      }

      .event-box {
        background: white;
        border-left: 6px solid #26745a;
        border-radius: 12px;
        padding: 18px;
        font-size: 16px;
        box-shadow: 0 3px 10px rgba(0,0,0,0.10);
      }

      .progress {
        height: 25px;
        border-radius: 15px;
        margin-top: 10px;
        margin-bottom: 5px;
        background-color: #eeeeee;
      }

      .goal-box {
        background: #fff8df;
        border-radius: 12px;
        padding: 15px;
        margin-top: 15px;
      }

      .section-title {
        font-weight: bold;
        margin-top: 10px;
        margin-bottom: 15px;
      }

      .score-box {
        background: white;
        border-radius: 15px;
        padding: 25px;
        text-align: center;
        box-shadow: 0 3px 10px rgba(0,0,0,0.10);
        margin-bottom: 20px;
      }

      .score-number {
        font-size: 42px;
        font-weight: bold;
      }

      .rating {
        font-size: 22px;
        font-weight: bold;
        margin-top: 10px;
      }

      .footer {
        text-align: center;
        color: #666666;
        padding: 20px;
        margin-top: 20px;
      }

      .table-box {
        background: white;
        border-radius: 15px;
        padding: 20px;
        box-shadow: 0 3px 10px rgba(0,0,0,0.10);
      }

    "))
  ),
  
  
  # ==========================================
  # MAIN TITLE
  # ==========================================
  
  div(
    class = "main-title",
    
    h1("🏝️ SURVIVAL ISLAND SIMULATOR"),
    
    p("Survive the mysterious island for 30 days!")
  ),
  
  
  # ==========================================
  # MAIN LAYOUT
  # ==========================================
  
  fluidRow(
    
    # ========================================
    # LEFT COLUMN
    # ========================================
    
    column(
      width = 3,
      
      div(
        class = "panel-box",
        
        h3("👤 Survivor"),
        
        textInput(
          "player_name",
          "Enter your name:",
          value = ""
        ),
        
        actionButton(
          "start_game",
          "🏝️ Start Game",
          class = "action-button"
        ),
        
        hr(),
        
        h3("🎮 Actions"),
        
        actionButton(
          "food",
          "🍎 Search for Food",
          class = "action-button"
        ),
        
        actionButton(
          "water",
          "💧 Collect Water",
          class = "action-button"
        ),
        
        actionButton(
          "wood",
          "🪵 Collect Wood",
          class = "action-button"
        ),
        
        actionButton(
          "rest",
          "💤 Rest",
          class = "action-button"
        ),
        
        actionButton(
          "end_day",
          "🌅 End Day",
          class = "action-button"
        ),
        
        div(
          class = "goal-box",
          
          h4("🎯 Mission"),
          
          p("Survive for 30 days."),
          
          p(
            "Manage your health, energy and resources carefully."
          )
        )
      )
    ),
    
    
    # ========================================
    # RIGHT COLUMN
    # ========================================
    
    column(
      width = 9,
      
      # ======================================
      # WELCOME
      # ======================================
      
      div(
        class = "panel-box",
        
        h2("🏝️ Welcome to Survival Island!"),
        
        textOutput("welcome_message")
      ),
      
      
      # ======================================
      # SURVIVOR STATUS
      # ======================================
      
      h3(
        class = "section-title",
        "📊 Survivor Status"
      ),
      
      fluidRow(
        
        column(
          width = 4,
          
          div(
            class = "stat-card",
            
            div(
              class = "stat-title",
              "📅 DAY"
            ),
            
            div(
              class = "stat-number",
              textOutput("day")
            )
          )
        ),
        
        column(
          width = 4,
          
          div(
            class = "stat-card",
            
            div(
              class = "stat-title",
              "❤️ HEALTH"
            ),
            
            div(
              class = "stat-number",
              textOutput("health")
            ),
            
            uiOutput("health_bar")
          )
        ),
        
        column(
          width = 4,
          
          div(
            class = "stat-card",
            
            div(
              class = "stat-title",
              "⚡ ENERGY"
            ),
            
            div(
              class = "stat-number",
              textOutput("energy")
            ),
            
            uiOutput("energy_bar")
          )
        )
        
      ),
      
      
      # ======================================
      # RESOURCES
      # ======================================
      
      h3(
        class = "section-title",
        "📦 Island Resources"
      ),
      
      fluidRow(
        
        column(
          width = 4,
          
          div(
            class = "resource-card",
            
            h4("🍎 FOOD"),
            
            div(
              class = "resource-number",
              textOutput("food")
            ),
            
            p("Units available")
          )
        ),
        
        column(
          width = 4,
          
          div(
            class = "resource-card",
            
            h4("💧 WATER"),
            
            div(
              class = "resource-number",
              textOutput("water")
            ),
            
            p("Units available")
          )
        ),
        
        column(
          width = 4,
          
          div(
            class = "resource-card",
            
            h4("🪵 WOOD"),
            
            div(
              class = "resource-number",
              textOutput("wood")
            ),
            
            p("Units available")
          )
        )
        
      ),
      
      
      # ======================================
      # GAME EVENT
      # ======================================
      
      h3(
        class = "section-title",
        "📢 Latest Game Event"
      ),
      
      div(
        class = "event-box",
        
        textOutput("game_message")
      ),
      
      
      # ======================================
      # SURVIVAL SCORE
      # ======================================
      
      h3(
        class = "section-title",
        "🏆 Survival Score"
      ),
      
      div(
        class = "score-box",
        
        h4("Your Current Survival Performance"),
        
        div(
          class = "score-number",
          textOutput("survival_score")
        ),
        
        p("/ 100"),
        
        div(
          class = "rating",
          textOutput("survivor_rating")
        )
      ),
      
      
      # ======================================
      # ANALYTICS
      # ======================================
      
      h3(
        class = "section-title",
        "📈 Survival Analytics"
      ),
      
      div(
        class = "panel-box",
        
        tabsetPanel(
          
          tabPanel(
            "❤️ Health",
            br(),
            plotOutput(
              "health_plot",
              height = "350px"
            )
          ),
          
          tabPanel(
            "⚡ Energy",
            br(),
            plotOutput(
              "energy_plot",
              height = "350px"
            )
          ),
          
          tabPanel(
            "🍎 Food",
            br(),
            plotOutput(
              "food_plot",
              height = "350px"
            )
          ),
          
          tabPanel(
            "💧 Water",
            br(),
            plotOutput(
              "water_plot",
              height = "350px"
            )
          ),
          
          tabPanel(
            "🪵 Wood",
            br(),
            plotOutput(
              "wood_plot",
              height = "350px"
            )
          )
          
        )
      ),
      
      
      # ======================================
      # HISTORY TABLE
      # ======================================
      
      h3(
        class = "section-title",
        "📋 Daily Survival History"
      ),
      
      div(
        class = "table-box",
        
        tableOutput("history_table")
      )
      
    )
  ),
  
  
  # ==========================================
  # FOOTER
  # ==========================================
  
  div(
    class = "footer",
    
    "🏝️ Survival Island Simulator | Built with R and Shiny"
  )
  
)


# ============================================
# SERVER
# ============================================

server <- function(input, output, session) {
  
  
  # ==========================================
  # PLAYER VARIABLES
  # ==========================================
  
  player_name <- reactiveVal("")
  
  day <- reactiveVal(1)
  
  health <- reactiveVal(100)
  
  energy <- reactiveVal(100)
  
  food <- reactiveVal(50)
  
  water <- reactiveVal(50)
  
  wood <- reactiveVal(20)
  
  
  # ==========================================
  # GAME STATUS
  # ==========================================
  
  game_active <- reactiveVal(FALSE)
  
  game_message <- reactiveVal(
    "Enter your name and click Start Game!"
  )
  
  
  # ==========================================
  # SURVIVAL HISTORY
  # ==========================================
  
  survival_history <- reactiveVal(
    
    data.frame(
      Day = integer(),
      Health = numeric(),
      Energy = numeric(),
      Food = numeric(),
      Water = numeric(),
      Wood = numeric()
    )
    
  )
  
  
  # ==========================================
  # START GAME
  # ==========================================
  
  observeEvent(input$start_game, {
    
    if (trimws(input$player_name) == "") {
      
      game_message(
        "⚠️ Please enter your survivor name."
      )
      
    } else {
      
      player_name(
        input$player_name
      )
      
      day(1)
      
      health(100)
      
      energy(100)
      
      food(50)
      
      water(50)
      
      wood(20)
      
      game_active(TRUE)
      
      
      # Reset history for a new game
      
      survival_history(
        
        data.frame(
          Day = integer(),
          Health = numeric(),
          Energy = numeric(),
          Food = numeric(),
          Water = numeric(),
          Wood = numeric()
        )
        
      )
      
      
      game_message(
        
        paste(
          "🏝️ Welcome",
          input$player_name,
          "! Your survival journey begins."
        )
        
      )
      
    }
    
  })
  
  
  # ==========================================
  # SEARCH FOR FOOD
  # ==========================================
  
  observeEvent(input$food, {
    
    if (!game_active()) {
      
      game_message(
        "⚠️ Please start the game first."
      )
      
    } else if (energy() < 15) {
      
      game_message(
        "⚠️ Not enough energy to search for food!"
      )
      
    } else {
      
      food_found <- sample(
        10:25,
        1
      )
      
      food(
        food() + food_found
      )
      
      energy(
        energy() - 15
      )
      
      game_message(
        
        paste(
          "🍎 You found",
          food_found,
          "units of food! Energy -15."
        )
        
      )
      
    }
    
  })
  
  
  # ==========================================
  # COLLECT WATER
  # ==========================================
  
  observeEvent(input$water, {
    
    if (!game_active()) {
      
      game_message(
        "⚠️ Please start the game first."
      )
      
    } else if (energy() < 10) {
      
      game_message(
        "⚠️ Not enough energy to collect water!"
      )
      
    } else {
      
      water_found <- sample(
        15:30,
        1
      )
      
      water(
        water() + water_found
      )
      
      energy(
        energy() - 10
      )
      
      game_message(
        
        paste(
          "💧 You collected",
          water_found,
          "units of water! Energy -10."
        )
        
      )
      
    }
    
  })
  
  
  # ==========================================
  # COLLECT WOOD
  # ==========================================
  
  observeEvent(input$wood, {
    
    if (!game_active()) {
      
      game_message(
        "⚠️ Please start the game first."
      )
      
    } else if (energy() < 15) {
      
      game_message(
        "⚠️ Not enough energy to collect wood!"
      )
      
    } else {
      
      wood_found <- sample(
        10:20,
        1
      )
      
      wood(
        wood() + wood_found
      )
      
      energy(
        energy() - 15
      )
      
      game_message(
        
        paste(
          "🪵 You collected",
          wood_found,
          "units of wood! Energy -15."
        )
        
      )
      
    }
    
  })
  
  
  # ==========================================
  # REST
  # ==========================================
  
  observeEvent(input$rest, {
    
    if (!game_active()) {
      
      game_message(
        "⚠️ Please start the game first."
      )
      
    } else {
      
      old_energy <- energy()
      
      new_energy <- min(
        energy() + 25,
        100
      )
      
      actual_gain <- new_energy - old_energy
      
      energy(
        new_energy
      )
      
      game_message(
        
        paste(
          "💤 You rested and recovered",
          actual_gain,
          "energy."
        )
        
      )
      
    }
    
  })
  
  
  # ==========================================
  # END DAY
  # ==========================================
  
  observeEvent(input$end_day, {
    
    if (!game_active()) {
      
      game_message(
        "⚠️ Please start the game first."
      )
      
    } else {
      
      # ======================================
      # FOOD CONSUMPTION
      # ======================================
      
      food_used <- 10
      
      if (food() >= food_used) {
        
        food(
          food() - food_used
        )
        
        food_message <- paste(
          "🍎 Food consumed:",
          food_used
        )
        
      } else {
        
        health(
          health() - 10
        )
        
        food_message <- "⚠️ Not enough food! Health -10."
        
      }
      
      
      # ======================================
      # WATER CONSUMPTION
      # ======================================
      
      water_used <- 15
      
      if (water() >= water_used) {
        
        water(
          water() - water_used
        )
        
        water_message <- paste(
          "💧 Water consumed:",
          water_used
        )
        
      } else {
        
        health(
          health() - 15
        )
        
        water_message <- "⚠️ Not enough water! Health -15."
        
      }
      
      
      # ======================================
      # ENERGY CONSUMPTION
      # ======================================
      
      energy(
        max(
          energy() - 5,
          0
        )
      )
      
      
      # ======================================
      # RANDOM EVENT
      # ======================================
      
      event <- sample(
        1:5,
        1
      )
      
      
      if (event == 1) {
        
        wood_lost <- 5
        
        if (wood() >= wood_lost) {
          
          wood(
            wood() - wood_lost
          )
          
          event_message <- paste(
            "🌧️ Heavy storm! Wood lost:",
            wood_lost
          )
          
        } else {
          
          health(
            health() - 5
          )
          
          event_message <- "🌧️ Heavy storm! Health -5."
          
        }
        
        
      } else if (event == 2) {
        
        food_found <- sample(
          10:20,
          1
        )
        
        water_found <- sample(
          5:15,
          1
        )
        
        food(
          food() + food_found
        )
        
        water(
          water() + water_found
        )
        
        event_message <- paste(
          "💎 Hidden supplies! Food +",
          food_found,
          "and Water +",
          water_found
        )
        
        
      } else if (event == 3) {
        
        health_lost <- 15
        
        health(
          health() - health_lost
        )
        
        event_message <- paste(
          "🐗 Wild animal attack! Health -",
          health_lost
        )
        
        
      } else if (event == 4) {
        
        energy(
          min(
            energy() + 10,
            100
          )
        )
        
        event_message <- "🌙 Calm night! Energy +10."
        
        
      } else {
        
        wood_found <- sample(
          5:15,
          1
        )
        
        wood(
          wood() + wood_found
        )
        
        event_message <- paste(
          "🍀 Lucky find! Wood +",
          wood_found
        )
        
      }
      
      
      # ======================================
      # PREVENT NEGATIVE HEALTH
      # ======================================
      
      if (health() < 0) {
        
        health(0)
        
      }
      
      
      # ======================================
      # RECORD COMPLETED DAY
      # ======================================
      
      new_record <- data.frame(
        
        Day = day(),
        
        Health = health(),
        
        Energy = energy(),
        
        Food = food(),
        
        Water = water(),
        
        Wood = wood()
        
      )
      
      
      old_history <- survival_history()
      
      survival_history(
        
        rbind(
          old_history,
          new_record
        )
        
      )
      
      
      # ======================================
      # CHECK GAME RESULT
      # ======================================
      
      if (health() <= 0) {
        
        game_message(
          
          paste(
            "💀 GAME OVER! You survived until Day",
            day(),
            "."
          )
          
        )
        
        game_active(FALSE)
        
        
      } else if (day() == 30) {
        
        game_message(
          
          paste(
            "🏆 CONGRATULATIONS! You survived all 30 days!",
            "Final health:",
            health()
          )
          
        )
        
        game_active(FALSE)
        
        
      } else {
        
        game_message(
          
          paste(
            "🌅 Day",
            day(),
            "completed.",
            food_message,
            water_message,
            event_message
          )
          
        )
        
        day(
          day() + 1
        )
        
      }
      
    }
    
  })
  
  
  # ==========================================
  # WELCOME MESSAGE
  # ==========================================
  
  output$welcome_message <- renderText({
    
    if (player_name() == "") {
      
      "Enter your survivor name and click Start Game."
      
    } else {
      
      paste(
        "Welcome,",
        player_name(),
        "! Your mission is to survive 30 days."
      )
      
    }
    
  })
  
  
  # ==========================================
  # DAY
  # ==========================================
  
  output$day <- renderText({
    
    day()
    
  })
  
  
  # ==========================================
  # HEALTH
  # ==========================================
  
  output$health <- renderText({
    
    paste0(
      health(),
      " / 100"
    )
    
  })
  
  
  # ==========================================
  # ENERGY
  # ==========================================
  
  output$energy <- renderText({
    
    paste0(
      energy(),
      " / 100"
    )
    
  })
  
  
  # ==========================================
  # FOOD
  # ==========================================
  
  output$food <- renderText({
    
    food()
    
  })
  
  
  # ==========================================
  # WATER
  # ==========================================
  
  output$water <- renderText({
    
    water()
    
  })
  
  
  # ==========================================
  # WOOD
  # ==========================================
  
  output$wood <- renderText({
    
    wood()
    
  })
  
  
  # ==========================================
  # HEALTH BAR
  # ==========================================
  
  output$health_bar <- renderUI({
    
    value <- health()
    
    tags$div(
      
      class = "progress",
      
      tags$div(
        
        style = paste0(
          "width:",
          value,
          "%; height:100%; ",
          "background-color:#dc3545; ",
          "border-radius:15px;"
        )
        
      )
      
    )
    
  })
  
  
  # ==========================================
  # ENERGY BAR
  # ==========================================
  
  output$energy_bar <- renderUI({
    
    value <- energy()
    
    tags$div(
      
      class = "progress",
      
      tags$div(
        
        style = paste0(
          "width:",
          value,
          "%; height:100%; ",
          "background-color:#f0ad4e; ",
          "border-radius:15px;"
        )
        
      )
      
    )
    
  })
  
  
  # ==========================================
  # GAME MESSAGE
  # ==========================================
  
  output$game_message <- renderText({
    
    game_message()
    
  })
  
  
  # ==========================================
  # SURVIVAL SCORE
  # ==========================================
  
  calculate_score <- reactive({
    
    history <- survival_history()
    
    days_survived <- nrow(history)
    
    final_health <- health()
    
    final_energy <- energy()
    
    final_food <- food()
    
    final_water <- water()
    
    final_wood <- wood()
    
    
    # -------------------------------
    # DAY SCORE - 40 POINTS
    # -------------------------------
    
    day_score <- min(
      (days_survived / 30) * 40,
      40
    )
    
    
    # -------------------------------
    # HEALTH SCORE - 20 POINTS
    # -------------------------------
    
    health_score <- (
      final_health / 100
    ) * 20
    
    
    # -------------------------------
    # ENERGY SCORE - 15 POINTS
    # -------------------------------
    
    energy_score <- (
      final_energy / 100
    ) * 15
    
    
    # -------------------------------
    # RESOURCE SCORE - 25 POINTS
    # -------------------------------
    
    resource_score <- min(
      
      (
        (
          final_food +
            final_water +
            final_wood
        ) / 150
      ) * 25,
      
      25
      
    )
    
    
    # -------------------------------
    # TOTAL SCORE
    # -------------------------------
    
    total_score <- (
      
      day_score +
        health_score +
        energy_score +
        resource_score
      
    )
    
    
    total_score
    
  })
  
  
  # ==========================================
  # DISPLAY SURVIVAL SCORE
  # ==========================================
  
  output$survival_score <- renderText({
    
    paste0(
      round(
        calculate_score(),
        1
      ),
      " / 100"
    )
    
  })
  
  
  # ==========================================
  # SURVIVOR RATING
  # ==========================================
  
  output$survivor_rating <- renderText({
    
    score <- calculate_score()
    
    
    if (score >= 80) {
      
      "⭐ EXCELLENT SURVIVOR"
      
    } else if (score >= 60) {
      
      "⭐ GOOD SURVIVOR"
      
    } else if (score >= 40) {
      
      "⭐ AVERAGE SURVIVOR"
      
    } else {
      
      "💀 POOR SURVIVOR"
      
    }
    
  })
  
  
  # ==========================================
  # HEALTH GRAPH
  # ==========================================
  
  output$health_plot <- renderPlot({
    
    history <- survival_history()
    
    if (nrow(history) == 0) {
      
      plot.new()
      
      text(
        0.5,
        0.5,
        "No survival data yet."
      )
      
    } else {
      
      plot(
        
        history$Day,
        
        history$Health,
        
        type = "o",
        
        main = "❤️ Health Over Survival Days",
        
        xlab = "Day",
        
        ylab = "Health",
        
        ylim = c(0, 100)
        
      )
      
    }
    
  })
  
  
  # ==========================================
  # ENERGY GRAPH
  # ==========================================
  
  output$energy_plot <- renderPlot({
    
    history <- survival_history()
    
    if (nrow(history) == 0) {
      
      plot.new()
      
      text(
        0.5,
        0.5,
        "No survival data yet."
      )
      
    } else {
      
      plot(
        
        history$Day,
        
        history$Energy,
        
        type = "o",
        
        main = "⚡ Energy Over Survival Days",
        
        xlab = "Day",
        
        ylab = "Energy",
        
        ylim = c(0, 100)
        
      )
      
    }
    
  })
  
  
  # ==========================================
  # FOOD GRAPH
  # ==========================================
  
  output$food_plot <- renderPlot({
    
    history <- survival_history()
    
    if (nrow(history) == 0) {
      
      plot.new()
      
      text(
        0.5,
        0.5,
        "No survival data yet."
      )
      
    } else {
      
      plot(
        
        history$Day,
        
        history$Food,
        
        type = "o",
        
        main = "🍎 Food Supply Over Survival Days",
        
        xlab = "Day",
        
        ylab = "Food"
        
      )
      
    }
    
  })
  
  
  # ==========================================
  # WATER GRAPH
  # ==========================================
  
  output$water_plot <- renderPlot({
    
    history <- survival_history()
    
    if (nrow(history) == 0) {
      
      plot.new()
      
      text(
        0.5,
        0.5,
        "No survival data yet."
      )
      
    } else {
      
      plot(
        
        history$Day,
        
        history$Water,
        
        type = "o",
        
        main = "💧 Water Supply Over Survival Days",
        
        xlab = "Day",
        
        ylab = "Water"
        
      )
      
    }
    
  })
  
  
  # ==========================================
  # WOOD GRAPH
  # ==========================================
  
  output$wood_plot <- renderPlot({
    
    history <- survival_history()
    
    if (nrow(history) == 0) {
      
      plot.new()
      
      text(
        0.5,
        0.5,
        "No survival data yet."
      )
      
    } else {
      
      plot(
        
        history$Day,
        
        history$Wood,
        
        type = "o",
        
        main = "🪵 Wood Supply Over Survival Days",
        
        xlab = "Day",
        
        ylab = "Wood"
        
      )
      
    }
    
  })
  
  
  # ==========================================
  # HISTORY TABLE
  # ==========================================
  
  output$history_table <- renderTable({
    
    history <- survival_history()
    
    if (nrow(history) == 0) {
      
      return(NULL)
      
    }
    
    history
    
  },
  
  striped = TRUE,
  
  bordered = TRUE,
  
  hover = TRUE,
  
  spacing = "s",
  
  rownames = FALSE
  
  )
  
}


# ============================================
# RUN SHINY APPLICATION
# ============================================

shinyApp(
  ui = ui,
  server = server
)
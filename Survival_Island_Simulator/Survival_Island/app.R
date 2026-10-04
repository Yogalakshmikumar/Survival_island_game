# ============================================
# 🏝️ SURVIVAL ISLAND SIMULATOR
# SHINY GAME APP - STAGE 4
# ============================================

library(shiny)

# ============================================
# USER INTERFACE
# ============================================

ui <- fluidPage(
  
  # =========================
  # COMPACT CSS
  # =========================
  tags$head(
    tags$style(HTML("
      
      body {
        background: linear-gradient(135deg, #e8f5e9, #f1f8e9);
        font-family: Arial, sans-serif;
        color: #263238;
      }

      .main-title {
        text-align: center;
        color: #1b5e20;
        font-weight: bold;
        font-size: 30px;
        margin: 10px 0 2px 0;
      }

      .subtitle {
        text-align: center;
        color: #558b2f;
        margin-bottom: 12px;
        font-size: 14px;
      }

      .panel-box {
        background: white;
        border-radius: 12px;
        padding: 12px;
        margin-bottom: 10px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.10);
        border: 1px solid #dcedc8;
      }

      .section-title {
        color: #2e7d32;
        font-weight: bold;
        font-size: 16px;
        margin: 2px 0 8px 0;
      }

      /* SIDEBAR */
      .sidebar-box {
        background: white;
        border-radius: 12px;
        padding: 12px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.10);
        border: 1px solid #dcedc8;
      }

      /* BUTTONS */
      .action-button {
        width: 100%;
        margin-bottom: 6px;
        border-radius: 8px !important;
        font-weight: bold;
        padding: 7px !important;
        border: none !important;
      }

      .start-button {
        background: #2e7d32 !important;
        color: white !important;
      }

      .end-day-button {
        background: #ef6c00 !important;
        color: white !important;
      }

      .shelter-button {
        background: #6a1b9a !important;
        color: white !important;
      }

      /* MINI STATUS CARDS */
      .stat-card {
        background: #f9fff7;
        border: 1px solid #c8e6c9;
        border-radius: 10px;
        padding: 8px;
        text-align: center;
        min-height: 75px;
        margin-bottom: 8px;
      }

      .stat-title {
        font-size: 12px;
        color: #689f38;
        font-weight: bold;
      }

      .stat-value {
        font-size: 22px;
        font-weight: bold;
        color: #1b5e20;
      }

      /* RESOURCE CARDS */
      .resource-card {
        background: #fffde7;
        border: 1px solid #fff59d;
        border-radius: 10px;
        padding: 7px;
        text-align: center;
        min-height: 65px;
      }

      .resource-title {
        font-size: 12px;
        font-weight: bold;
        color: #827717;
      }

      .resource-value {
        font-size: 20px;
        font-weight: bold;
        color: #5d4037;
      }

      /* PROGRESS BARS */
      .progress {
        height: 10px !important;
        margin-top: 4px;
        margin-bottom: 2px;
      }

      /* EVENT */
      .event-box {
        background: #fff8e1;
        border-left: 5px solid #ffb300;
        border-radius: 8px;
        padding: 10px;
        min-height: 70px;
      }

      /* SCORE */
      .score-box {
        background: linear-gradient(135deg, #e8f5e9, #f1f8e9);
        border: 2px solid #66bb6a;
        border-radius: 10px;
        padding: 12px;
        text-align: center;
        min-height: 100px;
      }

      .score-number {
        font-size: 32px;
        font-weight: bold;
        color: #2e7d32;
      }

      /* MISSION / INVENTORY */
      .info-box {
        background: #f5f5f5;
        border-radius: 8px;
        padding: 8px;
        font-size: 13px;
        margin-bottom: 8px;
      }

      /* TABS */
      .nav-tabs > li > a {
        font-weight: bold;
        padding: 8px 12px;
      }

      .tab-content {
        padding-top: 8px;
      }

      /* TABLE */
      .dataTable {
        font-size: 12px;
      }

      /* FOOTER */
      .footer {
        text-align: center;
        color: #689f38;
        font-size: 12px;
        margin: 8px 0;
      }

      /* REMOVE EXCESS BOOTSTRAP SPACE */
      .row {
        margin-left: -5px;
        margin-right: -5px;
      }

      [class*='col-'] {
        padding-left: 5px;
        padding-right: 5px;
      }

      @media (max-width: 768px) {
        .main-title {
          font-size: 24px;
        }

        .stat-value {
          font-size: 18px;
        }

        .score-number {
          font-size: 26px;
        }
      }

    "))
  ),
  
  # =========================
  # HEADER
  # =========================
  div(
    class = "main-title",
    "️ SURVIVAL ISLAND SIMULATOR"
  ),
  
  div(
    class = "subtitle",
    "Survive 30 Days • Manage Resources • Make Smart Decisions"
  ),
  
  # =========================
  # MAIN LAYOUT
  # =========================
  fluidRow(
    
    # =======================
    # LEFT SIDEBAR
    # =======================
    column(
      width = 3,
      
      div(
        class = "sidebar-box",
        
        div(
          class = "section-title",
          " Survivor"
        ),
        
        textInput(
          "player_name",
          "Name:",
          placeholder = "Enter your name"
        ),
        
        actionButton(
          "start_game",
          "🚀 Start Game",
          class = "action-button start-button"
        ),
        
        hr(),
        
        div(
          class = "section-title",
          "🎮 Actions"
        ),
        
        actionButton(
          "search_food",
          "🍎 Search Food",
          class = "action-button"
        ),
        
        actionButton(
          "collect_water",
          "💧 Collect Water",
          class = "action-button"
        ),
        
        actionButton(
          "collect_wood",
          "🪵 Collect Wood",
          class = "action-button"
        ),
        
        actionButton(
          "rest",
          "💤 Rest",
          class = "action-button"
        ),
        
        actionButton(
          "build_shelter",
          "️ Build Shelter",
          class = "action-button shelter-button"
        ),
        
        actionButton(
          "end_day",
          "🌅 End Day",
          class = "action-button end-day-button"
        ),
        
        div(
          class = "info-box",
          h5("🎯 Mission", style = "margin:3px 0;"),
          textOutput("mission")
        ),
        
        div(
          class = "info-box",
          h5("🏕️ Shelter", style = "margin:3px 0;"),
          textOutput("shelter_status")
        ),
        
        div(
          class = "info-box",
          h5("🎒 Inventory", style = "margin:3px 0;"),
          textOutput("inventory_status")
        )
      )
    ),
    
    # =======================
    # RIGHT MAIN AREA
    # =======================
    column(
      width = 9,
      
      # -----------------------
      # WELCOME
      # -----------------------
      div(
        class = "panel-box",
        textOutput("welcome_message")
      ),
      
      # -----------------------
      # STATUS
      # -----------------------
      div(
        class = "panel-box",
        
        div(
          class = "section-title",
          "📊 Survivor Status"
        ),
        
        fluidRow(
          
          column(
            width = 4,
            div(
              class = "stat-card",
              div(class = "stat-title", "📅 DAY"),
              div(class = "stat-value", textOutput("day", inline = TRUE))
            )
          ),
          
          column(
            width = 4,
            div(
              class = "stat-card",
              div(class = "stat-title", "❤️ HEALTH"),
              div(class = "stat-value", textOutput("health", inline = TRUE)),
              uiOutput("health_bar")
            )
          ),
          
          column(
            width = 4,
            div(
              class = "stat-card",
              div(class = "stat-title", "⚡ ENERGY"),
              div(class = "stat-value", textOutput("energy", inline = TRUE)),
              uiOutput("energy_bar")
            )
          )
          
        ),
        
        fluidRow(
          
          column(
            width = 4,
            div(
              class = "resource-card",
              div(class = "resource-title", "🍎 FOOD"),
              div(class = "resource-value",
                  textOutput("food", inline = TRUE))
            )
          ),
          
          column(
            width = 4,
            div(
              class = "resource-card",
              div(class = "resource-title", "💧 WATER"),
              div(class = "resource-value",
                  textOutput("water", inline = TRUE))
            )
          ),
          
          column(
            width = 4,
            div(
              class = "resource-card",
              div(class = "resource-title", "🪵 WOOD"),
              div(class = "resource-value",
                  textOutput("wood", inline = TRUE))
            )
          )
          
        )
      ),
      
      # -----------------------
      # EVENT + SCORE
      # -----------------------
      fluidRow(
        
        column(
          width = 8,
          
          div(
            class = "panel-box",
            
            div(
              class = "section-title",
              "📢 Latest Event"
            ),
            
            div(
              class = "event-box",
              textOutput("game_message")
            )
          )
        ),
        
        column(
          width = 4,
          
          div(
            class = "panel-box",
            
            div(
              class = "section-title",
              " Survival Score"
            ),
            
            div(
              class = "score-box",
              
              div(
                class = "score-number",
                textOutput("survival_score", inline = TRUE)
              ),
              
              textOutput("survivor_rating")
            )
          )
        )
      ),
      
      # -----------------------
      # ANALYTICS + HISTORY
      # -----------------------
      div(
        class = "panel-box",
        
        tabsetPanel(
          
          id = "main_tabs",
          
          # =====================
          # ANALYTICS TAB
          # =====================
          tabPanel(
            "📈 Analytics",
            
            tabsetPanel(
              
              tabPanel(
                "❤️ Health",
                plotOutput(
                  "health_plot",
                  height = "230px"
                )
              ),
              
              tabPanel(
                "⚡ Energy",
                plotOutput(
                  "energy_plot",
                  height = "230px"
                )
              ),
              
              tabPanel(
                "🍎 Food",
                plotOutput(
                  "food_plot",
                  height = "230px"
                )
              ),
              
              tabPanel(
                "💧 Water",
                plotOutput(
                  "water_plot",
                  height = "230px"
                )
              ),
              
              tabPanel(
                "🪵 Wood",
                plotOutput(
                  "wood_plot",
                  height = "230px"
                )
              )
              
            )
          ),
          
          # =====================
          # HISTORY TAB
          # =====================
          tabPanel(
            "📋 Daily History",
            
            div(
              style = "margin-top:8px;",
              tableOutput("history_table")
            )
          )
          
        )
      )
      
    )
  ),
  
  # =========================
  # FOOTER
  # =========================
  div(
    class = "footer",
    "🏝️ Survival Island Simulator • Built with R & Shiny"
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
  shelter_built <- reactiveVal(FALSE)
  # ==========================================
  # INVENTORY
  # ==========================================
  
  knife <- reactiveVal(1)
  
  rope <- reactiveVal(1)
  
  medicine <- reactiveVal(0)
  
  torch <- reactiveVal(1)
  
  
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
      
      shelter_built(FALSE)
      
      knife(1)
      
      rope(1)
      
      medicine(0)
      
      torch(1)
      
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
  
  observeEvent(input$search_food, {
    
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
  
  observeEvent(input$collect_water, {
    
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
  
  observeEvent(input$collect_wood, {
    
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
  # BUILD SHELTER
  # ==========================================
  
  observeEvent(input$build_shelter, {
    
    if (!game_active()) {
      
      game_message(
        "⚠️ Please start the game first."
      )
      
    } else if (shelter_built()) {
      
      game_message(
        "🏕️ Your shelter is already built!"
      )
      
    } else if (wood() < 30) {
      
      game_message(
        paste(
          "⚠️ Not enough wood!",
          "You need 30 wood to build a shelter."
        )
      )
      
    } else {
      
      wood(
        wood() - 30
      )
      
      shelter_built(TRUE)
      
      game_message(
        "🏕️ Shelter built successfully!️  You are now protected from storms."
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
        
        if (shelter_built()) {
          
          event_message <- paste(
            "🌧️ Heavy storm! Your shelter protected you. No damage!"
          )
          
        } else {
          
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
            " CONGRATULATIONS! You survived all 30 days!",
            "Final health:",
            health()
          )
          
        )
        
        game_active(FALSE)
        
        
      } else {
        
        game_message(
          
          paste(
            " Day",
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
  # SHELTER STATUS
  # ==========================================
  
  output$shelter_status <- renderText({
    
    if (shelter_built()) {
      
      "️ Built —️  Protected"
      
    } else {
      
      "️ Not Built — Requires 30 Wood"
      
    }
    
  })
  # ==========================================
  # INVENTORY STATUS
  # ==========================================
  
  output$inventory_status <- renderText({
    
    paste(
      "🔪 Knife:", knife(),
      "\n Rope:", rope(),
      "\n Medicine:", medicine(),
      "\n Torch:", torch(),
      sep = "\n"
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
      
      " EXCELLENT SURVIVOR"
      
    } else if (score >= 60) {
      
      " GOOD SURVIVOR"
      
    } else if (score >= 40) {
      
      "AVERAGE SURVIVOR"
      
    } else {
      
      " POOR SURVIVOR"
      
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
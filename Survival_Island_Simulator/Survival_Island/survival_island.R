# ============================================
# SURVIVAL ISLAND SIMULATOR
# ============================================

cat("============================================\n")
cat("       🏝️ SURVIVAL ISLAND SIMULATOR\n")
cat("============================================\n")
cat("Survive for 30 days on the mysterious island!\n")
cat("============================================\n\n")


# ============================================
# PLAYER NAME
# ============================================

player_name <- readline("Enter your survivor name: ")


# ============================================
# BASIC PLAYER STATISTICS
# ============================================

health <- 100
energy <- 100
day <- 1


# ============================================
# RESOURCES - VECTOR
# ============================================

resources <- c(
  Food = 50,
  Water = 50,
  Wood = 20
)


# ============================================
# INVENTORY - VECTOR
# ============================================

inventory <- c(
  Knife = 1,
  Rope = 1,
  Medicine = 0,
  Torch = 1
)


# ============================================
# PLAYER - LIST
# ============================================

player <- list(
  name = player_name,
  health = health,
  energy = energy,
  day = day,
  resources = resources,
  inventory = inventory
)
# ============================================
# SURVIVAL HISTORY - DATA FRAME
# ============================================

survival_history <- data.frame(
  Day = integer(),
  Health = numeric(),
  Energy = numeric(),
  Food = numeric(),
  Water = numeric(),
  Wood = numeric()
)

# ============================================
# DISPLAY PLAYER INFORMATION
# ============================================

cat("\n========== SURVIVOR PROFILE ==========\n")

cat("Name   :", player$name, "\n")
cat("Health :", player$health, "\n")
cat("Energy :", player$energy, "\n")
cat("Day    :", player$day, "\n")

cat("\n---------- RESOURCES ----------\n")
print(player$resources)

cat("\n---------- INVENTORY ----------\n")
print(player$inventory)

cat("======================================\n")


# ============================================
# FUNCTION: SEARCH FOR FOOD
# ============================================

search_food <- function(player) {
  
  if (player$energy >= 15) {
    
    food_found <- sample(10:25, 1)
    
    player$resources["Food"] <- 
      player$resources["Food"] + food_found
    
    player$energy <- player$energy - 15
    
    cat("\n🍎 You searched the island for food.\n")
    cat("Food found:", food_found, "\n")
    cat("Energy used: 15\n")
    
  } else {
    
    cat("\n⚠️ You do not have enough energy!\n")
  }
  
  return(player)
}


# ============================================
# FUNCTION: COLLECT WATER
# ============================================

collect_water <- function(player) {
  
  if (player$energy >= 10) {
    
    water_found <- sample(15:30, 1)
    
    player$resources["Water"] <- 
      player$resources["Water"] + water_found
    
    player$energy <- player$energy - 10
    
    cat("\n💧 You collected water.\n")
    cat("Water collected:", water_found, "\n")
    cat("Energy used: 10\n")
    
  } else {
    
    cat("\n⚠️ You do not have enough energy!\n")
  }
  
  return(player)
}


# ============================================
# FUNCTION: COLLECT WOOD
# ============================================

collect_wood <- function(player) {
  
  if (player$energy >= 15) {
    
    wood_found <- sample(10:20, 1)
    
    player$resources["Wood"] <- 
      player$resources["Wood"] + wood_found
    
    player$energy <- player$energy - 15
    
    cat("\n🪵 You collected wood.\n")
    cat("Wood collected:", wood_found, "\n")
    cat("Energy used: 15\n")
    
  } else {
    
    cat("\n⚠️ You do not have enough energy!\n")
  }
  
  return(player)
}


# ============================================
# FUNCTION: REST
# ============================================

rest <- function(player) {
  
  energy_gain <- 25
  
  player$energy <- player$energy + energy_gain
  
  if (player$energy > 100) {
    player$energy <- 100
  }
  
  cat("\n💤 You rested and recovered energy.\n")
  cat("Energy gained:", energy_gain, "\n")
  cat("Current energy:", player$energy, "\n")
  
  return(player)
}
# ============================================
# FUNCTION: DISPLAY STATUS
# ============================================

show_status <- function(player) {
  
  cat("\n======================================\n")
  cat("         🏝️ SURVIVOR STATUS\n")
  cat("======================================\n")
  
  cat("Name   :", player$name, "\n")
  cat("Day    :", player$day, "\n")
  cat("Health :", player$health, "\n")
  cat("Energy :", player$energy, "\n")
  
  cat("\n---------- RESOURCES ----------\n")
  print(player$resources)
  
  cat("\n---------- INVENTORY ----------\n")
  print(player$inventory)
  
  cat("======================================\n")
  
  return(player)
}
# ============================================
# FUNCTION: END DAY
# ============================================

end_day <- function(player) {
  
  cat("\n🌙 Night has fallen...\n")
  
  
  # ------------------------------------------
  # FOOD CONSUMPTION
  # ------------------------------------------
  
  food_used <- 10
  
  if (player$resources["Food"] >= food_used) {
    
    player$resources["Food"] <- 
      player$resources["Food"] - food_used
    
    cat("🍎 Food consumed:", food_used, "\n")
    
  } else {
    
    cat("⚠️ Not enough food!\n")
    
    player$health <- player$health - 10
  }
  
  
  # ------------------------------------------
  # WATER CONSUMPTION
  # ------------------------------------------
  
  water_used <- 15
  
  if (player$resources["Water"] >= water_used) {
    
    player$resources["Water"] <- 
      player$resources["Water"] - water_used
    
    cat("💧 Water consumed:", water_used, "\n")
    
  } else {
    
    cat("⚠️ Not enough water!\n")
    
    player$health <- player$health - 15
  }
  
  
  # ------------------------------------------
  # ENERGY REDUCTION
  # ------------------------------------------
  
  player$energy <- player$energy - 5
  
  if (player$energy < 0) {
    player$energy <- 0
  }
  
  cat("⚡ Energy used during the day: 5\n")
  
  
  # ------------------------------------------
  # RANDOM ISLAND EVENT
  # ------------------------------------------
  
  player <- random_event(player)
  
  
  # ------------------------------------------
  # MOVE TO NEXT DAY
  # ------------------------------------------
  
  
  cat("🌅 A new day begins!\n")
  
  return(player)
}
# ============================================
# FUNCTION: RANDOM ISLAND EVENT
# ============================================

random_event <- function(player) {
  
  # Generate a random event number
  event <- sample(1:5, 1)
  
  
  # ------------------------------------------
  # EVENT 1: HEAVY STORM
  # ------------------------------------------
  
  if (event == 1) {
    
    cat("\n🌧️ RANDOM EVENT: HEAVY STORM!\n")
    
    wood_lost <- 5
    
    if (player$resources["Wood"] >= wood_lost) {
      
      player$resources["Wood"] <- 
        player$resources["Wood"] - wood_lost
      
      cat("🪵 Wood lost:", wood_lost, "\n")
      
    } else {
      
      player$health <- player$health - 5
      
      cat("❤️ The storm damaged you!\n")
      cat("Health lost: 5\n")
    }
  }
  
  
  # ------------------------------------------
  # EVENT 2: HIDDEN SUPPLIES
  # ------------------------------------------
  
  else if (event == 2) {
    
    cat("\n💎 RANDOM EVENT: HIDDEN SUPPLIES!\n")
    
    food_found <- sample(10:20, 1)
    water_found <- sample(5:15, 1)
    
    player$resources["Food"] <- 
      player$resources["Food"] + food_found
    
    player$resources["Water"] <- 
      player$resources["Water"] + water_found
    
    cat("🍎 Food found:", food_found, "\n")
    cat("💧 Water found:", water_found, "\n")
  }
  
  
  # ------------------------------------------
  # EVENT 3: WILD ANIMAL ATTACK
  # ------------------------------------------
  
  else if (event == 3) {
    
    cat("\n🐗 RANDOM EVENT: WILD ANIMAL ATTACK!\n")
    
    health_lost <- 15
    
    player$health <- player$health - health_lost
    
    cat("❤️ Health lost:", health_lost, "\n")
  }
  
  
  # ------------------------------------------
  # EVENT 4: CALM NIGHT
  # ------------------------------------------
  
  else if (event == 4) {
    
    cat("\n🌙 RANDOM EVENT: CALM NIGHT!\n")
    
    energy_gain <- 10
    
    player$energy <- player$energy + energy_gain
    
    if (player$energy > 100) {
      player$energy <- 100
    }
    
    cat("⚡ Extra energy recovered:", energy_gain, "\n")
  }
  
  
  # ------------------------------------------
  # EVENT 5: LUCKY FIND
  # ------------------------------------------
  
  else if (event == 5) {
    
    cat("\n🍀 RANDOM EVENT: LUCKY FIND!\n")
    
    wood_found <- sample(5:15, 1)
    
    player$resources["Wood"] <- 
      player$resources["Wood"] + wood_found
    
    cat("🪵 Extra wood found:", wood_found, "\n")
  }
  
  
  return(player)
}
# ============================================
# FUNCTION: CHECK SURVIVAL
# ============================================

check_survival <- function(player) {
  
  if (player$health <= 0) {
    
    player$health <- 0
    
    cat("\n======================================\n")
    cat("          💀 GAME OVER\n")
    cat("======================================\n")
    cat("You did not survive the island.\n")
    cat("Survivor:", player$name, "\n")
    cat("Last completed day:", player$day, "\n")
    cat("======================================\n")
    
    return(FALSE)
    
  } else {
    
    return(TRUE)
  }
}


# ============================================
# FUNCTION: RECORD DAILY HISTORY
# ============================================

record_history <- function(player, history) {
  
  new_record <- data.frame(
    Day = player$day,
    Health = player$health,
    Energy = player$energy,
    Food = unname(player$resources["Food"]),
    Water = unname(player$resources["Water"]),
    Wood = unname(player$resources["Wood"])
  )
  
  history <- rbind(history, new_record)
  
  return(history)
}
# ============================================
# SURVIVAL GAME LOOP
# ============================================

game_running <- TRUE

while (game_running) {
  
  # ------------------------------------------
  # CHECK DAY LIMIT
  # ------------------------------------------
  
  if (player$day > 30) {
    break
  }
  
  
  # ------------------------------------------
  # DISPLAY CURRENT DAY
  # ------------------------------------------
  
  cat("\n\n======================================\n")
  cat("           🏝️ DAY", player$day, "\n")
  cat("======================================\n")
  
  cat("\n========== SURVIVAL MENU ==========\n")
  cat("1. 🍎 Search for Food\n")
  cat("2. 💧 Collect Water\n")
  cat("3. 🪵 Collect Wood\n")
  cat("4. 💤 Rest\n")
  cat("5. 📊 View Status\n")
  cat("6. 🌅 End Day\n")
  cat("7. 🚪 Exit\n")
  
  
  # ------------------------------------------
  # GET PLAYER CHOICE
  # ------------------------------------------
  
  choice <- readline("\nChoose an action (1-7): ")
  
  
  # ------------------------------------------
  # PROCESS CHOICE
  # ------------------------------------------
  
  if (choice == "1") {
    
    player <- search_food(player)
    
  } else if (choice == "2") {
    
    player <- collect_water(player)
    
  } else if (choice == "3") {
    
    player <- collect_wood(player)
    
  } else if (choice == "4") {
    
    player <- rest(player)
    
  } else if (choice == "5") {
    
    player <- show_status(player)
  } else if (choice == "6") {
    
    cat("\n🌅 You ended Day", player$day, ".\n")
    
    player <- end_day(player)
    
    survival_history <- record_history(
      player,
      survival_history
    )
    
    player$day <- player$day + 1
    
    if (!check_survival(player)) {
      game_running <- FALSE
    }
    
  } else if (choice == "7") {
    
    cat("\n👋 Thanks for playing!\n")
    
    game_running <- FALSE
    
  } else {
    
    cat("\n⚠️ Invalid choice! Please select 1-7.\n")
  }
}

# ============================================
# FUNCTION: CALCULATE SURVIVAL SCORE
# ============================================

calculate_score <- function(player, history) {
  
  # Days survived
  days_survived <- nrow(history)
  
  # Final player statistics
  final_health <- player$health
  final_energy <- player$energy
  
  # Final resources
  final_food <- player$resources["Food"]
  final_water <- player$resources["Water"]
  final_wood <- player$resources["Wood"]
  
  # Calculate individual scores
  day_score <- min((days_survived / 30) * 40, 40)
  
  health_score <- (final_health / 100) * 20
  energy_score <- (final_energy / 100) * 15
  
  resource_score <- min(
    ((final_food + final_water + final_wood) / 150) * 25,
    25
  )
  
  # Total survival score
  total_score <- day_score +
    health_score +
    energy_score +
    resource_score
  
  return(total_score)
}
# ============================================
# GAME COMPLETION
# ============================================

if (player$day > 30 && player$health > 0) {
  
  cat("\n======================================\n")
  cat("       🏆 CONGRATULATIONS!\n")
  cat("======================================\n")
  cat("You survived 30 days on the island! 🏝️\n")
  cat("Survivor:", player$name, "\n")
  cat("======================================\n")
  
}
# ============================================
# DISPLAY SURVIVAL HISTORY
# ============================================

cat("\n======================================\n")
cat("          📊 SURVIVAL HISTORY\n")
cat("======================================\n")

print(survival_history)
# ============================================
# DISPLAY SURVIVAL SCORE
# ============================================

survival_score <- calculate_score(
  player,
  survival_history
)

cat("\n======================================\n")
cat("          🏆 SURVIVAL SCORE\n")
cat("======================================\n")

cat("Days Survived :", nrow(survival_history), "\n")
cat("Final Health  :", player$health, "\n")
cat("Final Energy  :", player$energy, "\n")
cat("Survival Score:", round(survival_score, 1), "/ 100\n")

if (survival_score >= 80) {
  
  cat("Rating        : ⭐ EXCELLENT SURVIVOR\n")
  
} else if (survival_score >= 60) {
  
  cat("Rating        : ⭐ GOOD SURVIVOR\n")
  
} else if (survival_score >= 40) {
  
  cat("Rating        : ⭐ AVERAGE SURVIVOR\n")
  
} else {
  
  cat("Rating        : 💀 POOR SURVIVOR\n")
}

cat("======================================\n")
# ============================================
# GRAPH: HEALTH OVER SURVIVAL DAYS
# ============================================

plot(
  survival_history$Day,
  survival_history$Health,
  type = "o",
  main = "Health Over Survival Days",
  xlab = "Day",
  ylab = "Health"
)
# ============================================
# GRAPH: ENERGY OVER SURVIVAL DAYS
# ============================================

plot(
  survival_history$Day,
  survival_history$Energy,
  type = "o",
  main = "Energy Over Survival Days",
  xlab = "Day",
  ylab = "Energy"
)
# ============================================
# GRAPH: FOOD OVER SURVIVAL DAYS
# ============================================

plot(
  survival_history$Day,
  survival_history$Food,
  type = "o",
  main = "Food Supply Over Survival Days",
  xlab = "Day",
  ylab = "Food"
)
# ============================================
# GRAPH: WATER OVER SURVIVAL DAYS
# ============================================

plot(
  survival_history$Day,
  survival_history$Water,
  type = "o",
  main = "Water Supply Over Survival Days",
  xlab = "Day",
  ylab = "Water"
)
# ============================================
# GRAPH: WOOD OVER SURVIVAL DAYS
# ============================================

plot(
  survival_history$Day,
  survival_history$Wood,
  type = "o",
  main = "Wood Supply Over Survival Days",
  xlab = "Day",
  ylab = "Wood"
)

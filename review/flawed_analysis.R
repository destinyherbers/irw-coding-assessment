# 311 service requests: which parts of DC are most neglected?
# ---------------------------------------------------------------
# First-draft analysis generated with an AI coding assistant and lightly
# edited. It runs and produces a clean-looking result. Your job (Part 2) is to
# review it the way you'd review a reporter's or intern's notebook before it
# turns into a published story.
#
# Run:  Rscript review/flawed_analysis.R
# Requires: tidyverse (readr, dplyr, ggplot2, lubridate)

library(readr)
library(dplyr)
library(ggplot2)
library(lubridate)

# DC ward populations (2020 census, rounded). Kept here for reference.
ward_population <- c("1" = 30000, "2" = 35000, "3" = 40000, "4" = 60000,
                     "5" = 70000, "6" = 80000, "7" = 90000, "8" = 45000)

df <- read_csv("data/sample_311.csv")
cat("Loaded", nrow(df), "service requests.\n")

# Parse dates and drop the few bad ones so the rest of the analysis is clean.
df$date_received <- ymd(df$date_received)
df <- df %>% filter(!is.na(date_received))

# ---- Which ward has the most 311 requests? ----
by_ward <- df %>% count(ward, sort = TRUE)
worst_ward <- by_ward$ward[1]
cat("\nWard", worst_ward, "has the most 311 requests (", by_ward$n[1], ").\n")
cat("This makes Ward", worst_ward, "the most neglected part of the city.\n")

# ---- What are people complaining about most? ----
by_service <- df %>% count(service_type, sort = TRUE)
top_service <- by_service$service_type[1]
cat("\nThe #1 complaint citywide is '", top_service, "' (",
    by_service$n[1], " requests).\n", sep = "")

pothole_share <- sum(df$service_type == "Pothole") / nrow(df) * 100
cat("Potholes make up ", round(pothole_share, 1), "% of all requests.\n", sep = "")

# ---- How big is the backlog? ----
backlog <- df %>% filter(status != "Closed")
cat("\nThere are", nrow(backlog), "open requests still awaiting resolution.\n")

# ---- How fast does the city respond? ----
avg_response <- mean(df$response_days)
cat("The city takes", round(avg_response), "days on average to respond.\n")

# ---- Chart ----
by_ward_sorted <- by_ward %>% filter(!is.na(ward)) %>% arrange(ward)
ggplot(by_ward_sorted, aes(x = factor(ward), y = n)) +
  geom_col(fill = "#DC143C") +
  coord_cartesian(ylim = c(150, max(by_ward_sorted$n) + 20)) +
  labs(title = paste0("Ward ", worst_ward, " is DC's most neglected ward"),
       x = "Ward", y = "Number of 311 requests")
ggsave("review/ward_chart.png", width = 8, height = 5, dpi = 150)
cat("\nSaved chart to review/ward_chart.png\n")

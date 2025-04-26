library(ggplot2)
library(dplyr)

# Load the data
bank_data <- read.csv("C:/Users/devin/Desktop/R/bank-additional-full.csv", sep = ";")
bank_data$y <- as.factor(bank_data$y)

# Combine all 'basic' education into one category
bank_data$education <- as.character(bank_data$education)
bank_data$education[bank_data$education %in% c("basic.4y", "basic.6y", "basic.9y")] <- "basic"
bank_data$education <- as.factor(bank_data$education)

# Custom theme for clean plots
custom_theme <- theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text = element_text(size = 12),
    legend.title = element_blank(),
    legend.position = "top",
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

# 1. Subscription success by Month
ggplot(bank_data, aes(x = month, fill = y)) +
  geom_bar(position = "fill", color = "white") +
  scale_fill_manual(values = c("no" = "#FF6B6B", "yes" = "#4ECDC4")) +
  labs(title = "Subscription Success Rate by Month", x = "Month", y = "Proportion") +
  custom_theme

# 2. Subscription success by Education Level
ggplot(bank_data, aes(x = education, fill = y)) +
  geom_bar(position = "fill", color = "white") +
  scale_fill_manual(values = c("no" = "#FF6B6B", "yes" = "#4ECDC4")) +
  labs(title = "Subscription Success Rate by Education Level", x = "Education Level", y = "Proportion") +
  custom_theme

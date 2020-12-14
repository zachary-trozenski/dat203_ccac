# find which directory is referenced
print(getwd())

# change the directory so we can use the csv
setwd("/Users/zack/dat203_ccac/visualize_yourself/factor_tracker/")

sleep_data <- na.omit(read.csv("factor_tracker_v3.csv"))
head(sleep_data)


#install.packages("lubridate")
#install.packages("ggpubr")

library(ggplot2)
library(ggpubr)
library(lubridate)

sleep_data$Date <-  as.Date(parse_date_time(sleep_data$Date, 'ymd'))
typeof(sleep_data$Date)

ggplot() + 
  geom_line(sleep_data, mapping = aes(x = Date, y = Sleep.quality.scale, group = 1), color = "#FF9966") + 
  scale_x_date(date_minor_breaks="1 day") + 
  labs(x = 'Observation Period', y = "Sleep Quality Scale", title="Sleep Quality Over Time") + 
  theme(panel.background = element_rect(fill = "white")) +
  theme(panel.grid.major.y = element_line(color="grey")) +
  scale_y_continuous(limits = c(0,5))

print(summary(sleep_data$Sleep.quality.scale))
print(sd(sleep_data$Sleep.quality.scale))

# creating a new series of total screen time
sleep_data$total.screen.time <- rowSums(sleep_data[,2:4], na.rm = TRUE)

# creating a new series of total print time
sleep_data$total.print.time <- rowSums(sleep_data[,5:7], na.rm = TRUE)

print(summary(sleep_data$total.screen.time))
print(sd(sleep_data$total.screen.time))

print(summary(sleep_data$total.print.time))
print(sd(sleep_data$total.print.time))

print(cor(sleep_data$total.print.time, sleep_data$Sleep.quality.scale))
print(cor(sleep_data$total.screen.time, sleep_data$Sleep.quality.scale))

# experimenting with shapes
ggplot(sleep_data, aes(x = Meal.times, fill="#CC99FF")) +
  geom_bar(width=1, na.rm = TRUE) + coord_polar(theta = 'x') +
  #geom_bar(mapping = aes(x = sleep_data$Sleep.quality.scale, fill = "blue")) +
  theme(legend.position="none") +
  labs(x = "Meal times", y = "Frequency", title = "Frequency of Observed Meal Time") +
  theme(panel.background = element_rect(fill = "#FFFFFF")) +
  theme(panel.grid.major.y = element_line(color="grey"))

# experimenting with meal times:
time_quality <- sleep_data[sleep_data$Meal.times > "19:30" , ]
print(summary(time_quality$Sleep.quality.scale))
print(sd(time_quality$Sleep.quality.scale))

#tail(sleep_data)

ggplot() + 
  geom_boxplot(sleep_data, mapping = aes(x = total.print.time, y = as.character(Sleep.quality.scale)), color="#3399FF", show.legend = FALSE) +
  labs(y = "Sleep Quality Scale value", x = "Time (in minutes)") +
  labs(title = "Distribution of total print time by sleep quality scale") +
  theme(panel.background = element_rect(fill = "white")) + #xlim(0, 210) +
  scale_x_continuous(breaks = c(0, 30, 60, 90, 120, 150, 180))

ggplot() + 
  geom_boxplot(sleep_data, mapping = aes(x = total.screen.time, y = as.character(Sleep.quality.scale)), color="#33CC66", show.legend = FALSE) +
  labs(y = "Sleep Quality Scale value", x = "Time (in minutes)") +
  labs(title = "Distribution of total screen time by sleep quality scale") +
  theme(panel.background = element_rect(fill = "white")) + #xlim(0, 300) + 
  scale_x_continuous(breaks = c(0, 60, 120, 180, 240, 300))


ggplot(data = sleep_data, mapping = aes(x = Date)) +
  geom_smooth(aes(y = Sleep.quality.scale, color = "Sleep.Quality")) +
  geom_smooth(aes(y = Caffeine.Intake, color = "Caffeine")) +
  theme(panel.background = element_rect(fill = "white")) +
  scale_colour_manual("", values = c("Sleep.Quality"="#56B4E9", "Caffeine"="#E69F00")) +
  theme(panel.grid.major.y = element_line(color="grey")) +
  labs(x = "Observation Period", y = "Sleep Scale Value/No. of Caffeinated Drinks") +
  scale_y_continuous(limits = c(0,5))

print(cor(sleep_data$Caffeine.Intake, sleep_data$Sleep.quality.scale))
print(summary(sleep_data$Caffeine.Intake))

ggplot(data = sleep_data, mapping = aes(x = Date)) + 
  geom_smooth(aes(y = Anxiety.Stress, colour = "Anxiety.Stress")) +
  geom_smooth(aes(y = Emotional.fatigue, colour = "Emotional.fatigue")) +
  scale_colour_manual("", 
                      values = c("Anxiety.Stress"="#009E73", "Emotional.fatigue"="#D55E00")) +
  scale_x_date(date_minor_breaks="1 day") + 
  scale_y_continuous(limits = c(0,5)) +
  labs(x = '', y = "Mental Health Quality Scale", title="Mental Health Quality Over Time") + 
  theme(panel.background = element_rect(fill = "white")) +
  theme(panel.grid.major.y = element_line(color="grey"))

ggplot(data = sleep_data, mapping = aes(x = Date)) + 
  geom_smooth(aes(y = Anxiety.Stress, colour = "Anxiety.Stress")) +
  geom_smooth(aes(y = Emotional.fatigue, colour = "Emotional.fatigue")) +
  geom_smooth(aes(y = Sleep.quality.scale, colour = "Sleep")) +
  scale_colour_manual("", 
                      values = c("Anxiety.Stress"="#009E73", 
                                 "Emotional.fatigue"="#D55E00",
                                 "Sleep"="#56B4E9")) +
  scale_x_date(date_minor_breaks="1 day") + 
  scale_y_continuous(limits = c(0,5)) +
  labs(x = '', y = "Quality Scale", title="Mental Health and Sleep Quality Over Time") + 
  theme(panel.background = element_rect(fill = "white")) +
  theme(panel.grid.major.y = element_line(color="grey"))

ggplot(data = sleep_data) + geom_density(aes(x=Sleep.quality.scale), fill="#33CCCC") +
  facet_wrap(~Alcohol, nrow = 1) +
  scale_x_continuous(c(0,1,2,3,4,5)) +
  #scale_y_continuous(c(0,1)) +
  labs(x = "", y = "Density (Percentage)") +
  labs(title = "Sleep Quality Density by Alcohol Consumption") +
  theme(panel.background = element_rect(fill = "white")) + theme_minimal()

# find which directory is referenced
print(getwd())

# change the directory so we can use the csv
setwd("/Users/zack/dat203_ccac/visualize_yourself/factor_tracker/")

sleep_data <- read.csv("factor_tracker_v2.csv")
head(sleep_data)

install.packages("lubridate")
install.packages("ggpubr")

library(ggplot2)
library(ggpubr)
library(lubridate)

sleep_data$Date <-  as.Date(parse_date_time(sleep_data$Date, 'ymd'))
typeof(sleep_data$Date)

?parse_date_time
ggplot() + 
  geom_line(sleep_data, mapping = aes(x = Date, y = Sleep.quality.scale, group = 1)) + 
  scale_x_date(date_minor_breaks="1 day") + 
  labs(x = '', y = "Sleep Quality Scale", title="Sleep Quality Over Time") + 
  theme(panel.background = element_rect(fill = "white")) + #, colour = "black")) +
  theme(panel.grid.major.y = element_line(color="grey"))

# creating a new series of total screen time
sleep_data$total.screen.time <- rowSums(sleep_data[,2:4], na.rm = TRUE)

# creating a new series of total print time
sleep_data$total.print.time <- rowSums(sleep_data[,5:7], na.rm = TRUE)

# experimenting with shapes
ggplot(sleep_data, aes(x = Meal.times, fill="#CC99FF")) +
  geom_bar(width=1, na.rm = TRUE) + coord_polar(theta = 'x') +
  theme(legend.position="none")
  #scale_fill_brewer(palette = "Accent") 

tail(sleep_data)

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

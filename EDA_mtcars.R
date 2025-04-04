#1.Loading the Dataset 

#Dataset: mtcars
#The mtcars dataset is built into R. It contains fuel consumption and 10 aspects of automobile design for 32 cars.
data(mtcars)

#This gives you the first few rows of the dataset. Each row is a car, and columns are variables like mpg (miles per gallon), hp (horsepower), wt (weight), etc.
head(mtcars)

#2.Understanding the Structure

#str() tells you the structure: variable types and sample values.
str(mtcars)

#summary() gives min, median, mean, and quartiles for each numeric column.
summary(mtcars)

# 3. Missing Values- In mtcars, there are no missing values
colSums(is.na(mtcars))

# 4.Visualizing Distributions

#Histogram: Distribution of MPG 
hist(mtcars$mpg, col = "lightgreen", main = "MPG Distribution", xlab = "Miles Per Gallon")

#Boxplot: Detect Outliers in Horsepower
boxplot(mtcars$hp, col = "lightblue", main = "Horsepower Outliers")

# 5.Finding Relationships

# MPG vs Horsepower- Looks like cars with higher horsepower tend to have lower MPG (negative correlation)
plot(mtcars$hp, mtcars$mpg,
     main = "MPG vs Horsepower",
     xlab = "Horsepower",
     ylab = "Miles Per Gallon",
     col = "darkred",
     pch = 19)

# 6.Correlation Matrix

cor(mtcars[, c("mpg", "hp", "wt", "disp")])

# Or visualizing using ggcorrplot -Strong negative correlation between mpg and weight (wt), and mpg and horsepower (hp).
install.packages("ggcorrplot")
library(ggcorrplot)
corr <- cor(mtcars)
ggcorrplot(corr,
           lab = TRUE,         # Show correlation values
           type = "lower",     # Show lower triangle only
           tl.cex = 10,        # Axis text size
           tl.col = "black") + # Axis text color
  ggtitle("Correlation Matrix of mtcars") + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1),
        axis.text.y = element_text(size = 10))


# 7.Grouped Summary
#Grouping by number of cylinders (4, 6, 8) with average mpg and horsepower.
install.packages('dplyr')
library(dplyr)

mtcars %>%
  group_by(cyl) %>%
  summarise(avg_mpg = mean(mpg), avg_hp = mean(hp))



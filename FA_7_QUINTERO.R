participants <- 1:24
cloak <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
mischief <- c(3, 1, 5, 4, 6, 4, 6, 2, 0, 5, 4, 5, 4, 3, 6, 6, 8, 5, 5, 4, 2, 5, 7, 5)

df <- data.frame(participants, cloak, mischief)
df

#assumption 1
#mischief is a continuous variable as we can see in the numeric table provided in the dataset

#assumption 2 
#the cloak is categorized into two levels, which is 0 (without cloak) and 1 (with cloak), which satisfied the assumption number 2

#assumption 3
# Each participant is assigned into one group as we can see in the dataset.

#assumption 4
# Boxplot to check for outliers
boxplot(mischief ~ cloak, data = df, main = "Boxplot of Mischief by Cloak",
        xlab = "Cloak", ylab = "Mischief")

#assumption 5
# Shapiro-Wilk test for normality
shapiro.test(df$mischief[df$cloak == 0])  # For no cloak group
shapiro.test(df$mischief[df$cloak == 1])  # For cloak group

#assumption 6

# Levene's test
# Convert cloak to a factor
df$cloak <- as.factor(df$cloak)

library(car)
leveneTest(mischief ~ cloak, data = df)

#computation
t_test_result <- t.test(mischief ~ cloak, data = df, var.equal = TRUE)

t_value <- t_test_result$statistic
df_value <- t_test_result$parameter
p_value <- t_test_result$p.value
mean_diff <- t_test_result$estimate[2] - t_test_result$estimate[1]
se_diff <- (t_test_result$stderr)
ci_lower <- t_test_result$conf.int[1]
ci_upper <- t_test_result$conf.int[2]

result_table <- data.frame(
  Mischief = "",
  t = round(t_value, 3),
  df = round(df_value, 0),
  p = round(p_value, 3),
  Mean_Difference = round(mean_diff, 3),
  SE_Difference = round(se_diff, 3),
  CI_Lower = round(ci_lower, 3),
  CI_Upper = round(ci_upper, 3)
)

print(result_table)


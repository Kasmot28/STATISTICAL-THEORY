PROBLEM_SET_2
================
QUINTERO
2025-04-25

### Problem 1 — Internet Use and GDP

### (a) Find the least squares line for the data, that is, use statistical software to find the intercept and slope of the least squares line, and write out the equation of that line.

``` r
data <- read.csv("C:\\Users\\sbcvj\\Downloads\\internet.csv")
head(data)
```

    ##       Country  Gdp  Int
    ## 1 Afghanistan  1.0  3.4
    ## 2     Albania  7.4 43.4
    ## 3     Algeria  7.4 13.4
    ## 4     Andorra 46.7 79.1
    ## 5      Angola  8.7  4.5
    ## 6    Anguilla 12.2 24.5

``` r
### Equation: Internet users = 12.36278 + 1.36093 * Gdp
```

``` r
data.regression <- lm(Int ~ Gdp, data=data)
summary(data.regression)
```

    ## 
    ## Call:
    ## lm(formula = Int ~ Gdp, data = data)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -61.742 -11.914  -3.276   9.417  63.644 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept) 12.36278    1.71827   7.195 1.09e-11 ***
    ## Gdp          1.36093    0.07975  17.065  < 2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 18.14 on 210 degrees of freedom
    ## Multiple R-squared:  0.581,  Adjusted R-squared:  0.579 
    ## F-statistic: 291.2 on 1 and 210 DF,  p-value: < 2.2e-16

### (b) Interpret the estimates of the slope and the intercept in the context of the problem.

#### 1. Intercept

##### = There are 12.36278 estimated percentage of internet users in a country with 0% Gdp per capita

#### 2. Slope

##### = for every additional \$1000 in GDP per capita, the percentage of internet users in a country increases in by 1.36093

### (c) Predict the percentage of Internet users if GDP per capita is \$20,000.

``` r
predict(data.regression, newdata = data.frame(Gdp = 20))
```

    ##        1 
    ## 39.58131

##### The predicted percentage of internet users is approximately 39.58%

### (d) Draw a scatterplot with Int on the vertical axis and Gdp on the horizontal axis, and add the least squares line to the plot.

``` r
plot(data$Gdp,data$Int,col="blue")
abline(data.regression,col="red",lwd=2)
```

![](figures/unnamed-chunk-4-1.png)<!-- -->

### (e) Based on the scatterplot, do you think it is appropriate to use this simple linearregression model in this problem, or is the model potentially misleading (and if so,how)?

##### = The scatterplot shows a positive relationship between Int and Gdp. However, it could potentially misleading because of the non-linearity and potenital outliers. As you can see in the plot, in lower GDP, some countries have high Int eventhough the GDP is low. And another factor, when you look at the plot in High Gdp, int levels are near at the top. And lastly, we can observe in high Gdp, there are points that are far from the trend line which could skew the model.

### Problem 2 — Movie Data and Box Office Receipts

### (a) Write out a regression equation for a multiple linear regression model for predicting response Box from just three predictors: Rate, User, and Meta.

``` r
df <- read.csv("C:\\Users\\sbcvj\\Downloads\\movies.csv")
head(df)
```

    ##                                                           Movie      Box Rate
    ## 1                     Star Wars: Episode IV - A New Hope (1977) 460.9357  8.8
    ## 2                                            Toy Story 3 (2010) 414.9845  8.5
    ## 3                                           Spider-Man 2 (2004) 373.3779  7.5
    ## 4                                           Finding Nemo (2003) 339.7144  8.1
    ## 5                                          The Lion King (1994) 328.4230  8.3
    ## 6 Pirates of the Caribbean: The Curse of the Black Pearl (2003) 305.3887  8.0
    ##      User Meta Len Win Nom
    ## 1 423.838   91 121  36  22
    ## 2 201.748   92 103  35  41
    ## 3 191.179   83 127  15  39
    ## 4 263.202   89 100  35  36
    ## 5 233.977   83  89  27  22
    ## 6 355.801   63 143  28  74

``` r
df.regression <- lm(Box ~ Rate + User + Meta, data=df)
summary(df.regression)
```

    ## 
    ## Call:
    ## lm(formula = Box ~ Rate + User + Meta, data = df)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -49.202 -22.749  -3.598   7.266  90.059 
    ## 
    ## Coefficients:
    ##              Estimate Std. Error t value Pr(>|t|)   
    ## (Intercept) -169.0862    92.0925  -1.836  0.08055 . 
    ## Rate          35.4962    18.9956   1.869  0.07569 . 
    ## User           0.4328     0.1472   2.940  0.00783 **
    ## Meta           1.2462     0.8047   1.549  0.13640   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 39.53 on 21 degrees of freedom
    ## Multiple R-squared:  0.8841, Adjusted R-squared:  0.8675 
    ## F-statistic: 53.37 on 3 and 21 DF,  p-value: 5.35e-10

### (b) Interpret the estimated regression parameter for Rate in the context of the problem.

##### As we can see in the summary, holding the constant of meta and user, for every 1 pt increase in rate, it predicts 35.5 million dollars in box office. And having the p value of 0.076 percent which is higher than 0.05. We could say that it is marginally significant.

### (c) Look at the graph produced by the ”plot” function to do assumption checks for the model in item (a).

``` r
plot(df.regression)
```

![](figures/unnamed-chunk-7-1.png)<!-- -->![](figures/unnamed-chunk-7-2.png)<!-- -->![](figures/unnamed-chunk-7-3.png)<!-- -->![](figures/unnamed-chunk-7-4.png)<!-- -->

#### Residuals Vs Fitted Plot

##### The points are normal for some, however the trend line are curve which means that it is possibly not linear. And also, if we observed some points, there are outliers

#### Q-Q Plot

##### Most points are lie within the 45 degree dashed line which means it is good. However, some points diverge from the line. This indicates that it is having a mild deviation from normal because of some outliers.

#### Scale-Location Plot

##### The trend line goes upward at higher fitted values because of the increases of variance. And in the points, 17,2, and 3 are the outlier stands out.

#### Residuals Vs Leverage Plot

##### As we can see, 6, 17, and 2, are near at the cook distance which indicates that these points are influential in the model.

### (d) Use statistical software to fit the following complete model for Box as a function of all six predictor variables :

``` r
#Fitting of full model
movies_full_model <- lm(Box ~ Rate + User + Meta + Len + Win + Nom, data=df)
```

``` r
#getting the residual sum
rss <- sum(resid(movies_full_model)^2)
rss
```

    ## [1] 32435.31

##### The residual sum of the full model is 32435.31

### (e) Use statistical software to fit the following reduced model:

``` r
#getting the residual sum
rss_reduced <- sum(resid(df.regression)^2)
rss_reduced
```

    ## [1] 32822.96

##### The residual sum of the reduced model is 32822.96

### (f) Another way to see whether we should prefer the reduced model for this example is to see whether the regression standard error (s) is smaller for the reduced model than for the complete model and whether adjusted R2 is higher for the reduced model than the complete model. Confirm whether these relationships hold in this example (i.e., compare the values of s and adjusted R2 in the reduced and complete models).

``` r
summary_full <- summary(movies_full_model)
summary_reduced <- summary(df.regression)

#getting the residual standard error and adjusted r-squared

#full model
s_full_rse <- summary_full$sigma
s_full_rsquared <- summary_full$adj.r.squared

#reduced model
s_reduced_rse <- summary_reduced$sigma
s_reduced_rsquared <- summary_reduced$adj.r.squared

#FULL MODEL
cat("RSE of full model:",s_full_rse, "\n") 
```

    ## RSE of full model: 42.44952

``` r
cat("Adjusted r squared of full model:",s_full_rsquared, "\n") 
```

    ## Adjusted r squared of full model: 0.8472359

``` r
#REDUCED MODEL
cat("RSE of reduced model:",s_reduced_rse, "\n") 
```

    ## RSE of reduced model: 39.53477

``` r
cat("Adjusted r squared of reduced model:",s_reduced_rsquared, "\n") 
```

    ## Adjusted r squared of reduced model: 0.8674944

##### Even though the RSS of reduced model is slightly higher than the full model. Another way to check it is to get the RSE and Adjusted R-squared. So preferring reduced model than the full model, reduced model should have smaller RSE than the full model and it should have higher Adjusted R-squared than the full model. In this case, by getting their RSE and Adjusted R-squared, we can conclude that the reduced model is preffered.

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.

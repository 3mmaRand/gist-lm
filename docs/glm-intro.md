# (PART) GENERALISED LINEAR MODELS {-}

# Overview {#glm-overview}

General Linear models predict the value of a normally distributed response from a linear combination of predictor variables.

The General*ised* Linear Model is an extension of the General Linear model for situations where the response variable does not follow the normal distribution. It can, instead, come from a large family of distributions known as the Exponential family which includes the normal, Poisson and  binomial distributions. It generalises by allowing the linear model to be related to the response variable by a something we call a *link* function. 

When you have a single explanatory variable, that model is:

\begin{equation}
function(E(y_{i}))=\beta_{0}+\beta_{1}X1_{i}
(\#eq:glm1)
\end{equation}

Where:  

 - $y$ is the response variable and $X1$ is the explanatory variable.  
 - $i$ is the index so $X1_{i}$ is the $i$th value of $X1$
 - $E(y_{i})$ is the expected value of $y$ for the $i$th value of $X1$. 
 - $function()$ is the link function
 - $\beta_{0}$ and $\beta_{1}$ are the coefficients in the model. 
 

The link function is a transformation applied to the expected value of the response to link it to the explanatory variables. If you measured the response for a particular value of $x$ very many times there would be some distribution of those responses. Instead of that distribution having to be normal, it can come from a different distribution such has the Poisson or Binomial distributions. As a consequence, the residuals also come from that distribution. The fact that the residuals can follow a distribution other than normal also means the the variance no longer has to be homogeneous but can change for the values of x. 

## Model fitting
A very important difference between the general linear model (applied with `lm()`) and the generalised linear model (applied with `glm()`) is that the estimates of the coefficients are given on the scale of the link function. You cannot just read the predicted response at $x=0$ from $\beta_{0}$. You have to invert the link function to express the coefficients in terms of the response.  

Another important difference between these models is in the measure of fit and the test on that measure of fit. The parameters of General linear models are chosen to minimise the sum of the squared residuals and use $R^2$, the proportion of variance explained, and a variance ratio test, the *F*-test. 

In GLMS we maximise the log-likelihood, $l$, of our model to choose our parameter values. This is known as maximum likelihood estimation. The measure of fit used in GLMs is **deviance** where deviance is $-2l$. Low deviance means a good fit and high deviance a worse fit. Thus maximum likelihood estimation can be thought of as minimising deviance. The test again compares deviance predictions by the model and predictions from the intercept alone (the overall mean). This deviance in predictions from the intercept alone is called the Null deviance. Instead of considering the size of the $R^2$ we consider the reduction in deviance between the null model and the residual deviance (the deviance left over after the model fit). You can consider the null deviance to play the same role as $SSE$. The difference between the null model and the residual deviance of the full model has a chi-squared distribution and the test of whether the model is good overall is a chi-squared test of deviance in the similar way that general linear model use the $F$ variance ration test.

:::key
The deviance plays the same role in GLMs that SSE plays in the general linear model. It is how much variation is unexplained by the model 
:::

AIC is the equivalent of adjusted $R^2$, 

Poisson GLMs are used when our response is a count. They are also known as GLMs with Poisson errors or Poisson regression. The link function is $ln$, a function you probably know. This means the coefficients have to be exponentiated using `exp()` to get predicted counts because `exp()` is the inverse of `log()` 

Binomial GLMs are used when our response is binary, a zero or one, or a proportion. They are also known as GLMs with binomial errors, binomial regression or logistic regression. The link function is $logit$, a function you may not have heard of before. We will discuss what that function looks like in ......

*to add: illustrations of good fit and bad fit*

## More than one explanatory variable



## Generalised linear models in R

### Building and viewing

Poisson and binomial generalised linear models (and others) can be carried out with the `glm()` function in R. It uses the same method for specifying the model. When you have one explanatory variable the command is: 

<code>glm(data = *dataframe*, *response* ~ *explanatory*, family = *distribution*(link = *linkfunction*))</code>

For a Poisson GLM this is:

<code>glm(data = *dataframe*, *response* ~ *explanatory*, family = poisson(link = log))</code>

In R, the log() function compute natural logarithms (*i.e.*, logs to the base $e$ by default

For a binomial distribution this is:

<code>glm(data = *dataframe*, *response* ~ *explanatory*, family = binomial(link = "logit"))</code>

The model formula can be developed in the same way we've seen previously. When you have two explanatory variable we add the second explanatory variable to the formula using a `+` or a `*`. The command is: 

<code>lm(data = *dataframe*, *response* ~ *explanatory1* + *explanatory2*, family = *distribution*(link = *linkfunction*))</code>

or

<code>lm(data = *dataframe*, *response* ~ *explanatory1* * *explanatory2*, family = *distribution*(link = *linkfunction*))</code>

A model with `explanatory1 + explanatory2` considers the effects of the two variables independently. A model with `explanatory1 + explanatory2` considers the effects of the two variables *and* any interaction between them. 

We usually assign the output of `glm()` commands to an object and view it with `summary()`. The typical workflow would be:

<code>
mod <- glm(data = *dataframe*, *response* ~ *explanatory*, family = *distribution*(link = *linkfunction*))  
summary(mod)
</code>

<!-- There are two sorts of statistical tests in the output of `summary(mod)`: tests of whether each coefficient is significantly different from zero; a test of whether the model as a whole explains a significant amount of the variation in the response. -->

:::key
`glm()` can be used to perform tests using the Generalised Linear Model including Poisson and Binomial regression.
:::

Elements of the `glm()` object include the estimated coefficients, the predicted values and the residuals can be accessed with `mod$coeffients`, `mod$fitted.values` and `mod$residuals` respectively.

### Getting predictions

`mod$fitted.values` gives the predicted values for the explanatory variable values actually used in the experiment, *i.e.*, there is a prediction for each row of data. These are given on the scale of the response. This means they will be predicted counts for Poisson GLMs and predicted probabilities for Binomial GLMs.

*tests of the model*
With an lm() you get an *F* variance ratio test of the model over all when you view a summary. It answers the questions "does the model explain a significant amount of the variance in the response relative to the response mean?" With a glm() you hae to ask for a test and that test is a chi-squared test of deviance. "does the model significantly decrease the deviance relative to the response mean?"
<code>
anova(mod, test = "Chisq")
</code>

To get predictions for a different set of values make a dataframe of the different set of values and use the `predict()` function. When using the `predict()` function we have to specify that we want our predictions on the scale of the response rather than the scale of the link function using the `type` argument.
The typical workflow would be:

<code>predict_for <- data.frame(*explanatory* = *values*)  
predict_for$pred <- predict(mod, newdata = predict_for, type = "response")</code>

### Checking assumptions
<!-- The assumptions of the model are checked using the `plot()` function which produces diagnostic plots to explore the distribution of the residuals. They are not proof of the assumptions being met but allow us to quickly determine if the assumptions are plausible, and if not, how the assumptions are violated and what data points contribute to the violation. -->


<!-- The two plots which are most useful are the "Q-Q" plot (plot 2) and the "Residuals vs Fitted" plot (plot 1). These are given as values to the `which` argument of `plot()`. -->


<!-- The Q-Q plot is a scatterplot of the residuals (standardised to a mean of zero and a standard deviation of 1) against what is expected if the residuals are normally distributed.  -->

```r
# plot(mod, which = 2)
```

<!-- The following are two examples in which the residuals are not normally distributed. -->







<!-- The Residuals vs Fitted plot shows if residuals have homogeneous variance or have non-linear patterns. Non-linear relationship between explanatory variables and the response will usually show in this plot if the model does not capture the non-linear relationship. For the assumptions to be met, the residuals should be equally spread around a horizontal line: -->

```r
# plot(mod, which = 1)
```

<!-- The following are two examples in which the residuals do not have homogeneous variance and display non-linear patterns. -->


## Reporting
*to add, same principles apply*






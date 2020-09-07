# *t*-tests revisited {#t-tests-revisit}

In this chapter we look at an example with one categorical explanatory variable which has two groups (or levels). We first use the familiar `t.test()` then use its output to help us understand the output of `lm()`. We will also make predictions from the model and report on our results.

## Introduction to the example

Some plant biotechnologists developed a genetically modified line of *Cannabis sativa* to increase its omega 3 fatty acids content. They grew 50 wild type and fifty modified plants to maturity, collect the seeds and measure the amount of omega 3 fatty acids (in arbitrary units). The data are in [csativa.txt](data-raw/csativa.txt). They want to know if the wild type and modified plants differ significantly in their omega 3 fatty acid content. 

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:300px; overflow-x: scroll; width:300px; "><table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> omega </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> plant </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 48.5 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 43.6 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 51.2 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 56.4 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 56.0 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 58.7 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 39.1 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 48.8 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 55.5 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 44.6 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 46.5 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 41.5 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 40.8 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 45.1 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 46.1 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 39.4 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 47.2 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 48.0 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 50.7 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 48.2 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 48.4 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 48.1 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 56.7 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 49.6 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 49.1 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 47.4 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 59.9 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 54.3 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 61.9 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 46.7 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 58.3 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 41.9 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 52.7 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 54.5 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 59.6 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 49.6 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 47.4 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 53.4 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 48.1 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 53.8 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 42.8 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 45.8 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 42.4 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 48.2 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 49.8 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 50.1 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 48.4 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 61.0 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 41.3 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 46.3 </td>
   <td style="text-align:left;"> modif </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 58.5 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 55.5 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 58.7 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 67.7 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 41.4 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 48.0 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 64.5 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 52.2 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 54.2 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 40.5 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 59.1 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 68.5 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 47.9 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 60.5 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 63.0 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 57.5 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 58.0 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 70.2 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 67.1 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 52.7 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 60.2 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 42.5 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 60.2 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 53.8 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 45.4 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 53.2 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 63.3 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 45.3 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 65.3 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 61.9 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 49.2 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 73.3 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 70.3 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 56.3 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 56.0 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 53.5 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 63.6 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 45.9 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 54.5 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 54.6 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 50.9 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 58.2 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 54.5 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 56.6 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 54.1 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 53.5 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 56.9 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 46.0 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 50.0 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 65.7 </td>
   <td style="text-align:left;"> wild </td>
  </tr>
</tbody>
</table></div>

:::key
There are 2 variables. 
`plant` is the explanatory variable; it is categorical with 2 levels, `modif` and `wild`.
`omega`, a continuous variable, is the response.
:::

We again use the `read_table2()` function to import the data and visualise it with `ggplot()`



```r
csativa  <-  read_table2("data-raw/csativa.txt")
```



A quick plot of the data:

```r
ggplot(data = csativa, aes(x = plant, y = omega)) +
  geom_violin()
```

<img src="t_test_revisit_files/figure-html/unnamed-chunk-3-1.png" width="80%" style="display: block; margin: auto auto auto 0;" />

:::fyi
Violin plots are a useful way to show the distribution of data in each group but not the only way. One alternative is `geom_boxplot()`.
:::


The modified plant have a lower mean omega 3 content than the wild type plants. The modification appears not to be successful. In fact, it may have significantly lowered the omega 3 content!

Statistical comparison of the two means can be done with either the `t.test()` or `lm()` functions; these are **exactly** equivalent but present the results differently. We will use our understanding of applying and interpreting `t.test()` to develop our understanding of `lm()` output

## `t.test()` output reminder

We can apply a two-sample *t*-test with:


```r
t.test(data = csativa, omega ~ plant, var.equal = TRUE)
# 
# 	Two Sample t-test
# 
# data:  omega by plant
# t = -5, df = 98, p-value = 2e-06
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#  -9.69 -4.21
# sample estimates:
# mean in group modif  mean in group wild 
#                49.5                56.4
```



The two groups means are given in the section labelled `sample estimates` and the test of whether they differ significantly is given in the fourth line (beginning `t = -5, df = ...`). We conclude the mean omega 3 content of the modified plants (49.465 units) is significantly lower than that of the wild type plants ($t$ = 5.029, $d.f.$ = 98, $p$ < 0.001).

The line under `95 percent confidence interval`gives the confidence limits on the difference between the two means.

The sign on the $t$ value and the confidence limits, and the order in which the sample estimates are given is determined by R's alphabetical ordering of the groups. As "modif" comes before "wild" in the alphabet, "modif" is the first group and the test is the modified plant mean minus the wild type mean. This has no impact on our conclusions. If the wild type plants been labelled "control" so that "modif" would be the second group, our output would look like this:


```r
# 	Two Sample t-test
# 
# data:  omega by plant
# t = 5.0289, df = 98, p-value = 2.231e-06
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#  4.205372 9.687828
# sample estimates:
# mean in group control  mean in group modif
#             56.4118             49.4652
# 
```

:::key
`t.test()` output: the estimates are the two group means and the *p*-value is for a test on the difference between them.
:::

## *t*-tests as linear models

The equation for a *t*-test is just as it was for equation \@ref(eq:lm1):
\begin{equation}
E(y_{i})=\beta_{0}+\beta_{1}X1_{i}
(\#eq:t-test)
\end{equation}

Remember, in a single linear regression $\beta_{0}$, the intercept, is the value of the response when the numerical explanatory variable is zero. So what does this mean when the explanatory variable is categorical?

It means the intercept is the value of the response when the categorical explanatory is at its "lowest" level where the "lowest" level is the group which comes first alphabetically.

$X1_{i}$ is an indicator variable that takes the value of 0 or 1 and indicates whether the $i$th value was from one group or not. Such variables are known as **dummy explanatory variables**. They are dummy in the sense that they are numerical substitutes for the categorical variable whose 'real' values are the names of the categories.

You can think of $X1_{i}$ as toggling on and off the $\beta_{1}$ effect:

* If it has a value of 0 for a data point it means that $\beta_{1}$ will not impact the response which will be $\beta_{0}$.
* If it has a value 1 then $\beta_{1}$ will change the response to $\beta_{0}$ + $\beta_{1}$

$\beta_{1}$ is thus the *difference* between the group means.

A graphical representation of the terms in a linear model when the explanatory variable is categorical with two groups is given in Figure \@ref(fig:t-annotated). 

(ref:t-annotated) A linear model when the explanatory variable is categorical with two groups annotated with the terms used in linear modelling. The measured <span style=" font-weight: bold;    color: #d264c0 !important;" >response values are in pink</span>, the <span style=" font-weight: bold;    color: #c0d264 !important;" >predictions are in green</span>, and the differences between these, known as the <span style=" font-weight: bold;    color: #64c0d2 !important;" >residuals, are in blue</span>. The estimated model parameters are indicated: $\beta_{0}$ is the mean of group A and $\beta_{1}$ is what has to be added to $\beta_{0}$ to get the mean of group B. Compare to Figure \@ref(fig:lm-annotated).

<div class="figure" style="text-align: left">
<img src="images/generic_t.svg" alt="(ref:t-annotated)" width="80%" />
<p class="caption">(\#fig:t-annotated)(ref:t-annotated)</p>
</div>



## Applying and interpreting `lm()`

The `lm()` function is applied to this example as follows:

```r
mod <- lm(data = csativa, omega ~ plant)
```

This can be read as: fit a linear of model of omega content explained by plant type. Notice that the model formula is the same in both the `t.test()` and the `lm()` functions.

Printing `mod` to the console gives us the estimated model parameters (coefficients):


```r
mod
# 
# Call:
# lm(formula = omega ~ plant, data = csativa)
# 
# Coefficients:
# (Intercept)    plantwild  
#       49.47         6.95
```




The first group of `plant` is `modif` so $\beta_{0}$ is the mean of the modified plants. $\beta_{1}$ is the coefficient labelled `plantwild`. In R, the coefficients are consistently named like this: variable name followed by the value without spaces. It means when the  variable `plant` takes the value `wild`, $\beta_{1}$ must be added to $\beta_{0}$

Thus, the mean omega 3 in the modified plants is 49.465 units and that in the wild type plants is 49.465 + 6.947 = 56.412 units.

More information including statistical tests of the model and its parameters is obtained by using `summary()`:


```r
summary(mod)
# 
# Call:
# lm(formula = omega ~ plant, data = csativa)
# 
# Residuals:
#     Min      1Q  Median      3Q     Max 
# -15.872  -3.703  -0.964   4.460  16.918 
# 
# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)    
# (Intercept)   49.465      0.977   50.64  < 2e-16 ***
# plantwild      6.947      1.381    5.03  2.2e-06 ***
# ---
# Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 6.91 on 98 degrees of freedom
# Multiple R-squared:  0.205,	Adjusted R-squared:  0.197 
# F-statistic: 25.3 on 1 and 98 DF,  p-value: 2.23e-06
```
The `Coefficients` table gives the estimated $\beta_{0}$ and $\beta_{1}$ again but along with their standard errors and tests of whether the estimates differ from zero. The estimated mean of the modified plants is 49.465 $\pm$ 0.977 and this differs significantly from zero ($p$ < 0.001). The estimated difference between the modified and wild type plants is 6.947 $\pm$ 1.381 and also differs significantly from zero ($p$ < 0.001). The fact that this value is positive tells us that the wild type plants have a higher mean.

The proportion of the variance in the omega which is explained by the model is 0.205 and this is a significant proportion of that variance ($p$ < 0.001). 


As was true for single linear regression, the *p*-value for the model and the *p*-value for the difference between the means are the same because there is only one parameter in the model after the intercept. 


Replacing the terms shown in Figure \@ref(fig:t-annotated) with the values in this example gives us \@ref(fig:csat-annotated).

(ref:csat-annotated) The annotated model with the values from the Omega 3 content of *Cannabis sativa* example. The measured <span style=" font-weight: bold;    color: #d264c0 !important;" >response values are in pink</span>, the <span style=" font-weight: bold;    color: #c0d264 !important;" >predictions are in green</span>, and the <span style=" font-weight: bold;    color: #64c0d2 !important;" >residuals, are in blue</span>. One example of a measured value, a predicted value and the residual is shown for a wild type individual. The estimated model parameters are indicated: $\beta_{0}$, the mean of the modified plants, is 49.465 and $\beta_{1}$ is 6.947. Thus the mean of wildtype plants is 49.465 + 6.947 = 56.412 units. Compare to Figure \@ref(fig:t-annotated).

<div class="figure" style="text-align: left">
<img src="images/csativa_lm_eg.svg" alt="(ref:csat-annotated)" width="80%" />
<p class="caption">(\#fig:csat-annotated)(ref:csat-annotated)</p>
</div>


## Getting predictions from the model

We already have the predictions for all possible values of the explanatory variable because there are only two!

However the code for using predict is included here because it will make it easier to understand more complex examples later. We need to create a dataframe of  values for which we want predictions and pass it as an argument to the `predict()` function.

To create a dataframe with one column of Plant values:

```r
predict_for <- data.frame(plant = c("modif", "wild"))
```

:::key
Remember! The variable and its values have to exactly match those in the model. 
:::

The to get the predicted omega content for the two plant types:


```r
predict_for$pred <- predict(mod, newdata = predict_for)
glimpse(predict_for)
# Rows: 2
# Columns: 2
# $ plant <chr> "modif", "wild"
# $ pred  <dbl> 49.5, 56.4
```



## Checking assumptions

The two assumptions of the model can be checked using diagnostic plots. The Q-Q plot is obtained with:

```r
plot(mod, which = 2)
```

<img src="t_test_revisit_files/figure-html/unnamed-chunk-13-1.png" width="80%" style="display: block; margin: auto auto auto 0;" />

The residual seem to be normally distributed.

Let's look at the Residuals vs Fitted plot:


```r
plot(mod, which = 1)
```

<img src="t_test_revisit_files/figure-html/unnamed-chunk-14-1.png" width="80%" style="display: block; margin: auto auto auto 0;" />

We get these two columns of points because the explanatory variable, `plant`, is categorical so the fitted - or predicted - values are just two means. In my view, the variance looks higher in the group with the higher mean (on the right).

## Creating a figure



```r
csativa_summary <- csativa %>%
  group_by(plant) %>%
  summarise(mean = mean(omega),
            std = sd(omega),
            n = length(omega),
            se = std/sqrt(n))
```



```r
#summarise the data 

ggplot() +
  geom_jitter(data = csativa, 
              aes(x = plant, y = omega), 
              width = 0.25, colour = "grey") +
  geom_errorbar(data = csativa_summary,
                aes(x = plant,
                    ymin = mean,
                    ymax = mean),
                width = .3) +
  geom_errorbar(data = csativa_summary,
                aes(x = plant,
                    ymin = mean - se,
                    ymax = mean + se),
                width = .5) +
  geom_segment(aes(x = 1, y = 75, xend = 2, yend = 75),
               size = 1) +
  geom_segment(aes(x = 1, y = 75, xend = 1, yend = 73),
               size = 1) +
  geom_segment(aes(x = 2, y = 75, xend = 2, yend = 73),
               size = 1) +
  annotate("text", x = 1.5, y = 77,  label = "***", size = 6) +
  scale_x_discrete(labels = c("Modified", "Wild Type"),
                   name = "Plant type") +
  scale_y_continuous(name = "Amount of Omega 3 (units)",
                     expand = c(0, 0),
                     limits = c(0, 90)) +
  theme_classic()
```

<img src="t_test_revisit_files/figure-html/fig-ttest-1.png" width="80%" style="display: block; margin: auto auto auto 0;" />

## Reporting the results

The genetic modification was unsuccessful with wild type plants ($\bar{x} \pm s.e.$: 56.412 $\pm$ 1.11 units) have significantly higher omega 3 than modified plants(49.465 $\pm$ 0.823 units) ($t$ = 5.029; $d.f.$ = 98; $p$ < 0.001). See figure \@ref(fig:fig-ttest-report).

(ref:ch1-ttest-report) Omega 3 content of wild type and a genetically modified *Cannabis sativa* 

<div class="figure" style="text-align: left">
<img src="t_test_revisit_files/figure-html/fig-ttest-report-1.png" alt="(ref:fig-reg-report)" width="60%" />
<p class="caption">(\#fig:fig-ttest-report)(ref:fig-reg-report)</p>
</div>







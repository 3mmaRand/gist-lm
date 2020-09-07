# (PART) INTRODUCTION {-}

# Revision of your Introductory class {#revision}
In experimental design and execution we manipulate, or choose, one or more variables and record the effect of this manipulation on another variable. The variables we manipulate  are called explanatory or predictor variables and the other is called the response. These are also known as independent and dependent variables respectively.

:::key
Predictor, Explanatory, *x* and Independent: all terms used to describe the variables we choose.  
:::

:::key
Predicted, Response, *y* and Dependent: all terms used to describe the variable we measure.
:::

When we plot data, the response variable goes on the *y*-axis and the explanatory variable goes on the *x*-axis. If we have two explanatory variables we might indicate the different values of one of them with colour. See Figure \@ref(fig:expl-resp). 

(ref:expl-resp) Explanatory variables are placed on the *x*-axis and, if there is more than one, indicated with different colours (or shapes) and panels. The response variable is always on the *y*-axis. 


<div class="figure" style="text-align: left">
<img src="images/expl_rep_graph.svg" alt="(ref:expl-resp)" width="80%" />
<p class="caption">(\#fig:expl-resp)(ref:expl-resp)</p>
</div>



In choosing between regression, *t*-tests, one-way ANOVA and two-way ANOVA we consider how many explanatory variables we have and whether they are continuous or categorical. 

If we have one explanatory variable and it is continuous, we can apply a regression. If it is a categorical variable with two groups (or levels) we have the choice of a *t*-test or a one way ANOVA but when there are more than two groups we use a one-way ANOVA. A two-way ANOVA is used when there are two categorical explanatory variables. See Figure \@ref(fig:decision-tree). 

(ref:decision-tree) Decision tree for choosing between single linear regression, *t*-tests, one-way ANOVA and two-way ANOVA.

<div class="figure" style="text-align: left">
<img src="images/decision_tree.svg" alt="(ref:decision-tree)" width="100%" />
<p class="caption">(\#fig:decision-tree)(ref:decision-tree)</p>
</div>

These apparently different tests are, in fact, the same test. They have the same underlying mathematics, or to put it another way, the follow the same model. That model is often known as the **General Linear Model**. 





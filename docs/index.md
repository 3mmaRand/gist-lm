--- 
title: "singlm: A simple introduction to GLM for analysing Poisson and Binomial responses in R"
author: "Emma Rand"
date: "2020-08-28"
site: bookdown::bookdown_site
documentclass: book
bibliography: [refs/book.bib, refs/packages.bib]
biblio-style: apalike
link-citations: true
description: "The output format for this example is bookdown::gitbook."
favicon: images/favicon.ico
cover-image: images/android-chrome-512x512.png
github-repo: 3mmaRand/singlm
url: 'https\://3mmarand.github.io/singlm/'
---

# Preface {-#preface}




## Who is this book for?

This book is for R users who have done an introductory class in data analysis which covered classical univariate tests such as single linear regression, *t*-tests, one-way ANOVA and two-way ANOVA. It is aimed at people who have a general, but not expert, understanding of summarising and graphically representing data and choosing and applying statistical tests. A revision chapter is included to set the scene and clarify terminology used in the rest of the book.
I assume you have some familiarity with R and RStudio and could import data, apply `t.test()`, `aov()` and `TukeyHSD()` functions appropriately, interpret the results and create figures using `ggplot()`. I do not assume your fluency allows you to do these things with looking anything up, just that you would understand what you were doing and how to interpret the results.

The book has two aims. First, to to introduce Generalised Linear Models for analysing counts and binary responses using `glm()`, and secondly, to introduce the terminology of statistical modelling to make your transition to more advanced texts easier.


## Formatting options 

You can change the appearance of the book using the toolbar at the top of the page. The menu on the left can be hidden, the font size increased or decreased and the colour altered to a dark or sepia theme.

Search the book by clicking on the magnifying glass, entering a search term and using the up and down arrows to navigate through the results.

## Conventions used in the book
Code and any output appears in blocks formatted like this:


```r
stag <- read_table2("data-raw/stag.txt")
glimpse(stag)
# Rows: 16
# Columns: 2
# $ jh   <dbl> 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140...
# $ mand <dbl> 0.56, 0.35, 0.28, 1.22, 0.48, 0.86, 0.68, 0.77, 0.55, 1.18, 0....
```

Lines of output start with a `#`. The content of a code block can be copied using the icon in its top right.

Within the text:
- packages are indicated in bold code font like this: **`ggplot2`**
- functions are indicated in code font with brackets after their name like this: `ggplot()`
- R objects are indicated in code font like this: `stag`

Key points are summarised throughout the book using boxes like this:

:::key
The key point of a previous few paragraphs is in boxes like these
:::

Extra pieces of information that are not essential to understanding the material are presented like this:

:::fyi
Extra information and tips are in boxes like these
:::


I use packages from the **`tidyverse`** [@tidyverse2019] throughout and chapters assume it has been loaded. If you get an error like this: 


```r
# Error in read_table2("data-raw/stag.txt") : 
#  could not find function "read_table2"
```

Then load the **`tidyverse`** like this:


```r
library(tidyverse)
```


All other packages will be loaded explicitly where needed with `library()` statements. 


## Approach of this book

Regression, *t*-tests and one-way ANOVA are fundamentally the same test and can all be carried out with the `lm()` function in R. However, it is common for *t*-tests and ANOVA to be taught using the `t.test()` and `aov()` functions respectively. One reason for this is because their outputs are easier for beginners to understand and interpret. 

However, the output of `lm()` is more typical of statistical modelling functions in general and not using `lm()` for the relatively simple cases makes it more difficult for people to extend their the statistical repertoire. The approach taken in this book is to exploit preexisting knowledge of *t*-tests and ANOVA using `t.test()` and `aov()` to understand the output of `lm()`. This will make it easier to understand the output of `glm()`. 

## Outline
This book introduces the the Generalised Linear Model for two types of discrete response:

1. Binomially distributed: when a response variable can take one of only two values, such as "yes" or "no", "alive" or "dead", "present" or "absent".  
2. Poisson distributed: when a response variable is the number of things.

In R, these are analysed with the `glm()` function.

:::key
`lm()` can be used to perform *t*-tests, ANOVAs and regression. `glm()` can be used to perform tests using the Generalised Linear Model for response variables which are counts or binary.
:::

Models are explained with reference to examples. Each example demonstrates the R code needed, how understand the output and how to report the results, including suggested **`ggplot2`**figures. 
The code is given for figures but not extensively explained. To learn more go to  https://ggplot2.tidyverse.org/

## Following along with the examples
instructions rstudio projects, data-raw, script file, down load "data-raw/stag.txt"

palettes
pal1 <- c("#eef8fa", "#faeef8","#f8faee")

#  blue, pink, green triadic
pal2 <- c("#9fd8e3", "#e39fd8", "#d8e39f")

#  blue, pink, green triadic
pal3 <- c("#64c0d2", "#d264c0", "#c0d264")

# blue, pink, green triadic
pal4 <- c("#256c7a", "#7a256c", "#6c7a25")


##  Overview of the chapter contents

**Part 1** provides a brief revision of an introductory data analysis class using terminology that will used throughout the remaining chapters. Single linear regression is used as an example of `lm()`. If the concepts in this chapter are very unfamiliar, you may benefit from revising your previous work. 

In **Part 2**  works through *t*-test, one-way ANOVA and two-way ANOVA examples carried out first with `t.test()` and `aov()` and then with `lm()` to gain a good understanding of the `lm()` output and interrogation for reporting.


**Part 3** gives a introduction to generalised linear models.

**Part 4** gives a introduction to generalised linear models for count data and works through several examples.

**Part 5** gives a introduction to generalised linear models for binomial data and works through several examples.

## Software information

I used the **`knitr`** package [@xie2015] and the **bookdown** package [@R-bookdown] to compile my book. My R session information is shown below:


```r
sessionInfo()
# R version 4.0.2 (2020-06-22)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows 10 x64 (build 16299)
# 
# Matrix products: default
# 
# locale:
# [1] LC_COLLATE=English_United Kingdom.1252 
# [2] LC_CTYPE=English_United Kingdom.1252   
# [3] LC_MONETARY=English_United Kingdom.1252
# [4] LC_NUMERIC=C                           
# [5] LC_TIME=English_United Kingdom.1252    
# 
# attached base packages:
# [1] stats     graphics  grDevices utils     datasets  methods   base     
# 
# other attached packages:
#  [1] patchwork_1.0.1  kableExtra_1.1.0 forcats_0.5.0    stringr_1.4.0   
#  [5] dplyr_1.0.2      purrr_0.3.4      readr_1.3.1      tidyr_1.1.1     
#  [9] tibble_3.0.3     ggplot2_3.3.2    tidyverse_1.3.0 
# 
# loaded via a namespace (and not attached):
#  [1] tidyselect_1.1.0  xfun_0.16         haven_2.3.1       colorspace_1.4-1 
#  [5] vctrs_0.3.2       generics_0.0.2    htmltools_0.5.0   viridisLite_0.3.0
#  [9] yaml_2.2.1        utf8_1.1.4        blob_1.2.1        rlang_0.4.7      
# [13] pillar_1.4.6      glue_1.4.1        withr_2.2.0       DBI_1.1.0        
# [17] dbplyr_1.4.4      modelr_0.1.8      readxl_1.3.1      lifecycle_0.2.0  
# [21] munsell_0.5.0     gtable_0.3.0      cellranger_1.1.0  rvest_0.3.6      
# [25] evaluate_0.14     knitr_1.29        fansi_0.4.1       broom_0.7.0      
# [29] Rcpp_1.0.5        scales_1.1.1      backports_1.1.7   webshot_0.5.2    
# [33] jsonlite_1.7.0    fs_1.5.0          hms_0.5.3         digest_0.6.25    
# [37] stringi_1.4.6     bookdown_0.20     grid_4.0.2        cli_2.0.2        
# [41] tools_4.0.2       magrittr_1.5      crayon_1.3.4      pkgconfig_2.0.3  
# [45] ellipsis_0.3.1    xml2_1.3.2        reprex_0.3.0      lubridate_1.7.9  
# [49] assertthat_0.2.1  rmarkdown_2.3     httr_1.4.2        rstudioapi_0.11  
# [53] R6_2.4.1          compiler_4.0.2
```


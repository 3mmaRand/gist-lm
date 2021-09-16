--- 
title: "gist-lm: Get Introductory Statistical Tests as Linear models: A guide for R users"
author: "Emma Rand"
date: "August 2020"
site: bookdown::bookdown_site
documentclass: book
bibliography: [refs/book.bib, refs/packages.bib]
biblio-style: apalike
link-citations: true
description: "The output format for this example is bookdown::gitbook."
favicon: images/favicon.ico
cover-image: images/hex-s.png
github-repo: 3mmaRand/singlm
url: 'https://3mmarand.github.io/gist-lm/'
always_allow_html: true
---

# Preface {-#preface}




## Who is this book for?

This book designed to help people with a little experience of data analysis in R get the gist of linear models in R. It is aimed at non-specialists who have learned introductory data analysis as a skill for doing research in another field.  The audience I had in mind when writing the book are undergraduates on degree programmes in the life sciences who have done an introductory course covering hypothesis testing with single linear regression, *t*-tests, and ANOVA. However, students on social science, media, finance and education degree programmes often do similar introductory data analysis courses. This book can also help them, although the examples are from the life sciences. A short revision chapter giving an overview of introductory data analysis course is included to set the scene and clarify terminology used in the rest of the book. The coverage of single linear regression in the first chapter of Part 2 is also likely to be revision for most readers.

I assume you have an understanding of the rationale of hypothesis testing and some experience selecting, applying and interpreting tests. I also assume you have some familiarity with R and RStudio and have general, but not expert, proficiency in summarising, analysing and visualising data with functions such as `t.test()`, `aov()`, `TukeyHSD()` and `ggplot()`. I do not assume your fluency allows you to do these things without looking things up. 

The book has two aims. First to explain how the *t*-test, ANOVA and regression are actually all the same test and introduce the terminology of statistical modelling and, secondly, to teach you how to use and interpret the `lm()` function. 

## Approach of this book

Regression, *t*-tests and one-way ANOVA are special cases of a much more widely applicable statistical model known as the "general linear model". Since they are fundamentally the same test, all can be carried out with the `lm()` function in R. However, it is common for *t*-tests and ANOVA to be taught to non-specialists using the `t.test()` and `aov()` functions respectively. There are some sensible reasons for this. For example, many introductory texts take the same approach and typically, the outputs of `t.test()` and `aov()` are easier for beginners to understand and interpret. 

However, the output of `lm()` is more typical of statistical modelling functions in general and these are made harder to understand if you are not used to using `lm()` for the relatively simple cases. This makes the use of only slightly more advanced methods seem like a bigger leap in understanding than it really is, and extending your statistical repertoire more intimidating than it could be. The approach taken in this book is to exploit your pre-existing knowledge of *t*-tests and ANOVA using `t.test()` and `aov()` to understand the output of `lm()`. 

:::key
`lm()` can be used to perform *t*-tests, ANOVAs and regression. 
:::

Examples are carried out with the familiar functions and then with `lm()` so you can make the link between the two. Each example demonstrates the R code needed, how understand the output and how to report the results, including suggested **`ggplot2`** figures. 
The code is given for figures but, as this isn't a book about **`ggplot2`**, it is not extensively explained. Readers keen to learn more about **`ggplot2`** are advised to go to https://ggplot2.tidyverse.org/.


## Options on the toolbar 

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

Lines of output start with a `#`. 

Within the text:
* packages are indicated in bold code font like this: **`ggplot2`**
* functions are indicated in code font with brackets after their name like this: `ggplot()`
* R objects are indicated in code font like this: `stag`

Key points are summarised throughout the book using boxes like this:

:::key
The key point of a previous few paragraphs is in boxes like these
:::

Extra pieces of information that are not essential to understanding the material are presented like this:

:::fyi
Extra information and tips are in boxes like these
:::


## Following along with the examples
Readers may wish to code along and the following gives guidance on how best to do that.

I recommend starting a new RStudio project and creating a folder inside that project called `data-raw` where you will save the data files. Links to the data files are given in the text and these can be downloaded to your `data-raw` folder by right-clicking the link choosing the option to save. Then make a new script file for each example to carry our the analysis for that example.


For example, if you call your Project `gist` and you have just started [Chapter 4 Single linear regression](#single-regression), your folder structure would look like this:

```
-- gist
   |-- gist.Rproj
   |-- stagbeetle_regresion.R
   |-- data-raw
      |-- stag.text

```

Using this structure will mean the paths to files needed in your code are the same as those given in the book.

The content of a code block can be copied using the icon in its top right corner.

I use packages from the **`tidyverse`** [@tidyverse2019] including **`ggplot2`** [@ggplot2-book], **`dplyr`** [@dplyr], **`tidyr`** [@tidyr] and **`readr`** [@readr] throughout the book. All the code assumes you have loaded the core **`tidyverse`** packages with: 


```r
library(tidyverse)
```

If you run examples and get an error like this: 


```r
# Error in read_table2("data-raw/stag.txt") : 
#  could not find function "read_table2"
```

It is likely you need to load the **`tidyverse`** as shown above.

All other packages will be loaded explicitly with `library()` statements where needed. 

##  Overview of the chapter contents

**Part 1 Introduction** provides a very brief overview of a typical introductory data analysis class using terminology that will used throughout the remaining chapters. If the concepts in this chapter are very unfamiliar, you may benefit from revising your previous work. 

In **Part 2**  we revise single linear regression which is likely where you have previously encountered the `lm()` function. We then
work through *t*-test, one-way ANOVA and two-way ANOVA examples carried out first with `t.test()` and `aov()` and then with `lm()` to gain a good understanding of the `lm()` output and interrogation for reporting.

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
#  [1] patchwork_1.0.1  kableExtra_1.2.1 forcats_0.5.0    stringr_1.4.0   
#  [5] dplyr_1.0.2      purrr_0.3.4      readr_1.4.0      tidyr_1.1.2     
#  [9] tibble_3.0.3     ggplot2_3.3.2    tidyverse_1.3.0 
# 
# loaded via a namespace (and not attached):
#  [1] tidyselect_1.1.0  xfun_0.18         haven_2.3.1       colorspace_1.4-1 
#  [5] vctrs_0.3.4       generics_0.0.2    htmltools_0.5.0   viridisLite_0.3.0
#  [9] yaml_2.2.1        utf8_1.1.4        blob_1.2.1        rlang_0.4.7      
# [13] pillar_1.4.6      glue_1.4.1        withr_2.3.0       DBI_1.1.0        
# [17] dbplyr_1.4.4      modelr_0.1.8      readxl_1.3.1      lifecycle_0.2.0  
# [21] munsell_0.5.0     gtable_0.3.0      cellranger_1.1.0  rvest_0.3.6      
# [25] evaluate_0.14     knitr_1.30        fansi_0.4.1       broom_0.7.1      
# [29] Rcpp_1.0.5        scales_1.1.1      backports_1.1.9   webshot_0.5.2    
# [33] jsonlite_1.7.1    fs_1.5.0          hms_0.5.3         digest_0.6.25    
# [37] stringi_1.5.3     bookdown_0.20     grid_4.0.2        cli_2.0.2        
# [41] tools_4.0.2       magrittr_1.5      crayon_1.3.4      pkgconfig_2.0.3  
# [45] ellipsis_0.3.1    xml2_1.3.2        reprex_0.3.0      lubridate_1.7.9  
# [49] assertthat_0.2.1  rmarkdown_2.4     httr_1.4.2        rstudioapi_0.11  
# [53] R6_2.4.1          compiler_4.0.2
```


--- 
title: "gist-lm: Get Introductory Statistical Tests as Linear models: A guide for R users"
author: "Emma Rand"
date: "September 2021"
site: bookdown::bookdown_site
documentclass: book
bibliography: [refs/book.bib, refs/packages.bib]
biblio-style: apalike
link-citations: true
description: "This book explains how the t-test, ANOVA and regression are actually all the same test and introduce the terminology of statistical modelling and, secondly, to teach you how to use and interpret the lm() function."
favicon: images/favicon.ico
cover-image: images/hex-s.png
github-repo: 3mmaRand/singlm
twitter-handle: er13_r
url: 'https://3mmarand.github.io/gist-lm/'
always_allow_html: true
---

# Welcome! {-#welcome}

![hex logo](images/hex-s.png){width=150px} 



## Who is this book for?

Have you done an introductory data analysis course in R? Yes? Then this book might be for you! It is aimed at non-specialists who have learned introductory data analysis as a skill for doing research in another field.  The readers I had in mind when writing the book are undergraduates on degree programmes in the life sciences who have done an introductory course on data analysis in R. Such introductory courses usually teach null hypothesis testing with single linear regression, *t*-tests, and ANOVA. You might also find this book useful if you have done a similar introductory data analysis course as part of your social science, media, finance or education degree programme. I use examples from the life sciences but these require little more than general knowledge and the principles apply to any field. 

I assume you have an understanding of the rationale of hypothesis testing and some experience selecting, applying and interpreting tests. I also assume you have some familiarity with R and RStudio and have a general, but not expert, proficiency in summarising, analysing and visualising data with functions such as `t.test()`, `aov()`, `TukeyHSD()` and `ggplot()`. I do not assume your fluency allows you to do these things without looking things up!

The book starts with an overview of a typical introductory data analysis course. I intend this to set the scene, summarise expected background experience and clarify terminology used in the rest of the book. The coverage of single linear regression in the first chapter of Part 2 is also likely to be revision for most readers.

The book has two aims. First to explain how the *t*-test, ANOVA and regression are actually all the same test and introduce the terminology of statistical modelling and, secondly, to teach you how to use and interpret the `lm()` function. 

## Approach of this book

Regression, *t*-tests and one-way ANOVA are special cases of a much more widely applicable statistical model known as the "general linear model". Since they are fundamentally the same test, all can be carried out with the `lm()` function in R. However, it is common for *t*-tests and ANOVA to be taught to non-specialists using the `t.test()` and `aov()` functions respectively. There are some sensible reasons for this. For example, many introductory texts take the same approach and typically, the outputs of `t.test()` and `aov()` are easier for beginners to understand and interpret. 

However, the output of `lm()` is more typical of statistical modelling functions in general and these are made harder to understand if you are not used to using `lm()` for the relatively simple cases. This makes the use of only slightly more advanced methods seem like a bigger leap in understanding than it really is, and extending your statistical repertoire more intimidating than it could be. The approach taken in this book is to exploit your pre-existing knowledge of *t*-tests and ANOVA using `t.test()` and `aov()` to understand the output of `lm()`. 

:::key
`lm()` can be used to perform *t*-tests, ANOVAs and regression. 
:::

Examples are carried out with the familiar functions and then with `lm()` so you can make the link between the two. Each example demonstrates the R code needed, how understand the output and how to report the results, including suggested **`ggplot2`** figures. 
The code is given for figures but, as this isn't a book about **`ggplot2`**, it is not extensively explained. Readers keen to learn more about **`ggplot2`** are advised to go to https://ggplot2.tidyverse.org/.

##  Overview of the chapter contents

**Introduction** provides a very brief overview of a typical introductory data analysis class using terminology that will used throughout the remaining chapters. If the concepts in this chapter are very unfamiliar, you may benefit from revising your previous work. 

In **Using `lm()` for familiar tests**  we revise single linear regression which is likely where you have previously encountered the `lm()` function. We then work through an example of a *t*-test first carried out with `t.test()` and then with `lm()` to gain a good understanding of the `lm()` output. This is followed by examples of one- and two-way ANOVA carried out with `aov()` and them `lm()`. 

## Conventions used in the book
Code and any output appears in blocks formatted like this:


```r
stag <- read_table("data-raw/stag.txt")
glimpse(stag)
# Rows: 16
# Columns: 2
# $ jh   <dbl> 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 1~
# $ mand <dbl> 0.56, 0.35, 0.28, 1.22, 0.48, 0.86, 0.68, 0.77, 0.55, 1.18, 0.71,~
```

Lines of output start with a `#`. 

Within the text:
-  packages are indicated in bold code font like this: **`ggplot2`**
-  functions are indicated in code font with brackets after their name like this: `ggplot()`
-  R objects are indicated in code font like this: `stag`

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
# Error in read_table("data-raw/stag.txt") : 
#  could not find function "read_table"
```

It is likely you need to load the **`tidyverse`** as shown above.

All other packages will be loaded explicitly with `library()` statements where needed. 



## Credits {.unnumbered}

I used the [**`bookdown`**](https://bookdown.org/yihui/bookdown/) package [@R-bookdown] to compile this book. My R session information is shown below:


```r
sessionInfo()
# R version 4.1.0 (2021-05-18)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows 10 x64 (build 18363)
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
#  [1] patchwork_1.1.1  kableExtra_1.3.4 forcats_0.5.1    stringr_1.4.0   
#  [5] dplyr_1.0.7      purrr_0.3.4      readr_2.0.2      tidyr_1.1.4     
#  [9] tibble_3.1.4     ggplot2_3.3.5    tidyverse_1.3.1 
# 
# loaded via a namespace (and not attached):
#  [1] Rcpp_1.0.7        svglite_2.0.0     lubridate_1.7.10  assertthat_0.2.1 
#  [5] digest_0.6.28     utf8_1.2.2        R6_2.5.1          cellranger_1.1.0 
#  [9] backports_1.2.1   reprex_2.0.1      evaluate_0.14     httr_1.4.2       
# [13] pillar_1.6.3      rlang_0.4.11      readxl_1.3.1      rstudioapi_0.13  
# [17] jquerylib_0.1.4   rmarkdown_2.11    webshot_0.5.2     munsell_0.5.0    
# [21] broom_0.7.9       compiler_4.1.0    modelr_0.1.8      xfun_0.26        
# [25] pkgconfig_2.0.3   systemfonts_1.0.2 htmltools_0.5.2   downlit_0.2.1    
# [29] tidyselect_1.1.1  bookdown_0.24     fansi_0.5.0       viridisLite_0.4.0
# [33] crayon_1.4.1      tzdb_0.1.2        dbplyr_2.1.1      withr_2.4.2      
# [37] grid_4.1.0        jsonlite_1.7.2    gtable_0.3.0      lifecycle_1.0.1  
# [41] DBI_1.1.1         magrittr_2.0.1    scales_1.1.1      cli_3.0.1        
# [45] stringi_1.7.4     fs_1.5.0          xml2_1.3.2        bslib_0.3.0      
# [49] ellipsis_0.3.2    generics_0.1.0    vctrs_0.3.8       tools_4.1.0      
# [53] glue_1.4.2        hms_1.1.1         fastmap_1.1.0     yaml_2.2.1       
# [57] colorspace_2.0-2  rvest_1.0.1       knitr_1.34        haven_2.4.3      
# [61] sass_0.4.0
```

## License {.unnumbered}

<a rel="license" href="https://creativecommons.org/licenses/by-sa/4.0/"><img src="https://licensebuttons.net/l/by-sa/4.0/88x31.png" alt="Creative Commons License" style="border-width:0"/></a><br />This online work is licensed under a <a rel="license" href="https://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International</a>.
Visit [here](https://github.com/dukestatsciintrods/blob/master/LICENSE.md) for more information about the license.

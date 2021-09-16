# 
options(digits = 3,
        kableExtra.html.bsTable = T,
        knitr.table.format = function() {
          if (knitr::is_latex_output()) 
            "latex" else "pipe"
        })

knitr::opts_chunk$set(
  comment = "#",
  collapse = TRUE,
  out.width = "80%",
  fig.align = 'left',
  fig.show = "hold",
  warning = FALSE,
  message = FALSE,
  echo = TRUE
)

library(tidyverse, 
        verbose = FALSE, 
        quietly = TRUE, 
        warn.conflicts = FALSE)

library(kableExtra, 
        verbose = FALSE, 
        quietly = TRUE, 
        warn.conflicts = FALSE)
library(patchwork, 
        verbose = FALSE, 
        quietly = TRUE, 
        warn.conflicts = FALSE)


# might be of use
# options(dplyr.print_min = 6, dplyr.print_max = 6)



# pastel pallet for css boxes
#  blue, pink, green triadic
pal1 <- c("#eef8fa", "#faeef8","#f8faee")

#  blue, pink, green triadic
pal2 <- c("#9fd8e3", "#e39fd8", "#d8e39f")

#  blue, pink, green triadic
pal3 <- c("#64c0d2", "#d264c0", "#c0d264")

# blue, pink, green triadic
pal4 <- c("#256c7a", "#7a256c", "#6c7a25")

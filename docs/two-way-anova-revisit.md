# Two-way ANOVA revisited {#two-way-anova-revisit}

In this chapter we turn our attention to designs with two categorical explanatory variables. We first use the familiar `aov()` function to carry out a two-way ANOVA and then use our understanding to help us interpret the output of `lm()`. We will also make predictions from the model and report on our results.


## Introduction to the example

Researchers have collected live specimens of two species of periwinkle (see Figure \@ref(fig:periwinkle-fig)) from sites in northern England in the Spring and Summer. They take a measure of the gut parasite load by examining a slide of gut contents. The data are in [periwinkle.txt](data-raw/periwinkle.txt).

(ref:periwinkle-fig) Periwinkles are marine gastropod molluscs (slugs and snails). A) *Littorina brevicula* (PD files - Public Domain, https://commons.wikimedia.org/w/index.php?curid=30577419) B) *Littorina littorea*. (photographed by Guttorm Flatabø (user:dittaeva). - Photograph taken with an Olympus Camedia C-70 Zoom digital camera. Metainformation edited with Irfanview, possibly cropped with jpegcrop., CC BY-SA 3.0, https://commons.wikimedia.org/w/index.php?curid=324769

<div class="figure" style="text-align: left">
<img src="images/Littorina.jpg" alt="(ref:periwinkle-fig)" width="80%" />
<p class="caption">(\#fig:periwinkle-fig)(ref:periwinkle-fig)</p>
</div>


<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:300px; "><table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> para </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> season </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> species </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 58 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 51 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 54 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 39 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 65 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 67 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 60 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 54 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 47 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 66 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 51 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 43 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 62 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 55 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 58 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 43 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 69 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 71 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 64 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 58 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 51 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 70 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 55 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 47 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 54 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 43 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 63 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 58 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 61 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 63 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 45 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 45 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 77 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 57 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 49 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 72 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 47 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 78 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 77 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 71 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 69 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 66 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 76 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 75 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 54 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 62 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 58 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 76 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 68 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 84 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 61 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 70 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 68 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 67 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 88 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 64 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 69 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 70 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 56 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 80 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 80 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 53 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 56 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 101 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 81 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 88 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 67 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 73 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 75 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 74 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 68 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 89 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 75 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 74 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 76 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 66 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 61 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 51 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 67 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 78 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 79 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 69 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 76 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 86 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 97 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 64 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 68 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 65 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 49 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 62 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 57 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 70 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 62 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 80 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 81 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 85 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 77 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 61 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 59 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 66 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
  </tr>
</tbody>
</table></div>

The data were collected to determine whether there was an effect of season or species on parasite load and whether these effects were independent.


:::key
There are 3 variables: `species` and `season`are categorical explanatory variables, each with two levels;
`para`, a continuous variable, is the response.
:::

We can use the `read_delim()` function to import the data.


```r
periwinkle <- read_delim("data-raw/periwinkle.txt", delim = "\t")
```

When visualising this data with `ggplot()` we need to account for both explanatory variables. We can map one to the *x*-axis and the other to a different aesthetic. Using the `fill` aesthetic works well for violin plots. 



```r
ggplot(data = periwinkle, aes(x = season, y = para, fill = species)) +
  geom_violin()
```

<img src="two-way-anova-revisit_files/figure-html/unnamed-chunk-3-1.png" width="80%" style="display: block; margin: auto auto auto 0;" />
Parasite load seems to be higher for both species in the summer and that effect looks bigger in *L.brevicula* - it has the lowest spring mean but the highest summer mean.
Let’s create a summary of the data that will be useful for plotting later:

```r
peri_summary <- periwinkle %>% 
  group_by(season, species) %>% 
  summarise(mean = mean(para),
            sd = sd(para),
            n = length(para),
            se = sd / sqrt(n))
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> season </th>
   <th style="text-align:left;"> species </th>
   <th style="text-align:right;"> mean </th>
   <th style="text-align:right;"> sd </th>
   <th style="text-align:right;"> n </th>
   <th style="text-align:right;"> se </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:right;"> 56.5 </td>
   <td style="text-align:right;"> 8.88 </td>
   <td style="text-align:right;"> 25 </td>
   <td style="text-align:right;"> 1.78 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:right;"> 63.8 </td>
   <td style="text-align:right;"> 11.92 </td>
   <td style="text-align:right;"> 25 </td>
   <td style="text-align:right;"> 2.38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:right;"> 72.9 </td>
   <td style="text-align:right;"> 11.24 </td>
   <td style="text-align:right;"> 25 </td>
   <td style="text-align:right;"> 2.25 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:right;"> 69.4 </td>
   <td style="text-align:right;"> 11.44 </td>
   <td style="text-align:right;"> 25 </td>
   <td style="text-align:right;"> 2.29 </td>
  </tr>
</tbody>
</table>

The summary confirms both species have a higher mean in the summer and that the difference between the species is reversed - *L.brevicula* $-$ *L.littorea* is -7.28 in the spring but 3.48 in summer.

## `aov()` output reminder

The `aov()` function requires a model formula which includes both explanatory variables and the interaction between them in the familiar format: `para ~ season * season` . We also specify the data argument to indicate where the variables can be found:


```r
mod <- aov(data = periwinkle, para ~ season * species)
```

The output of the `summary()` function gives us an ANOVA test:


```r
summary(mod)
#                Df Sum Sq Mean Sq F value Pr(>F)    
# season          1   3058    3058   25.58  2e-06 ***
# species         1     90      90    0.75  0.387    
# season:species  1    724     724    6.05  0.016 *  
# Residuals      96  11477     120                   
# ---
# Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```



There was a significantly greater number of parasites in the Summer than the Spring (ANOVA: $F$ = 25.58; $d.f.$ = 1, 96; $p$ < 0.001). There was no difference between the species when averaged across the seasons but there was significant interaction (ANOVA: $F$ = 6.053; $d.f.$ = 1, 96; $p$ = 0.016) between season and species with higher numbers infecting *L.littorea* in the Spring whilst *L.brevicula* was more heavily parasitized in the Summer.
 
We need a post-hoc test to discover which comparisons are significant.

## Post-hoc testing for `aov`
Tukey Honest Significant Difference test is carried out with:

```r
TukeyHSD(mod)
#   Tukey multiple comparisons of means
#     95% family-wise confidence level
# 
# Fit: aov(formula = para ~ season * species, data = periwinkle)
# 
# $season
#               diff  lwr  upr p adj
# Summer-Spring 11.1 6.72 15.4     0
# 
# $species
#                                        diff   lwr  upr p adj
# Littorina littorea-Littorina brevicula  1.9 -2.44 6.24 0.387
# 
# $`season:species`
#                                                        diff     lwr   upr p adj
# Summer:Littorina brevicula-Spring:Littorina brevicula 16.44   8.354 24.53 0.000
# Spring:Littorina littorea-Spring:Littorina brevicula   7.28  -0.806 15.37 0.093
# Summer:Littorina littorea-Spring:Littorina brevicula  12.96   4.874 21.05 0.000
# Spring:Littorina littorea-Summer:Littorina brevicula  -9.16 -17.246 -1.07 0.020
# Summer:Littorina littorea-Summer:Littorina brevicula  -3.48 -11.566  4.61 0.675
# Summer:Littorina littorea-Spring:Littorina littorea    5.68  -2.406 13.77 0.263
```



The parasite load for *L.brevicula* increases significantly between spring and summer ($p$ < 0.001) while that for *L.littorea* does not. Other significant comparisons are: the spring load of *L.brevicula* is lower than the summer load of *L.littorea* ($p$ < 0.001); and summer load of *L.brevicula* is higher than the spring load of *L.littorea* ($p$ = 0.02).

## Two-way ANOVAs as linear models

The equation for a two-way ANOVA test is an extension of equation \@ref(eq:one-way) for a one-way ANOVA test. It has the same form but an additional parameter. If there are two groups in each explanatory variable, the model is:

\begin{equation}
E(y_{i})=\beta_{0}+\beta_{1}X1_{i}+\beta_{2}X2_{i}+\beta_{3}X1_{i}X2_{i}
(\#eq:one-way)
\end{equation}


The intercept, $\beta_{0}$ is the value of the response when both categorical explanatory variables are at their "lowest" level. $X1_{i}$ is a dummy explanatory variable which indicates the first explanatory variable changing to its second level. It toggles on and off the effects of $\beta_{1}$. $X2_{i}$ is a dummy explanatory variable which indicates the second explanatory variable changing to its second level and toggles on and off the effects of $\beta_{2}$. $\beta_{3}$ is the interaction effect. If $X1_{i}$ and $X2_{i}$ are both 1 $\beta_{3}$ is the extra effect of that combination above the sum of 
$\beta_{1}+\beta_{2}$ 

The number of parameters in a two-way ANOVA design is: the number of levels in one explanatory $\times$ the number of levels in the other explanatory. If each explanatory have three levels, there would be nine $\beta s$

A graphical representation of the terms in a linear model when there are two explanatory variables each with two groups (or levels) is given in Figure \@ref(fig:two-way-annotated). 

(ref:two-way-annotated) A linear model with two explanatory variables each with two levels. 'Variable 1' has levels 'A' and 'B' and 'Variable 2' has levels 'a' and 'b'. Thus there are 2 $\times$ 2 = 4 groups: Aa, Ab, Ba and Bb. The measured <span style=" font-weight: bold;    color: #d264c0 !important;" >response values are in pink</span> and the <span style=" font-weight: bold;    color: #c0d264 !important;" >predictions are in green</span>. The residuals are not indicated. The estimated model parameters are indicated: $\beta_{0}$ is the mean of group Aa; $\beta_{1}$ is what has to be added to $\beta_{0}$ to get the mean of group Ab; $\beta_{2}$ is what has to be added to $\beta_{0}$ to get the mean of group Ba; and $\beta_{3}$ is what has to be added to $\beta_{0}$ in addition to $\beta_{1}$ and $\beta_{2}$ to get the mean of group Bb. In this figure, all parameters are positive.  Compare to Figure \@ref(fig:lm-annotated).

<div class="figure" style="text-align: left">
<img src="images/gen_two_way.svg" alt="(ref:two-way-annotated)" width="80%" />
<p class="caption">(\#fig:two-way-annotated)(ref:two-way-annotated)</p>
</div>

:::key
The intercept, $\beta_{0}$is the response when both explanatory variable is at their first group and all the other $\beta s$ are given relative to this. The interaction parameters give the effect of the combination in addition to the sum of their independent effects
:::

## Applying and interpreting `lm()`
The lm() function is applied to the periwinkle example as follows:

```r
mod <- lm(data = periwinkle, para ~ season * species)
```

Printing `mod` to the console gives us the estimated model parameters (coefficients):


```r
mod
# 
# Call:
# lm(formula = para ~ season * species, data = periwinkle)
# 
# Coefficients:
#                            (Intercept)                            seasonSummer  
#                                  56.48                                   16.44  
#              speciesLittorina littorea  seasonSummer:speciesLittorina littorea  
#                                   7.28                                  -10.76
```



The equation for the model is:
<center> $para$ = 56.48 + 16.44$speciesLittorina littorea$ + 7.28$seasonSummer:speciesLittorina littorea$</center>

The first group of `season` is `Spring` and the first group of `species` is `Littorina brevicula`so $\beta_{0}$ is the mean of *L.brevicula* in the spring, 56.48. 

$\beta_{1}$ is the coefficient labelled `seasonSummer` and means when the variable `season` takes the value `Summer`, $\beta_{1}$ must be added to $\beta_{0}$ - the mean of *L.brevicula* in the summer is $\beta_{0}+\beta_{1}$ = 56.48 $+$ 16.44 $=$ 72.92.  
The coefficient labelled `speciesLittorina littorea` is $\beta_{2}$. When species becomes `Littorina littorea`, $\beta_{1}$ must be added to $\beta_{0}$ thus the mean of *L.littorea* in spring is $\beta_{0}+\beta_{2}$ = 56.48 $+$ 7.28 $=$ 63.76.
If both `season` becomes `Summer` and species becomes `Littorina littorea` you would expect the effect to be $\beta_{0}+\beta_{1}+\beta_{2}$. The coefficient labelled `seasonSummer:speciesLittorina littorea`, $\beta_{3}$ is the effect that is *additional* to that sum. An interaction is when combined effect of two variables is more than just adding the independent effects. The mean of *L.littorea* in summer is $\beta_{0}+\beta_{1}+\beta_{2}+\beta_{3}$ = 56.48 $+$ `rb1` $+$ 7.28 $+$ `rb3` $=$ 69.44.


More information including statistical tests of the model and its parameters is obtained by using `summary()`:


```r
summary(mod)
# 
# Call:
# lm(formula = para ~ season * species, data = periwinkle)
# 
# Residuals:
#    Min     1Q Median     3Q    Max 
# -20.76  -6.13  -1.10   8.12  28.08 
# 
# Coefficients:
#                                        Estimate Std. Error t value Pr(>|t|)    
# (Intercept)                               56.48       2.19   25.83  < 2e-16 ***
# seasonSummer                              16.44       3.09    5.32  6.9e-07 ***
# speciesLittorina littorea                  7.28       3.09    2.35    0.021 *  
# seasonSummer:speciesLittorina littorea   -10.76       4.37   -2.46    0.016 *  
# ---
# Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 10.9 on 96 degrees of freedom
# Multiple R-squared:  0.252,	Adjusted R-squared:  0.229 
# F-statistic: 10.8 on 3 and 96 DF,  p-value: 3.55e-06
```
The `Coefficients` table gives the estimated $\beta_{0}$, $\beta_{1}$, $\beta_{2}$ and $\beta_{3}$ again but along with their standard errors and tests of whether the estimates differ from zero. The estimated mean of *L.brevicula* in the spring is 56.48 $\pm$ 2.187 and this differs significantly from zero ($p$ < 0.001). The estimated difference between the *L.brevicula* in the spring and *L.brevicula* in the summer 16.44 $\pm$ 3.093 and also differs significantly from zero ($p$ < 0.001). The estimated difference between *L.brevicula* in the spring and *L.littorea* in the spring, 7.28 $\pm$ 3.093 differs significantly from zero ($p$ = 0.021). 

The proportion of the variance in parasite load explained by the model is 0.252 and this is a significant proportion of that variance ($p$ < 0.001). 

As we are fitting three parameters in addition to the intercept our *p*-value for the model and the *p*-values for the $\beta$ parameters differ. This was also true for [one-way ANOVA](#one-way-anova-revisit).

Replacing the terms shown in Figure \@ref(fig:gen_two_way) with the values in this example gives us \@ref(fig:periwinkle-annotated).

(ref:periwinkle-annotated) The annotated model with the values from the parasite load of preiwinkle example. The measured <span style=" font-weight: bold;    color: #d264c0 !important;" >response values are in pink</span> and the <span style=" font-weight: bold;    color: #c0d264 !important;" >predictions are in green</span>. The estimated model parameters are indicated: $\beta_{0}$, the mean of *L.brevicula* in the spring, is 56.48;  $\beta_{1}$ is 16.44 thus the mean of *L.brevicula* in the summer 56.48 + 16.44 = 72.92; $\beta_{2}$ is 7.28 thus the mean of *L.littorea* in the spring 56.48 + 7.28 = 72.92; and the *L.littorea* in the summer is $\beta_{0}+\beta_{1}+\beta_{2}+\beta_{3}$ = 56.48 $+$ 16.44 $+$ 7.28 $+$ -10.76 $=$ 69.44. Compare to Figure \@ref(fig:two-way-annotated).

<div class="figure" style="text-align: left">
<img src="images/peri_lm_eg.svg" alt="(ref:periwinkle-annotated)" width="80%" />
<p class="caption">(\#fig:periwinkle-annotated)(ref:periwinkle-annotated)</p>
</div>




## Getting predictions from the model

We already have the predictions for all possible combinations of values of the explanatory variables because both are categorical.

However, the code for using predict is included here, as it was in the previous two chapters chapter, because it will make it easier to understand more complex examples later. We need to create a dataframe of values for which we want predictions and pass it as an argument to the `predict()` function.

To create a dataframe with one column of Species values:


```r
predict_for <- data.frame(species = rep(c("Littorina brevicula", "Littorina littorea"), each = 2),
                          season = rep(c("Spring", "Summer"), times = 2))
```

:::key
Remember! The variable and its values have to exactly match those in the model.
:::

The to get the predicted myoglobin content for the three species:


```r
predict_for$pred <- predict(mod, newdata = predict_for)
```



## Checking assumptions

The two assumptions of the model can be checked using diagnostic plots. The Q-Q plot is obtained with:


```r
plot(mod, which = 2)
```

<img src="two-way-anova-revisit_files/figure-html/unnamed-chunk-17-1.png" width="80%" style="display: block; margin: auto auto auto 0;" />
The residual seem to be normally distributed.

Let’s look at the Residuals vs Fitted plot:


```r
plot(mod, which = 1)
```

<img src="two-way-anova-revisit_files/figure-html/unnamed-chunk-18-1.png" width="80%" style="display: block; margin: auto auto auto 0;" />

The residuals are equally spread around a horizontal line; the assumptions seem to be met.


## Post-hoc testing for `lm()`

Instead of using the `TukeyHSD()` we will again use the `glht()` function from the `multcomp` package [@multcomp]. 

A relatively simple way to make all the pairwise comparisons is to create a new factor variable that indicates membership of one of the four groups. We can do that with the `interaction()` function:  

```r
periwinkle$seasxspp <- interaction(periwinkle$season, periwinkle$species)
```

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:300px; "><table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> para </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> season </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> species </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> seasxspp </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 58 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 51 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 54 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 39 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 65 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 67 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 60 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 54 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 47 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 66 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 51 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 43 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 62 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 55 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 58 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 43 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 69 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 71 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 64 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 58 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 51 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 70 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 55 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 47 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 54 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Spring.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 43 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 63 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 58 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 61 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 63 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 45 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 45 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 77 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 57 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 49 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 72 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 47 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 78 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 77 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 71 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 69 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 66 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 76 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 75 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 54 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 62 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 58 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 76 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 68 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 84 </td>
   <td style="text-align:left;"> Spring </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Spring.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 61 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 70 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 68 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 67 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 88 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 64 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 69 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 70 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 56 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 80 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 80 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 53 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 56 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 101 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 81 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 88 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 67 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 73 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 75 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 74 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 68 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 89 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 75 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 74 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 76 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina brevicula </td>
   <td style="text-align:left;"> Summer.Littorina brevicula </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 66 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 61 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 51 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 67 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 78 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 79 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 69 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 76 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 86 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 97 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 64 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 68 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 65 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 49 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 62 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 57 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 70 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 62 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 80 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 81 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 85 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 77 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 61 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 59 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 66 </td>
   <td style="text-align:left;"> Summer </td>
   <td style="text-align:left;"> Littorina littorea </td>
   <td style="text-align:left;"> Summer.Littorina littorea </td>
  </tr>
</tbody>
</table></div>

We then rebuild the model using this one variable:

```r
mod2 <- lm(data = periwinkle, para ~ seasxspp)
```

We have done a one-way ANOVA to obtain our post-hoc comparisons. The parameters in this model will be like those in a one-way ANOVA with $\beta_{3}$ giving the amount you add to the intercept to get the fourth group mean. 
Then load the package:

```r
library(multcomp)
```

We have to specify our contrasts as a matrix with the `linfct` (linear functions) argument and there is a multiple comparisons function, `mcp()`, to help.

This is the whole command:


```r
mod_mc <- glht(mod2, linfct = mcp(seasxspp = "Tukey"))
```
You can read this as "do all of the pairwise comparisons between each group in `seasxspp` in the model `mod` using the Tukey test".

We view the results with `summary()`:


```r
summary(mod_mc)
# 
# 	 Simultaneous Tests for General Linear Hypotheses
# 
# Multiple Comparisons of Means: Tukey Contrasts
# 
# 
# Fit: lm(formula = para ~ seasxspp, data = periwinkle)
# 
# Linear Hypotheses:
#                                                              Estimate
# Summer.Littorina brevicula - Spring.Littorina brevicula == 0    16.44
# Spring.Littorina littorea - Spring.Littorina brevicula == 0      7.28
# Summer.Littorina littorea - Spring.Littorina brevicula == 0     12.96
# Spring.Littorina littorea - Summer.Littorina brevicula == 0     -9.16
# Summer.Littorina littorea - Summer.Littorina brevicula == 0     -3.48
# Summer.Littorina littorea - Spring.Littorina littorea == 0       5.68
#                                                              Std. Error t value
# Summer.Littorina brevicula - Spring.Littorina brevicula == 0       3.09    5.32
# Spring.Littorina littorea - Spring.Littorina brevicula == 0        3.09    2.35
# Summer.Littorina littorea - Spring.Littorina brevicula == 0        3.09    4.19
# Spring.Littorina littorea - Summer.Littorina brevicula == 0        3.09   -2.96
# Summer.Littorina littorea - Summer.Littorina brevicula == 0        3.09   -1.13
# Summer.Littorina littorea - Spring.Littorina littorea == 0         3.09    1.84
#                                                              Pr(>|t|)    
# Summer.Littorina brevicula - Spring.Littorina brevicula == 0   <0.001 ***
# Spring.Littorina littorea - Spring.Littorina brevicula == 0     0.093 .  
# Summer.Littorina littorea - Spring.Littorina brevicula == 0    <0.001 ***
# Spring.Littorina littorea - Summer.Littorina brevicula == 0     0.020 *  
# Summer.Littorina littorea - Summer.Littorina brevicula == 0     0.675    
# Summer.Littorina littorea - Spring.Littorina littorea == 0      0.263    
# ---
# Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# (Adjusted p values reported -- single-step method)
```

The results are the same as for using `TukeyHSD()` as we have done the same tests using a different function.

You can see what a contrasts matrix looks like by looking at the `linfct` variable of the `glht` object. You don't need it now but in the future you may need to specify your own constrasts matrices so let's have a look to make a step towards understanding:


```r
mod_mc$linfct
#                                                         (Intercept)
# Summer.Littorina brevicula - Spring.Littorina brevicula           0
# Spring.Littorina littorea - Spring.Littorina brevicula            0
# Summer.Littorina littorea - Spring.Littorina brevicula            0
# Spring.Littorina littorea - Summer.Littorina brevicula            0
# Summer.Littorina littorea - Summer.Littorina brevicula            0
# Summer.Littorina littorea - Spring.Littorina littorea             0
#                                                         seasxsppSummer.Littorina brevicula
# Summer.Littorina brevicula - Spring.Littorina brevicula                                  1
# Spring.Littorina littorea - Spring.Littorina brevicula                                   0
# Summer.Littorina littorea - Spring.Littorina brevicula                                   0
# Spring.Littorina littorea - Summer.Littorina brevicula                                  -1
# Summer.Littorina littorea - Summer.Littorina brevicula                                  -1
# Summer.Littorina littorea - Spring.Littorina littorea                                    0
#                                                         seasxsppSpring.Littorina littorea
# Summer.Littorina brevicula - Spring.Littorina brevicula                                 0
# Spring.Littorina littorea - Spring.Littorina brevicula                                  1
# Summer.Littorina littorea - Spring.Littorina brevicula                                  0
# Spring.Littorina littorea - Summer.Littorina brevicula                                  1
# Summer.Littorina littorea - Summer.Littorina brevicula                                  0
# Summer.Littorina littorea - Spring.Littorina littorea                                  -1
#                                                         seasxsppSummer.Littorina littorea
# Summer.Littorina brevicula - Spring.Littorina brevicula                                 0
# Spring.Littorina littorea - Spring.Littorina brevicula                                  0
# Summer.Littorina littorea - Spring.Littorina brevicula                                  1
# Spring.Littorina littorea - Summer.Littorina brevicula                                  0
# Summer.Littorina littorea - Summer.Littorina brevicula                                  1
# Summer.Littorina littorea - Spring.Littorina littorea                                   1
# attr(,"type")
# [1] "Tukey"
```
It is matrix with a column for each parameter, in order) and a row for each contrast containing only 0s, 1s and -1s. The rows are named.
The numbers are how the model parameters are needed to make the contrast and these can be understood by considering how the group means relate to the parameters.

* Spring.Littorina brevicula mean is $\beta_{0}$ 
* Summer.Littorina brevicula mean is $\beta_{0} + \beta_{1}$ 
* Spring.Littorina littorea $\beta_{0} + \beta_{2}$ 
* Summer.Littorina littorea $\beta_{0} + \beta_{3}$ 

Therefore: 
* Summer.Littorina brevicula - Spring.Littorina brevicula is: $\beta_{0} + \beta_{1} - \beta_{0} = \beta_{1}$ and there is a one in the `seasxsppSummer.Littorina brevicula` column and zeros else where
* Spring.Littorina littorea - Spring.Littorina brevicula is: $\beta_{0} + \beta_{2} - \beta_{0} = \beta_{2}$ and there is a one in the `seasxsppSpring.Littorina littorea` column and zeros else where
* Summer.Littorina littorea - Spring.Littorina brevicula is: $\beta_{0} + \beta_{3} - \beta_{0} = \beta_{3}$ and there is a 1 in the the `seasxsppSummer.Littorina littorea` column and zeros else where
* Spring.Littorina littorea - Summer.Littorina brevicula  is: $\beta_{0} + \beta_{2} - (\beta_{0} + \beta_{1}) = \beta_{2} - \beta_{1}$ and there is a 1 in the the `seasxsppSpring.Littorina littorea` column and a -1 in the `seasxsppSummer.Littorina brevicula` column
* Summer.Littorina littorea - Summer.Littorina brevicula is: $\beta_{0} + \beta_{3} - (\beta_{0} + \beta_{1}) = \beta_{3} - \beta_{1}$ and there is a 1 in the the `seasxsppSummer.Littorina littorea` column and a -1 in the `seasxsppSummer.Littorina brevicula` column
* Summer.Littorina littorea - Spring.Littorina littorea is: $\beta_{0} + \beta_{3} - (\beta_{0} + \beta_{2}) = \beta_{3} + \beta_{2}$ and there is a 1 in the the `seasxsppSummer.Littorina littorea` column and column and a -1 in the `seasxsppSpring.Littorina littorea` colum



## Creating a figure


```r
# palette
# blue, pink, green triadic
pal4 <- c("#256c7a", "#7a256c", "#6c7a25")

ggplot() +
  geom_point(data = periwinkle, aes(x = season,
                                    y = para,
                                    colour = species),
             position = position_jitterdodge(dodge.width = 1,
                                             jitter.width = 0.4,
                                             jitter.height = 0),
             size = 2) +
  geom_errorbar(data = peri_summary, 
                aes(x = season, ymin = mean - se, ymax = mean + se, group = species),
                width = 0.4, size = 1,
                position = position_dodge(width = 1)) +
  geom_errorbar(data = peri_summary, 
                aes(x = season, ymin = mean, ymax = mean, group = species),
                width = 0.3, size = 1,
                position = position_dodge(width = 1) ) +
  scale_x_discrete(name = "Season") +
  scale_y_continuous(name = "Number of parasites",
                     expand = c(0, 0),
                     limits = c(0, 128)) +
  scale_colour_manual(values = pal4[1:2],
                      labels = c(bquote(italic("L.brevicula")),
                                 bquote(italic("L.littorea")))) +
  # Spring:Littorina brevicula-Summer:Littorina littorea *
  annotate("segment", 
           x = 1.25, xend = 1.75, 
           y = 110, yend = 110,
           colour = "black") +
  annotate("segment", 
           x = 1.25, xend = 1.25,
           y = 110, yend = 105,
           colour = "black") +
  annotate("segment", 
           x = 1.75, xend = 1.75,
           y = 110, yend = 105,
           colour = "black") +
  annotate("text", 
           x = 1.5,  y = 112,
           label = "***", size = 6) +
  # Summer:Littorina brevicula-Spring:Littorina littorea: ***
  annotate("segment", 
           x = 1.25, xend = 0.75,
           y = 90, yend = 90,
           colour = "black") +
  annotate("segment", 
           x = 1.25, xend = 1.25,
           y = 90, yend = 85,
           colour = "black") +
  annotate("segment", 
           x = 0.75, xend = 0.75,
           y = 90, yend = 85,
           colour = "black") +
  annotate("text", x = 1,  y = 92,
           label = "*", size = 6) +
# Summer:Littorina littorea-Spring:Littorina littorea: ***
  annotate("segment",
           x = 0.75, xend = 1.75,
           y = 120, yend = 120,
           colour = "black") +
  annotate("segment",
           x = 0.75, xend = 0.75,
           y = 120, yend = 115,
           colour = "black") +
  annotate("segment",
           x = 1.75, xend = 1.75,
           y = 120, yend = 115,
           colour = "black") +
  annotate("text", x = 1.25,  y = 123,
           label = "***", size = 6) +
  theme_classic() +
  theme(legend.title = element_blank(),
        legend.position = c(0.85, 0.98)) 
```

<img src="two-way-anova-revisit_files/figure-html/fig-two-anova-1.png" width="80%" style="display: block; margin: auto auto auto 0;" />


## Reporting the results
*to add: principle, sig, magnitude and direction of effects, test result, figure*

See figure \@ref(fig:fig-two-anova-report).

(ref:fig-two-anova-report) periwinkles blah blah

<div class="figure" style="text-align: left">
<img src="two-way-anova-revisit_files/figure-html/fig-two-anova-report-1.png" alt="(ref:fig-two-anova-report)" width="60%" />
<p class="caption">(\#fig:fig-two-anova-report)(ref:fig-two-anova-report)</p>
</div>


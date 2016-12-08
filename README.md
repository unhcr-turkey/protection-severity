# Compilation of protection severity index 

The protection severity index is calculated from multiple indicators.

The approach in this project is following the recommandations from the [OECD handbook](http://www.oecd.org/std/leading-indicators/42495745.pdf). [Training materials](https://ec.europa.eu/jrc/sites/jrcsh/files/coin2016trainingslidescointool.zip) were also provide by the [JRC-COIN].

the [Competence Centre on Composite Indicators and Scoreboards (COIN) of the  European Joint Research Center](https://ec.europa.eu/jrc/en/coin).

In the humanitarian sector another example of composite indicator is the [INFORM – humanitarian risk management index](http://www.inform-index.org/). 


## Preparing data

### Loading data directly from KoboToolbox

* Data & Form is loaded directly from Kobotoolbox API

* Form definition allow to reencode the dataset

### Compiling indicator values from the questions

Each questions is linked to:

* Indicator name
* Indicator group
* Indicator Calculation: this field is used in order to automatise indicator calculations

Indicator calculation is dependent on whether:
* Questions results to be used directly as indicator value
* Questions results to be used a sole numerator
* Questions results to be used as one of the numerators to be sumed up
* Questions results to be used a sole denominator
* Questions results to be used as one of the denominators to be sumed up

## Exploring Data

### Creating graphs

Based on question type, a series of graph can be automatically generated from each questions:

* Boxplot
* Bar plot to show distribution 
* Histogramm
* Line chart to display evolution over time

### Creating maps

maps are used mostly to disply z-score in o


## Composite Indicators preparation


### Treat the data (missing value, outliers) 

 * Missing value: Not more than 25% missing data per indicator.  
 * Outliers detection: identify and deal with extreme value. 

### Explore the correlations

Here we need to check the correlation between indicators. The objective of the composite indicator is to capture the maximum of variance.

We are actually looking for intermediate correlations:
 * Two highly correlated indicators actually describe the same effect or situation - meaning that one of the two indicators coudl actually be taken out of consideration
 
 * Negatively correlated indicators should be avoided, unless it the direction of the indicator can be inverted.
 
 * Poorly correlated indicators are likely not indicate the same phenomenon.

### Standardize/normalize the data 

 * Adjust for measurement unit
 * Adjust for variance
 * Adjust for range
 * Adjust for extreme values


### Define the weight of each indicator 

 * Weights based on statistical models
 * Weights based on scores
 * Weights based on participation or on ranks

### Develop an aggregation method 

Define indicators that can be added together and Indicators that should be multiplied (no compensability): for instance Access to education & Access to health care


### Assess robustness & sensitivity 

Ensure that the decision made for normalization, weighting and aggregation have limited effects on the final ranking


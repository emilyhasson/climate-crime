# The Effect of Local Climate on Violent Crime Rates

Linear regression analyzing the impact of various climate features on crime rates.

## How does weather affect crime rates?
- High ambient temperatures correlated with higher assault rates (Cohn 1990)
- Weather could impact mood, activity levels, policing practices, etc.
- Possible confounding factors:
  - Income/socioeconomic status
  - Population density
<img src="https://github.com/emilyhasson/climate-crime/assets/55060753/dc06d0d6-c46b-4148-877f-71bda259e9e6" width="200">



## Data Collection
- I used statewide measurements for simplicity.
- Compilation of data from multiple sources 
  - NOAA National Climatic Data Center
  - FBI Uniform Crime Reporting Program
  - Wikipedia
- Final list of variables included:
  - Violent Crime Rates
  - Average Temperature
  - Average Num. Clear Days per Year
  - Average Yearly Precipitation 
  - Population
  - Land Area 
  - Median Income
  - Mean Num. Days with Min. Temp Below Freezing
 

<img src="https://github.com/emilyhasson/climate-crime/assets/55060753/49988093-418b-4f6a-889b-897c2c84746d" width="200">
<img src="https://github.com/emilyhasson/climate-crime/assets/55060753/8a706c74-8646-471b-9cad-f349c0550ffc" width="130">
 
## Data Exploration and Outlier Analysis

<img src="https://github.com/emilyhasson/climate-crime/assets/55060753/5d6338ad-d6ab-48a8-92e1-f7e155e5ee67" width="300">
<img src="https://github.com/emilyhasson/climate-crime/assets/55060753/d89960a5-5c30-4b40-9f1a-9f30cb219fce" width="300">
<img src="https://github.com/emilyhasson/climate-crime/assets/55060753/ec23e5a5-16ad-4ba5-b5f3-4ff79b66cad1" width="300">
<img src="https://github.com/emilyhasson/climate-crime/assets/55060753/84802788-6d2b-403c-972f-2fb304a3a728" width="300">
<img src="https://github.com/emilyhasson/climate-crime/assets/55060753/3725934b-3851-40af-a445-6c2770cceb14" width="300">
<img src="https://github.com/emilyhasson/climate-crime/assets/55060753/32081975-b3db-4681-8df2-d94ec6d88029" width="300">

New Jersey has the highest population density.
Arizona has teh highest number of clear days.

## The Model

- Multiple linear regression: I proceed with multiple linear regression to analyze many different potential variables, and the interaction between those variables.
- Backwards elimination process for variable selection
- Consider removing outliers
- Final model includes (in order of significance:
  1. Interaction between Avg Temp and Clear Days
  2. Average Temp
  3. Clear Days
  4. Median Income

<img src="https://github.com/emilyhasson/climate-crime/assets/55060753/4383a8cb-c080-4bd8-b09e-2c5e90026c91" width="300">

## Results

- Higher Average Temperature -> Slightly more crime
- More clear days -> More crime
- Higher median income -> Less crime

<img src="https://github.com/emilyhasson/climate-crime/assets/55060753/759103ee-e9fe-415c-bffe-713a39c8f19b" width="300">
<img src="https://github.com/emilyhasson/climate-crime/assets/55060753/b714786d-7ece-4742-a314-dba7a858f23b" width="300">
<img src="https://github.com/emilyhasson/climate-crime/assets/55060753/2661905b-31b5-444d-8ee5-053a356ff546" width="300">

## Temperature - Clear Days Interaction

The interaction term tells us how the number of clear days changes the effect the temperature will have on crime rates.

When there are many clear days, higher temperature is correlated with more crime.

<img src="https://github.com/emilyhasson/climate-crime/assets/55060753/0c0e4703-016a-442c-868f-5c887589f166" width="300">

When there are few clear days, higher temperature is correlated with less crime.

<img src="https://github.com/emilyhasson/climate-crime/assets/55060753/bb1c0cb2-733a-45bc-8f5d-40d81cd96e5b" width="300">

## Conclusion

- We see a notable difference between hot, dry weather and hot, wet weather.
- The number of clear days and temperature may be more influential predictors than median income.
- New questions raised:
  - Does something about clear days actually cause more violence, or is there some confounding factor there that we haven’t considered?
  - Is this trend applicable to other parts of the world, or between cities instead of states, or on a daily or monthly scale rather than a scale of yearly averages?

## References

Table 4: Crime in the United States by Region, Geographic Division, and State, 2018–2019. (2019). FBI. https://ucr.fbi.gov/crime-in-the-u.s/2019/crime-in-the-u.s.-2019/topic-pages/tables/table-4

National Centers for Environmental Information (NCEI). (2021). Climate Data Online (CDO)  | National Climatic Data Center (NCDC). National Oceanic and Atmospheric Administration (NOAA). https://www.ncdc.noaa.gov/cdo-web/

List of U.S. states and territories by income. (2022, March 30). In Wikipedia. https://en.wikipedia.org/wiki/List_of_U.S._states_and_territories_by_income

List of U.S. states and territories by area. (2022, April 17). In Wikipedia. https://en.wikipedia.org/wiki/List_of_U.S._states_and_territories_by_area

List of U.S. states by population. (2021, October 4). In Simple English Wikipedia, the free encyclopedia. https://simple.wikipedia.org/wiki/List_of_U.S._states_by_population


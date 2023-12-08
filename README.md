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

## The Model

- Multiple linear regression 
- Backwards elimination process for variable selection
- Consider removing outliers
- Final model includes (in order of significance:
  1. Interaction between Avg Temp and Clear Days
  2. Average Temp
  3. Clear Days
  4. Median Income

<img src="https://github.com/emilyhasson/climate-crime/assets/55060753/4383a8cb-c080-4bd8-b09e-2c5e90026c91" width="300">





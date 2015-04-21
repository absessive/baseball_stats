# Usage
Use the app on [heroku](https://baseball-stats-ajit.herokuapp.com). Create a user to login. The app currently only supports a single year.

# OPS calculation
Use the formula for OPS as per [Easy Calculation](https://www.easycalculation.com/sports/baseball-ops-calculator.php)

OPS = ((H+BB+HBP)/ (AB+BB+SF+HBP))+(((1*B)+(2*D)+(3*T)+(4*HR))/AB)

# Limitations
Adding a year's data waits until the entire players' data has been created. This should be done as a background job (Sidekiq is my personal preference), which adds overhead while deploying to heroku.
Full unit tests (RSpecs) for all the code needs to be written. Since I'm prototyping an idea, I decided to forego that.
Need a relation between year and player models so that multiple years can be added and the tables can be viwed by year.
More validation for the models.
File validation.

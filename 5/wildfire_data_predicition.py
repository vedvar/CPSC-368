import pandas as pd
import sqlite3
import matplotlib.pyplot as plt
import numpy as np
from scipy.stats import pearsonr
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error, r2_score


# Create a connection to the SQLite database
conn = sqlite3.connect('your_database.db')

# Query the database and load the wildfire data into a pandas DataFrame
df_wildfire = pd.read_sql_query("SELECT * FROM wildfire_data", conn)

# Query the database and load the weather data into a pandas DataFrame
df_precipitation = pd.read_sql_query("SELECT * FROM weather_data", conn)

# Close the connection to the database
conn.close()

# Convert the 'Year' and 'Total_Hectares' columns to numeric
df_wildfire['Year'] = pd.to_numeric(df_wildfire['Year'], errors='coerce')
df_wildfire['Total_Hectares'] = pd.to_numeric(df_wildfire['Total_Hectares'].str.replace(',', ''), errors='coerce')

# Convert the 'Year' and 'Total_Precipitation' columns to numeric
df_precipitation['Year'] = pd.to_numeric(df_precipitation['LOCAL_YEAR'], errors='coerce')
df_precipitation['Total_Precipitation'] = pd.to_numeric(df_precipitation['TOTAL_PRECIPITATION'], errors='coerce')


# Group the precipitation data by year and calculate the sum
df_precipitation = df_precipitation.groupby('Year')['Total_Precipitation'].sum().reset_index()

# Merge the wildfire and precipitation data on the 'Year' column
df_merged = pd.merge(df_wildfire, df_precipitation, on='Year')

# Define the input (X) and output (y)
X = df_merged[['Total_Precipitation']]
y = df_merged['Total_Hectares']

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Create a linear regression model
model = LinearRegression()

# Train the model
model.fit(X_train, y_train)

# Make predictions
y_pred = model.predict(X_test)

# Print the coefficients of the model
print(f'Coefficients: {model.coef_}')
print(f'Intercept: {model.intercept_}')

# The mean squared error
print('Mean squared error: %.2f' % mean_squared_error(y_test, y_pred))

# The coefficient of determination: 1 is perfect prediction
print('Coefficient of determination: %.2f' % r2_score(y_test, y_pred))

# test precip in mm
test_precip = 250

# Reshape the input to a 2D array
test_precip_2d = np.array(test_precip).reshape(-1, 1)

# Make a prediction
test_wildfire = model.predict(test_precip_2d)

print(f'Predicted wildfire size for total precipitation of {test_precip}mm is {test_wildfire[0]} hectares ')
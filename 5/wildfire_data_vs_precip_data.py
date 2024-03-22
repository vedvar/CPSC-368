import pandas as pd
import sqlite3
import matplotlib.pyplot as plt
import numpy as np
from scipy.stats import pearsonr

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

# Fit a line to the data
m, b = np.polyfit(df_merged['Total_Precipitation'], df_merged['Total_Hectares'], 1)

# Calculate the correlation coefficient
r, _ = pearsonr(df_merged['Total_Precipitation'], df_merged['Total_Hectares'])

# Create the plot
plt.figure(figsize=(10,6))
plt.scatter(df_merged['Total_Precipitation'], df_merged['Total_Hectares'], color='tab:blue')
plt.plot(df_merged['Total_Precipitation'], m*df_merged['Total_Precipitation'] + b, color='tab:red')

# Print the equation and R-squared value on the graph
plt.text(0.05, 0.95, f'y = {m:.2f}x + {b:.2f}\nR-squared = {r**2:.2f}', transform=plt.gca().transAxes)

plt.xlabel('Total Precipitation')
plt.ylabel('Total Hectares')
plt.title('Wildfire Size vs Total Precipitation')
plt.show()

plt.savefig('wildfire_data_vs_precip_data.png')
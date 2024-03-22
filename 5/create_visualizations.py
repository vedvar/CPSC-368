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

# Query the database and load the data into Pandas DataFrame
df_precipitation = pd.read_sql_query("SELECT * FROM weather_data", conn)
df_hydro = pd.read_sql_query("SELECT * FROM hydro_data", conn)
df_wildfire = pd.read_sql_query("SELECT * FROM wildfire_data", conn)

# Close the connection to the database
conn.close()

# Cleaning the data for use by converting strings data types to numeric data
df_wildfire['Year'] = pd.to_numeric(df_wildfire['Year'], errors='coerce')
df_wildfire['Total_Hectares'] = pd.to_numeric(df_wildfire['Total_Hectares'].str.replace(',', ''), errors='coerce')
df_precipitation['Year'] = pd.to_numeric(df_precipitation['LOCAL_YEAR'], errors='coerce')
df_precipitation['Total_Precipitation'] = pd.to_numeric(df_precipitation['TOTAL_PRECIPITATION'], errors='coerce')
df_hydro['Year'] = pd.to_numeric(df_hydro['LocalYear'], errors='coerce')
df_hydro['Total_Flow'] = pd.to_numeric(df_hydro['Value'], errors='coerce')


## Create the first visualization: Graphing Wildfire Size and Total Precipitation by Year
# Group the precipitation data by year and calculate the sum
df_precipitation_v1 = df_precipitation.groupby('Year')['Total_Precipitation'].sum().reset_index()

# Create the plot
fig, ax1 = plt.subplots(figsize=(10,6))

# Plot the wildfire data on first y-axis
ax1.plot(df_wildfire['Year'], df_wildfire['Total_Hectares'], label='Wildfire Size', color='tab:blue')
ax1.set_xlabel('Year')
ax1.set_ylabel('Total Hectares', color='tab:red')
ax1.tick_params(axis='y', labelcolor='tab:red')

# Plot the precipitation data on second y-axis
ax2 = ax1.twinx()
ax2.plot(df_precipitation_v1['Year'], df_precipitation_v1['Total_Precipitation'], label='Total Precipitation', color='tab:red')
ax2.set_ylabel('Total Precipitation', color='tab:blue')
ax2.tick_params(axis='y', labelcolor='tab:blue')

# Set the x-axis limits and show graph
ax1.set_xlim([2008, df_wildfire['Year'].max()])
fig.tight_layout()
plt.title('Wildfire Size and Total Precipitation by Year')
plt.show()

# Save created graph
plt.savefig('wildfire_data_wrt_precip_data.png')


## Create second visualization: Graphing Wildfire Size and Total River Flow by Year
# Group the Flow data by year and calculate the sum
df_hydro_v1 = df_hydro.groupby('Year')['Total_Flow'].sum().reset_index()

# Create the plot
fig, ax1 = plt.subplots(figsize=(10,6))

# Plot the wildfire data on the first y-axis
ax1.plot(df_wildfire['Year'], df_wildfire['Total_Hectares'], label='Wildfire Size', color='tab:blue')
ax1.set_xlabel('Year')
ax1.set_ylabel('Total Hectares', color='tab:red')
ax1.tick_params(axis='y', labelcolor='tab:red')

# Plot the hydrological data on the second y-axis
ax2 = ax1.twinx()
ax2.plot(df_hydro_v1['Year'], df_hydro_v1['Total_Flow'], label='Total Flow', color='tab:red')
ax2.set_ylabel('Total river flow', color='tab:blue')
ax2.tick_params(axis='y', labelcolor='tab:blue')

# Set the x-axis limits and show graph
ax1.set_xlim([2012, df_wildfire['Year'].max()])
fig.tight_layout()
plt.title('Wildfire Size and Total Flow by Year')
plt.show()

# Save created graph
plt.savefig('wildfire_data_wrt_river_flow.png')


## Create third visualization: Graphing Wildfire Size versus Total Precipitation
# Group the precipitation data by year and calculate the sum
df_precipitation_v3 = df_precipitation.groupby('Year')['Total_Precipitation'].sum().reset_index()

# Merge the wildfire and precipitation data on the 'Year' column
df_merged = pd.merge(df_wildfire, df_precipitation_v3, on='Year')

# Fit a line to the data and calculate correlation coefficient
m, b = np.polyfit(df_merged['Total_Precipitation'], df_merged['Total_Hectares'], 1)
r, _ = pearsonr(df_merged['Total_Precipitation'], df_merged['Total_Hectares'])

# Create the plot
plt.figure(figsize=(10,6))
plt.scatter(df_merged['Total_Precipitation'], df_merged['Total_Hectares'], color='tab:blue')
plt.plot(df_merged['Total_Precipitation'], m*df_merged['Total_Precipitation'] + b, color='tab:red')

# Print the equation and R-squared value and show graph
plt.text(0.05, 0.95, f'y = {m:.2f}x + {b:.2f}\nR-squared = {r**2:.2f}', transform=plt.gca().transAxes)
plt.xlabel('Total Precipitation')
plt.ylabel('Total Hectares')
plt.title('Wildfire Size vs Total Precipitation')
plt.show()

# Save created graph
plt.savefig('wildfire_data_vs_precip_data.png')


## Create prediction model for annual wildfire size

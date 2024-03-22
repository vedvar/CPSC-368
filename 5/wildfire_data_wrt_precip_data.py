import pandas as pd
import sqlite3
import matplotlib.pyplot as plt

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

# Create the plot
fig, ax1 = plt.subplots(figsize=(10,6))

# Plot the wildfire data
ax1.plot(df_wildfire['Year'], df_wildfire['Total_Hectares'], label='Wildfire Size', color='tab:blue')
ax1.set_xlabel('Year')
ax1.set_ylabel('Total Hectares', color='tab:red')
ax1.tick_params(axis='y', labelcolor='tab:red')

# Create a second y-axis for the precipitation data
ax2 = ax1.twinx()
ax2.plot(df_precipitation['Year'], df_precipitation['Total_Precipitation'], label='Total Precipitation', color='tab:red')
ax2.set_ylabel('Total Precipitation', color='tab:blue')
ax2.tick_params(axis='y', labelcolor='tab:blue')

# Set the x-axis limits
ax1.set_xlim([2008, df_wildfire['Year'].max()])

fig.tight_layout()
plt.title('Wildfire Size and Total Precipitation by Year')
plt.show()
plt.savefig('wildfire_data_wrt_precip_data.png')
import pandas as pd
import sqlite3
import matplotlib.pyplot as plt

# Create a connection to the SQLite database
conn = sqlite3.connect('your_database.db')

# Query the database and load the wildfire data into a pandas DataFrame
df_wildfire = pd.read_sql_query("SELECT * FROM wildfire_data", conn)

# Query the database and load the weather data into a pandas DataFrame
df_hydro = pd.read_sql_query("SELECT * FROM hydro_data", conn)

# Close the connection to the database
conn.close()

# Convert the 'Year' and 'Total_Hectares' columns to numeric
df_wildfire['Year'] = pd.to_numeric(df_wildfire['Year'], errors='coerce')
df_wildfire['Total_Hectares'] = pd.to_numeric(df_wildfire['Total_Hectares'].str.replace(',', ''), errors='coerce')

# Convert the 'Year' and 'Total_Flow' columns to numeric
df_hydro['Year'] = pd.to_numeric(df_hydro['LocalYear'], errors='coerce')
df_hydro['Total_Flow'] = pd.to_numeric(df_hydro['Value'], errors='coerce')


# Group the Flow data by year and calculate the sum
df_hydro = df_hydro.groupby('Year')['Total_Flow'].sum().reset_index()

# Create the plot
fig, ax1 = plt.subplots(figsize=(10,6))

# Plot the wildfire data
ax1.plot(df_wildfire['Year'], df_wildfire['Total_Hectares'], label='Wildfire Size', color='tab:blue')
ax1.set_xlabel('Year')
ax1.set_ylabel('Total Hectares', color='tab:blue')
ax1.tick_params(axis='y', labelcolor='tab:blue')

# Create a second y-axis for the Flow data
ax2 = ax1.twinx()
ax2.plot(df_hydro['Year'], df_hydro['Total_Flow'], label='Total Flow', color='tab:red')
ax2.set_ylabel('Total river flow', color='tab:red')
ax2.tick_params(axis='y', labelcolor='tab:red')

# Set the x-axis limits
ax1.set_xlim([2012, df_wildfire['Year'].max()])

fig.tight_layout()
plt.title('Wildfire Size and Total Flow by Year')
plt.show()
plt.savefig('wildfire_data_wrt_river_flow.png')
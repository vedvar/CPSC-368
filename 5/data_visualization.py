import pandas as pd
import sqlite3
import matplotlib.pyplot as plt

# Create a connection to the SQLite database
conn = sqlite3.connect('your_database.db')

# Query the database and load the data into a pandas DataFrame
df = pd.read_sql_query("SELECT * FROM wildfire_data", conn)

# Close the connection to the database
conn.close()

# Convert the 'Year' and 'Total_Hectares' columns to numeric
df['Year'] = pd.to_numeric(df['Year'], errors='coerce')
df['Total_Hectares'] = pd.to_numeric(df['Total_Hectares'].str.replace(',', ''), errors='coerce')

#df['Total_Hectares'] = pd.to_numeric(df['Total_Hectares'], errors='coerce')

print(df)
print(df.columns)
print(df['Total_Hectares'].dtypes)

# Plot the data
plt.figure(figsize=(10,6))
plt.plot(df['Year'], df['Total_Hectares'], label='Wildfire Size')

plt.xlabel('Year')
plt.ylabel('Total Hectares')
plt.title('Wildfire Size by Year')
plt.legend()  # This will now include 'Wildfire Size' in the legend
plt.show()

# Save the plot to a file
plt.savefig('plot.png')
import pandas as pd
import sqlite3
import matplotlib.pyplot as plt

# Create a connection to the SQLite database
conn = sqlite3.connect('your_database.db')

# Query the database and load the data into a pandas DataFrame
df = pd.read_sql_query("SELECT * FROM hydro_data", conn)

# Close the connection to the database
conn.close()

# Plot the data
plt.figure(figsize=(10,6))
for location in df['Location'].unique():
    subset = df[df['Location'] == location]
    plt.plot(subset['LocalMonth'], subset['Value'], label=location)

plt.legend()

# Save the plot to a file
plt.savefig('plot.png')
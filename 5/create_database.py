import sqlite3

# Code Source: https://www.ionos.ca/digitalguide/websites/web-development/sqlite3-python/

# Open and read the file
with open('sql_table.sql', 'r') as f:
    sql_commands = f.read()

# Connect to the SQLite database
conn = sqlite3.connect('your_database.db')

# Create a cursor object
cursor = conn.cursor()

# Execute the SQL commands
cursor.executescript(sql_commands)

# Commit the changes
conn.commit()

# Close the connection
conn.close()
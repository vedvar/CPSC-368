import csv

def csv_to_sql_insert(csv_filename, table_name):
    with open(csv_filename, 'r') as f:
        reader = csv.reader(f)
        columns = next(reader)
        
        # Create table if it doesn't exist
        columns_with_type = ', '.join([f'{col} VARCHAR2(100)' for col in columns])
        drop_table = f"DROP TABLE {table_name};"
        create_table_sql = f"CREATE TABLE {table_name} ({columns_with_type});"
        
        with open("sql_table.sql", "a") as w:
            w.write(drop_table + "\n")
            w.write(create_table_sql)
            w.write("\n")
            
            # Insert CSV data into table
            for row in reader:
                columns_str = ', '.join(columns)
                values_str = ', '.join(f"'{value}'" for value in row)
                insert_sql = f"INSERT INTO {table_name} ({columns_str}) VALUES ({values_str});"
                w.write(insert_sql)
                w.write("\n")

csv_to_sql_insert("Kelowna_48369_station_data.csv", "weather_data")

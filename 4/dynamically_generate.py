import csv

# function to delete file contents
def delete_file_contents(file_name):
    with open(file_name, 'w') as file:
        file.write('')

def copy_file(source_file, destination_file):
    with open(source_file, 'r') as src:
        data = src.read()

    with open(destination_file, 'w') as dest:
        dest.write(data)

def csv_to_sql_insert(csv_filename, table_name):
    with open(csv_filename, 'r') as f:
        reader = csv.reader(f)
        columns = next(reader)
        
        # Create table if it doesn't exist
        columns_with_type = ', '.join([f'{col} VARCHAR2(100)' for col in columns])
        #drop_table = f"DROP TABLE {table_name};"
        #create_table_sql = f"CREATE TABLE {table_name} ({columns_with_type});"
        
        with open("sql_table.sql", "a") as w:
            #w.write(drop_table + "\n")
            #w.write(create_table_sql)
            #w.write("\n")
            
            # Insert CSV data into table
            for row in reader:
                columns_str = ', '.join(columns)
                values_str = ', '.join(f"'{value}'" for value in row)
                insert_sql = f"INSERT INTO {table_name} ({columns_str}) VALUES ({values_str});"
                w.write(insert_sql)
                w.write("\n")

delete_file_contents("sql_table.sql")
copy_file("crt_tables.sql", "sql_table.sql")
csv_to_sql_insert("Kelowna_48369_station_data.csv", "weather_data")
csv_to_sql_insert("Middle_Vernon_Creek_Hydro_Data.csv", "hydro_data")
csv_to_sql_insert("wildfire_data_bc.csv", "wildfire_data")



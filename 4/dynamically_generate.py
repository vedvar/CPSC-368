import csv

w = open("sql_table.sql", "a")

def csv_to_sql_insert(csv_filename, table_name):
    with open(csv_filename, 'r') as f:
        reader = csv.reader(f)
        columns = next(reader)
        for row in reader:
            columns_str = ', '.join(columns)
            values_str = ', '.join(f"'{value}'" for value in row)
            sql = f"INSERT INTO {table_name} ({columns_str}) VALUES ({values_str});"
            w.write(sql)
            w.write("\n")

csv_to_sql_insert("Kelowna_48369_station_data.csv", "weather_data")

w.close()
require 'json'
require 'pg'

# Define a method to establish a database connection
def connect_to_db
  conn = PG.connect(
    dbname: 'data_visualization_dashboard_development', 
    user: 'postgres',        
    password: 'password',    
    host: 'localhost'             
  )
  conn
end

# Read the JSON file
data = JSON.parse(File.read('jsondata.json'))

# Establish a database connection
conn = connect_to_db

# Iterate over the JSON data and insert it into the database
data.each do |entry|
  # Convert empty strings to nil for integer columns
  entry['end_year'] = entry['end_year'].empty? ? nil : entry['end_year'].to_i
  entry['start_year'] = entry['start_year'].empty? ? nil : entry['start_year'].to_i

  sql = <<-SQL
    INSERT INTO data_entries (end_year, intensity, sector, topic, insight, url, region, start_year, impact, added, published, country, relevance, pestle, source, title, likelihood)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17)
  SQL

  # Execute the SQL query with the data from the JSON entry
  conn.exec_params(
    sql,
    [
      entry['end_year'],
      entry['intensity'],
      entry['sector'],
      entry['topic'],
      entry['insight'],
      entry['url'],
      entry['region'],
      entry['start_year'],
      entry['impact'],
      entry['added'],
      entry['published'],
      entry['country'],
      entry['relevance'],
      entry['pestle'],
      entry['source'],
      entry['title'],
      entry['likelihood']
    ]
  )
end

# Close the database connection
conn.close

puts 'Data imported into the database.'

json_data = File.read('./jsondata.json')
data = JSON.parse(json_data)

# Iterate over the JSON data and create records
data.each do |entry|
  DataEntry.create!(
    end_year: entry['end_year'],
    intensity: entry['intensity'],
    sector: entry['sector'],
    topic: entry['topic'],
    insight: entry['insight'],
    url: entry['url'],
    region: entry['region'],
    start_year: entry['start_year'],
    impact: entry['impact'],
    added: entry['added'],
    published: entry['published'],
    country: entry['country'],
    relevance: entry['relevance'],
    pestle: entry['pestle'],
    source: entry['source'],
    title: entry['title'],
    likelihood: entry['likelihood']
  )
end

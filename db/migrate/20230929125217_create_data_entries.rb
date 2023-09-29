class CreateDataEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :data_entries do |t|
      t.integer :end_year
      t.integer :intensity
      t.string :sector
      t.string :topic
      t.string :insight
      t.string :url
      t.string :region
      t.integer :start_year
      t.string :impact
      t.datetime :added
      t.datetime :published
      t.string :country
      t.integer :relevance
      t.string :pestle
      t.string :source
      t.string :title
      t.integer :likelihood

      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end

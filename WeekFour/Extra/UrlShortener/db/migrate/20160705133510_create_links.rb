class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :originalUrl
      t.string :shortUrl

      t.timestamps
    end
  end
end

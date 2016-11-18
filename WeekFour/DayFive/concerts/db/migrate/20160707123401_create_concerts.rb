class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :title
      t.string :venue
      t.datetime :date
      t.float :price
      t.string :description
      t.references :city, index:true
      t.references :artist, index:true
      t.timestamps
    end
  end
end

class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :poster
      t.string :year
      t.string :synopsis
      t.timestamps
    end
  end
end

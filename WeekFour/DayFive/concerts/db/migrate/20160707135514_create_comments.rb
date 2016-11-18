class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.string :user
      t.references :concert, index:true
      t.timestamps
    end
  end
end

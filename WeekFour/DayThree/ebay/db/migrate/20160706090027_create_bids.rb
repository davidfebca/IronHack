class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.float :amount
      t.references :product, index:true
      t.references :user, index:true
      t.timestamps
    end
  end
end

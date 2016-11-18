class Product < ActiveRecord::Base
  belongs_to :user
  has_many :bids

  def getBiggestBid
    self.bids.max_by do |element|
      element.amount
    end
  end
end

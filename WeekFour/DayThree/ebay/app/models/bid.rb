class Bid < ActiveRecord::Base
  belongs_to :product
  validates :amount, presence: true
end

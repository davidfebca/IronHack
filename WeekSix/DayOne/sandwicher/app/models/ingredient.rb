class Ingredient < ActiveRecord::Base
  has_many :sandwiches
end

class Artist < ActiveRecord::Base
  has_many :concerts
  validates :name, presence: true
end

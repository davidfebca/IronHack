class Concert < ActiveRecord::Base
  belongs_to :city
  belongs_to :artist
  has_many :comments
  validates :title, presence: true
  validates :venue, presence: true
  validates :price, presence: true
  validates :date, presence: true
  validates :description, presence: true
  has_attached_file :image, styles: { large: "400x500",small:"200x200" },:path => "public/system/:class/:id/:filename",
    :url => "/system/:class/:id/:basename.:extension"
  validates_attachment :image,content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end

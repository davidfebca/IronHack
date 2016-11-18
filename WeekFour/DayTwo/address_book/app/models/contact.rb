class Contact < ActiveRecord::Base
  has_attached_file :image, styles: { large: "200x200" },:path => "public/system/:class/:id/:filename",
    :url => "/system/:class/:id/:basename.:extension"
  validates_attachment :image,content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end

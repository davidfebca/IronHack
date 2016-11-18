class Comment < ActiveRecord::Base
  belongs_to :concert
  validates :content, presence: true
  validates :user, presence: true
end

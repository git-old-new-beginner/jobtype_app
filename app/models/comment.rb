class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :webtype

  validates :text, presence: true
end

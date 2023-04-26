class Comment < ApplicationRecord
  belongs_to :user
  has_many :replies
  validates :comment, presence: true
end

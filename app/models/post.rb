class Post < ApplicationRecord
  belongs_to :user
  has_many :hate
  default_scope { order(created_at: :desc) }
  validates :content, length: { maximum: 140 }, presence: true
end

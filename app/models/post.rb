class Post < ApplicationRecord
  belongs_to :user

  validates :content, length: { maximum: 100 }, presence: true
  validates :image_url, allow_blank: true
end

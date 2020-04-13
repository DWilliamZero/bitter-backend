class Hate < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # validate :realism

  # private

  # def realism
  #   return unless user_id == @current_user.id
  #   errors.add :error, "You can't hate your own posts, Weirdo!"
  # end
end

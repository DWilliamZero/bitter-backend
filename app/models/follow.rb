class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'User', counter_cache: :follower_count
  belongs_to :followee, class_name: 'User', counter_cache: :followee_count

  validate :realism

  private

  def realism
    return unless follower_id == followee_id
    errors.add :error, "You can't follow yourself, Dummy!"
  end
end


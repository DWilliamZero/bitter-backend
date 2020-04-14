class DropFolloweesFollowersTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :followees_followers
  end
end

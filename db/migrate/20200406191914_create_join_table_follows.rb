class CreateJoinTableFollows < ActiveRecord::Migration[6.0]
  def change
    create_join_table :followers, :followees do |t|
      # t.index [:follower_id, :followee_id]
      # t.index [:followee_id, :follower_id]
    end
  end
end

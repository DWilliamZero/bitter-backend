class RemoveCountersFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :followers_count
    remove_column :users, :followees_count
  end
end

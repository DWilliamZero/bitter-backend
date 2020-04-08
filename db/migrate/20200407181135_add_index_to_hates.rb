class AddIndexToHates < ActiveRecord::Migration[6.0]
  def change
    add_index :hates, [:user_id, :post_id], :unique => true
  end
end

class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :likes
    remove_column :todos, :likes
  end
end

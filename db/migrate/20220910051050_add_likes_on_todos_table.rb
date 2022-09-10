class AddLikesOnTodosTable < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :likes, :int, default: 0
  end
end

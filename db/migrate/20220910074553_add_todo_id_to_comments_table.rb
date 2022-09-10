class AddTodoIdToCommentsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :todo_id, :int
  end
end

class AddIsDeletedColumnToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :is_deleted, :boolean, default: false
  end
end

class AddCompletedColumnToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :completed, :boolean, default: false
  end
end

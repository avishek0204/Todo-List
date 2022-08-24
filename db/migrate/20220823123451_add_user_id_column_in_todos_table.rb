class AddUserIdColumnInTodosTable < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :user_id, :int
  end
end

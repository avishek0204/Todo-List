class AddUserIdToCommentTable < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :user_id, :int
  end
end

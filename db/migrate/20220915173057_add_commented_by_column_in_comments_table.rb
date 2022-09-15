class AddCommentedByColumnInCommentsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :commented_by, :string, default: "admin"
  end
end

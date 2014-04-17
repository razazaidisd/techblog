class AddColumnToPost < ActiveRecord::Migration
  def change
     add_column :posts, :name, :string
     add_column :posts, :content, :text
     add_column :posts, :active, :string
  end
end

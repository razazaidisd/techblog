class AddUserIdtoPostTable < ActiveRecord::Migration
  def up
  end

  def change
  	  add_column :posts, :user_id, :integer
  end

  def down
  end
end

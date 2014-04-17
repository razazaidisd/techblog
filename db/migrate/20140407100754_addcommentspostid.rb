class Addcommentspostid < ActiveRecord::Migration
  def change
  	add_column :comments, :post_id, :integer
	end

  def down
  end
end

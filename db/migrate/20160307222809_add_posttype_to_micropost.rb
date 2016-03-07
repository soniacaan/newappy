class AddPosttypeToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :post_type, :integer
  end
end

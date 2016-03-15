class AddSlugToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :slug, :string
    add_index :microposts, :slug
  end
end

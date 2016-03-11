class AddtoMicroposts < ActiveRecord::Migration
  def change
  	add_column :microposts, type_post: text
  end
end

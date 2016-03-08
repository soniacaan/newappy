class AddtoMicroposts < ActiveRecord::Migration
  def change
  	add_column :microposts, type_post:string
  end
end

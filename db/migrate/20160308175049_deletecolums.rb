class Deletecolums < ActiveRecord::Migration
  def change
  		remove_column :microposts, :type
  end
end

class AddTypemicroToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :type_micro, :text
  end
end

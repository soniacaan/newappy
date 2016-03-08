class AddTypemicroToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :type_micro, :string
  end
end

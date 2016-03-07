class AddTypeToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :type, :string
  end
end

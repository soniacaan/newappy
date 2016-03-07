class AddMicrotypeToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :micro_type, :integer
  end
end

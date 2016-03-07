class CreateMicropostTypes < ActiveRecord::Migration
  def change
    create_table :micropost_types do |t|
      t.text :type
      t.references :micropost, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

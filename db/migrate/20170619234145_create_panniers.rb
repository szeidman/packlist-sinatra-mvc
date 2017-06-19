class CreatePanniers < ActiveRecord::Migration
  def change
    create_table :panniers do |t|
      t.string :name
      t.string :location
      t.integer :user_id
    end
  end
end

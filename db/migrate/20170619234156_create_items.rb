class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :weight
      t.integer :pannier_id
    end
  end
end

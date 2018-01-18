class CreateItems < ActiveRecord::Migration[4.2]
  def change
    create_table :items do |t|
      t.string :name
      t.float :weight
      t.integer :pannier_id
    end
  end
end

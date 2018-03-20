class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end

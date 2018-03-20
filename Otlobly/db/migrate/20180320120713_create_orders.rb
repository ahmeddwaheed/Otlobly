class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.text :area
      t.decimal :total, precision: 9, scale: 2
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

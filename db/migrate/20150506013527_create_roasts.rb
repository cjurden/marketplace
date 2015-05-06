class CreateRoasts < ActiveRecord::Migration
  def change
    create_table :roasts do |t|
      t.string :name
      t.string :roaster
      t.string :type
      t.text :description
      t.integer :price
      t.boolean :available, default: true

      t.timestamps null: false
    end
  end
end

class AddSlugsToRoasts < ActiveRecord::Migration
  def change
    add_column :roasts, :slug, :string
    add_index :roasts, :slug, unique: true
  end
end

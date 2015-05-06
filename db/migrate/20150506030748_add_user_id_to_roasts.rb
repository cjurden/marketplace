class AddUserIdToRoasts < ActiveRecord::Migration
  def change
    add_column :roasts, :user_id, :integer
  end
end

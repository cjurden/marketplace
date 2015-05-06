class AddAttachmentImageToRoasts < ActiveRecord::Migration
  def self.up
    change_table :roasts do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :roasts, :image
  end
end

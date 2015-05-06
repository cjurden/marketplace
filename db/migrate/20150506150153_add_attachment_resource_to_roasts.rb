class AddAttachmentResourceToRoasts < ActiveRecord::Migration
  def self.up
    change_table :roasts do |t|
      t.attachment :resource
    end
  end

  def self.down
    remove_attachment :roasts, :resource
  end
end

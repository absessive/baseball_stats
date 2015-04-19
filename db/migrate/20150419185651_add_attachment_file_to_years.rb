class AddAttachmentFileToYears < ActiveRecord::Migration
  def self.up
    change_table :years do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :years, :file
  end
end

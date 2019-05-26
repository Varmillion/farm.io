class AddAttachmentAvatarToUsers < ActiveRecord::Migration[5.2]
  def self.up
    change_table :users do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :users, :avatar
  end
  def self.up
    change_table :users do |t|
      t.attachment :avatar
  end
  end

  def self.down
    remove_attachment :users, :avatar
  end

  def self.up
    change_table :users do |t|
      t.attachment :avatar
  end
  
  def self.down
    remove_attachment :users, :avatar
  end
end
end

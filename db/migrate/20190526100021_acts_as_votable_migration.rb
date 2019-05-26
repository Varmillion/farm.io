class ActsAsVotableMigration < ActiveRecord::Migration[4.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :ad, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
  def self.down
    drop_table :comments
  end

end

class CreateAds < ActiveRecord::Migration[5.2]
  def change
    create_table :ads do |t|
      t.string :location
      t.string :title
      t.integer :size
      t.boolean :status
      t.integer :price

      t.timestamps
    end
  end
end

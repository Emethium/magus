class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.references :donator, foreign_key: true
      t.date :collectionDate
      t.integer :weight
      t.string :aptitude

      t.timestamps
    end
  end
end

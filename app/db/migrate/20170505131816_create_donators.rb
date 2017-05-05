class CreateDonators < ActiveRecord::Migration[5.0]
  def change
    create_table :donators do |t|
      t.string :name
      t.string :sex
      t.string :address
      t.string :bloodType
      t.string :rhFactor
      t.integer :age
      t.date :lastDonation

      t.timestamps
    end
  end
end

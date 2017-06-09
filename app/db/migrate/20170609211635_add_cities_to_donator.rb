class AddCitiesToDonator < ActiveRecord::Migration[5.0]
  def change
    add_column :donators, :city, :string
  end
end

class AddPhoneNumberToDonators < ActiveRecord::Migration[5.0]
  def change
    add_column :donators, :phone, :string
  end
end

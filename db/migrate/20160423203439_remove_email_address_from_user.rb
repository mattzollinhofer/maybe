class RemoveEmailAddressFromUser < ActiveRecord::Migration[4.2]
  def change
    remove_column :users, :email_address, :string
  end
end

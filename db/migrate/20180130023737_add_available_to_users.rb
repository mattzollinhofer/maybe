class AddAvailableToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :available_at, :datetime
    add_column :users, :unavailable_at, :datetime
  end
end

class AddAvailableToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :available, :boolean, default: false
    add_column :users, :unavailable_at, :datetime
  end
end

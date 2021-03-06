class CreateUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email_address, null: false
      t.string :mobile_number

      t.timestamps null: false
    end
  end
end

class DeviseCreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end

    add_index :customers, :email,              unique: true
  end
end

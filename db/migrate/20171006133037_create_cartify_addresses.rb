class CreateCartifyAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :cartify_addresses do |t|
      t.string :type
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.integer :zip
      t.string :country
      t.string :phone
      t.references :user, foreign_key: true
    end
  end
end

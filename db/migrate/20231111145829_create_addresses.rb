class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :region_id
      t.bigint :country_id
      t.string :zip_code
      t.bigint :user_id

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :account_apprvl
      t.boolean :user_confirm
      t.boolean :store_hours
      t.boolean :store_flights
      t.integer :hours
      t.integer :flights

      t.timestamps
    end
  end
end

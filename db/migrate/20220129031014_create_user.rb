class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :password_digest
      t.string :reset_digest
      t.string :address
      t.datetime :reset_sent_at
      t.boolean :is_deactived
      t.string :employee_code
      t.date :birth_day
      t.string :github
      t.string :skype
      t.string :slack
      t.date :join_company_day
      
      t.datetime :deleted_at
      t.timestamps
    end
  end
end

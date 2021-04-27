class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :email, unique: true
    	t.string :password_digest
    	t.string :mobile_number
    	t.string :confirm_token
    	t.boolean :email_confirmed, :default => false 
    	t.index :email
    	t.timestamps
    end
  end
end


# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
     
    create_table :users do |t|
   
      t.string :email,              null:false, default: ""
      t.string :encrypted_password, null:false, default: ""
      t.string :nick_name,          null:false,default: ""
      t.string :first_name,          null:false,default: ""
      t.string :first_name_kana,     null:false,default: ""
      t.string :name,                null:false,default: ""
      t.string :name_kana,           null:false,default: ""
      t.date :birth_date,         null:false

      
    
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

  
      t.datetime :remember_created_at



      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    
  end
end

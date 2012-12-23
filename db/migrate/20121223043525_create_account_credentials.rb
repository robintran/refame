class CreateAccountCredentials < ActiveRecord::Migration
  def change
  	create_table :account_credentials do |t|
      t.string :uid
      t.string :token
      t.string :token_secret
      t.string :account_type
      t.references :user
      t.timestamps
    end
  end
end

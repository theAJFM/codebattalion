class CreateHackers < ActiveRecord::Migration
  def change
    create_table :hackers , id:false do |t|
      t.primary_key :ID_USER_ACCOUNT_KEY
      t.string :firstname
      t.string :lastname
      t.string :username
      t.string :password
      t.string :email
      t.integer :rating
      t.datetime :lastlogintime
      t.timestamps
    end
  end
end

class CreateProblemSetters < ActiveRecord::Migration
  def change
    create_table :problem_setters, id:false do |t|
      t.primary_key :ID_PROBLEM_SETTER_KEY
      t.string :firstname
      t.string :lastname
      t.string :username
      t.string :password
      t.integer :totalproblemsuploaded
      t.datetime :lastlogintime

      t.timestamps
    end
  end
end

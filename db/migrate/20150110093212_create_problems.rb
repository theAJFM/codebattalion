class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems, id:false do |t|
      t.primary_key :ID_PROBLEM_KEY
      t.string :ProblemName
      t.text :ProblemDescription
      t.date :ProblemTimeUploaded
      t.integer :ID_PROBLEM_SETTER_FKEY
      t.integer :ID_BUNDLE_FKEY
      t.integer :Points
      t.integer :TotalHackerSolved

      t.timestamps
    end
  end
end

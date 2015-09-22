class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions, id:false do |t|
      t.primary_key :ID_SUBMISSION_KEY
      t.integer :ID_PROBLEM_FKEY
      t.integer :ID_HACKER_FKEY
      t.string :SubmissionOutputURL
      t.string :Language
      t.time :SubmissionTime
      t.string :Verdict

      t.timestamps
    end
  end
end

class CreateTestCases < ActiveRecord::Migration
  def change
    create_table :test_cases, id:false do |t|
      t.primary_key :ID_TEST_CASES_KEY
      t.integer :ID_PROBLEM_FKEY
      t.string :TestCaseInputURL
      t.string :TestCaseOutputURL

      t.timestamps
    end
  end
end

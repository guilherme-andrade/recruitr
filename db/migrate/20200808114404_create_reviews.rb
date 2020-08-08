class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :applicant, null: false, foreign_key: true
      t.references :reviewer, polymorphic: true, null: false
      t.integer :interest_in_the_company, default: 0
      t.integer :experience, default: 0
      t.integer :dynamism, default: 0

      t.timestamps
    end
  end
end

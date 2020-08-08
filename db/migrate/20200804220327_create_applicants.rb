class CreateApplicants < ActiveRecord::Migration[6.0]
  def change
    create_table :applicants do |t|
      t.string :first_name
      t.string :last_name
      t.string :angelist_profile_url
      t.string :linkedin_profile_url
      t.string :email
      t.integer :applications_count, default: 0
      t.integer :seniority_level, default: 0

      t.timestamps
    end
  end
end

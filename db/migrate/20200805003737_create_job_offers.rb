class CreateJobOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :job_offers do |t|
      t.string :name
      t.integer :applications_count, default: 0
      t.integer :seniority_level, default: 0

      t.timestamps
    end
  end
end

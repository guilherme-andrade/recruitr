class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :application, null: false, foreign_key: true
      t.references :recruiter, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.string :remote_calendar_id

      t.timestamps
    end
  end
end

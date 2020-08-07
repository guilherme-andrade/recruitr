class CreateAppointment < ApplicationInteractor
  delegate :recruiter, :application, :start_time, :end_time, to: :context

  def call
    context.appointment = Appointment.create(
      recruiter: recruiter,
      application: application,
      start_time: start_time,
      end_time: end_time
    )
  end

  def rollback
    context.appointment.destroy
  end
end

class FilterAvailableRecruiters
  include Interactor

  delegate :recruiters, :start_time, :end_time, to: :context

  def call
    filter
  end

  private

  def filter
    context.recruiters = available_recruiters
  end

  def available_recruiters
    recruiters.includes(:appointments)
              .where.not('recruiters.id': ongoing_appointments.pluck(:recruiter_id))
  end

  def time_range
    start_time..end_time
  end

  def ongoing_appointments
    Appointment.within(time_range)
  end
end


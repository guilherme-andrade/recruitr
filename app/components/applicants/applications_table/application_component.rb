class Applicants::ApplicationsTable::ApplicationComponent < ViewComponentReflex::Component
  def initialize(application:)
    @application = application
    @appointment ||= application.appointment || application.build_appointment
    @appointment_start_time = nil
  end

  def collection_key
    @application.id
  end

  def pick_start_time
    @appointment_start_time = DateTime.parse(element.value)
    refresh! "start-time-#{@application.id}"
  end

  def create_appointment
    return unless @appointment_start_time

    result = OrganizeAppointment.call(
      start_time: @appointment_start_time,
      application: @application,
      end_time: @appointment_start_time + 1.hour
    )

    if result.success?
      @appointment = result.appointment
      refresh! "#application-#{collection_key}"
    end
  end

  def appointed_recruiter_full_name
    if @appointment.persisted?
      @appointment.recruiter.full_name
    else
      '-'
    end
  end

  def appointed_recruiter_match_percentage
    if @appointment.persisted?
      [@appointment.recruiter_match_percentage, '%'].join
    else
      '-'
    end
  end

  def appointment_schedule
    @appointment.start_time.strftime('%R - %d/%m/%y')
  end
end

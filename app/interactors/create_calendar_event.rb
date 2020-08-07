class CreateCalendarEvent < ApplicationInteractor
  delegate :appointment, to: :context
  delegate :recruiter, :application, :start_time, :end_time, to: :appointment
  delegate :applicant, to: :application

  delegate :full_name, to: :recruiter, prefix: true
  delegate :full_name, to: :applicant, prefix: true

  def call
    validate_attendees
    create_calendar_event
    update_appointment
  end

  def validate_attendees
    unless recruiter.is_a?(Recruiter) && applicant.is_a?(Applicant)
      context.fail!('calendar_event.attendees')
    end
  end

  def create_calendar_event
    service = GoogleCalendar::PostEvent.call(
      summary: 'Recuitr Call',
      location: '800 Howard St., San Francisco, CA 94103',
      description: "Call between #{recruiter_full_name} and #{applicant_full_name}.",
      start_time: start_time,
      end_time: end_time,
      attendees: [recruiter, applicant]
    )
    context.fail!('calendar_event.service_failure') unless service.success?

    context.calendar_event = service.result
  end

  def update_appointment
    appointment.update_attribute :remote_calendar_id, context.calendar_event.id
  end
end

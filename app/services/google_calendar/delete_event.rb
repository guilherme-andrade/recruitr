class GoogleCalendar::DeleteEvent < GoogleCalendar::BaseService
  attr_reader :appointment

  def call
    return unless appointment.remote_calendar_id

    result = @service.delete_event('primary', appointment.remote_calendar_id)
  end

  private

  def initialize(appointment:)
    @appointment = appointment
  end
end

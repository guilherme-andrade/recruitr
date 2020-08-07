class GoogleCalendar::GetEvent < GoogleCalendar::BaseService
  attr_reader :appointment

  def call
    result = @service.insert_event('primary', appointment.remote_calendar_id)
  end

  private

  def initialize(appointment:)
    @appointment = appointment
  end
end

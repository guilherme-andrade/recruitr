class GoogleCalendar::PostEvent < GoogleCalendar::BaseService
  attr_reader :summary, :description, :location, :start_time, :end_time, :attendees

  def call
    @result = @service.insert_event('primary', event_object)
  end

  private

  def initialize(summary:, description:, location:, start_time:, end_time:, attendees:)
    @summary     = summary
    @description = description
    @location    = location
    @start_time  = start_time
    @end_time    = end_time
    @attendees   = attendees
  end

  def event_attendees
    @event_attendees ||= attendees.map do |attendee|
      Google::Apis::CalendarV3::EventAttendee.new(email: attendee.email)
    end
  end

  def event_start_time
    @event_start_time ||= Google::Apis::CalendarV3::EventDateTime.new(
      date_time: start_time.strftime(DATE_FORMAT),
      time_zone: TIME_ZONE
    )
  end

  def event_end_time
    @event_start_time ||= Google::Apis::CalendarV3::EventDateTime.new(
      date_time: end_time.strftime(DATE_FORMAT),
      time_zone: TIME_ZONE
    )
  end

  def reminder_objects
    @reminder_objects ||= Google::Apis::CalendarV3::Event::Reminders.new(
      use_default: false,
      overrides: [
        Google::Apis::CalendarV3::EventReminder.new(
          reminder_method: 'email',
          minutes: 24 * 60
        ),
        Google::Apis::CalendarV3::EventReminder.new(
          reminder_method: 'popup',
          minutes: 10
        )
      ]
    )
  end

  def event_object
    @event_object ||= Google::Apis::CalendarV3::Event.new(
      summary:      summary,
      location:     location,
      description:  description,
      start:        event_start_time,
      end:          event_end_time,
      recurrence:   [],
      attendees:    event_attendees,
      reminders:    reminder_objects
    )
  end
end

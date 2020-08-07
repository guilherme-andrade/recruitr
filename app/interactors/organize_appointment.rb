class OrganizeAppointment < ApplicationOrganizer
  organize FindRecruitersForOffer,
           FilterAvailableRecruiters,
           SelectBestSuitedRecruiter,
           CreateAppointment,
           CreateCalendarEvent,
           NotifyEventAttendees
end

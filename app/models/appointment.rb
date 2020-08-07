class Appointment < ApplicationRecord
  belongs_to :application
  belongs_to :recruiter

  scope :within, ->(time_range) { where(start_time: time_range).or(where(end_time: time_range)) }

  after_destroy do
    GoogleCalendar::DeleteEvent.call(appointment: self)
  end

  def recruiter_match_percentage
    (recruiter_matching_skills.count.to_f / application.job_offer_skill_list.count * 100).round
  end

  def recruiter_matching_skills
    (recruiter.skill_list & application.job_offer_skill_list)
  end
end

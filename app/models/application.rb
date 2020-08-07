class Application < ApplicationRecord
  belongs_to :job_offer, counter_cache: true
  belongs_to :applicant, counter_cache: true

  has_one :appointment
  has_one :appointed_recruiter, through: :appointment, source: :recruiter

  accepts_nested_attributes_for :applicant

  delegate :name, :skill_list, to: :job_offer, prefix: true, allow_nil: true
  delegate :skill_list, :full_name, to: :applicant, prefix: true, allow_nil: true
  delegate :full_name, to: :appointed_recruiter, prefix: true, allow_nil: true

  def match_rate
    matching_skill_list = applicant_skill_list & job_offer_skill_list
    ((matching_skill_list.count.to_f / job_offer_skill_list.count) * 100).round
  end
end

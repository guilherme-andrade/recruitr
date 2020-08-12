class Applicants::BaseComponent < ApplicationComponent
  def initialize(applicant:)
    @applicant = applicant
  end
end

class Applicants::ApplicationsTableComponent < ViewComponent::Base
  def initialize(applicant:)
    @applicant = applicant
  end
end

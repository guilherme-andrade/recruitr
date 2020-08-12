class Applicants::Applications::TableComponent < ViewComponent::Base
  def initialize(applicant:)
    @applicant = applicant
  end
end

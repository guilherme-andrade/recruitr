class Applicants::ReviewModalComponent < ViewComponent::Base
  def initialize(applicant:, id:)
    @id = id
    @applicant = applicant
    @review = Review.new
  end

  def create_review
  end

  def set_review_attribute

  end
end

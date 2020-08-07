class JobOffers::ApplicationModalComponent < ViewComponent::Base
  def initialize(id:, job_offer:)
    @id = id
    @job_offer = job_offer
    @application = Application.new
  end
end

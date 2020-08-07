class JobOffers::ApplicationsTableComponent < ViewComponent::Base
  def initialize(job_offer:)
    @job_offer = job_offer
  end
end

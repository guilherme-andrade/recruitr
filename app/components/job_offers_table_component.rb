class JobOffersTableComponent < ViewComponent::Base
  def initialize(job_offers:)
    @job_offers = job_offers
  end
end

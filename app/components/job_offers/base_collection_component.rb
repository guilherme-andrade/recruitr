class JobOffers::BaseCollectionComponent < ApplicationComponent
  def initialize(job_offers:)
    @job_offers = job_offers
  end
end

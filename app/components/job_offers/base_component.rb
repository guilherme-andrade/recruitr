class JobOffers::BaseComponent < ApplicationComponent
  def initialize(job_offer:)
    @job_offer = job_offer
  end
end

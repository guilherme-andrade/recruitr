class JobOffers::Pages::IndexComponent < ApplicationComponent
  def initialize
    @job_offers = JobOffer.all
  end
end

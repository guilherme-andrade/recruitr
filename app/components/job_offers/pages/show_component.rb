class JobOffers::Pages::ShowComponent < ApplicationComponent
  def initialize
    @application_form_open = false
  end

  def before_render
    @job_offer = JobOffer.find(params[:id]) if params.key? :id
  end

  def open_application_form
    @application_form_open = true
  end

  def close_application_form
    @application_form_open = false
    @job_offer.applications.reload
  end

  def application_form_open?
    @application_form_open
  end
end

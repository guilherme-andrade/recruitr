class ApplicationsController < AuthenticatedController
  before_action :set_job_offer

  # POST /applications
  def create
    @application = @job_offer.applications.new(application_params)

    if @application.save
      flash[:notice] = 'Application succesfully created'
      redirect_back(fallback_location: job_offer_path(@job_offer))
    else
      flash[:alert] = 'Could not create application.'
      render 'job_offers/show'
    end
  end

  private
    def set_job_offer
      @job_offer = JobOffer.find(params[:job_offer_id])
    end

    # Only allow a trusted parameter "white list" through.
    def application_params
      params.fetch(:application, {}).permit(
        :applicant_id, :job_offer_id,
        applicant_attributes: [
          :first_name, :last_name, :angelist_profile_url,
          :linkedin_profile_url, :email,
          skill_list: []
        ]
      )
    end
end

class JobOffersController < AuthenticatedController
  before_action :set_job_offer, only: [:show, :edit, :update, :destroy]

  # GET /job_offers
  def index
    @job_offers = JobOffer.all
  end

  # GET /job_offers/1
  def show
    @application = Application.new
  end

  # GET /job_offers/new
  def new
    @job_offer = JobOffer.new
  end

  # POST /job_offers
  def create
    @job_offer = JobOffer.new(job_offer_params)

    if @job_offer.save
      redirect_to @job_offer, notice: 'Job offer was successfully created.'
    else
      render :new
    end
  end

  # DELETE /job_offers/1
  def destroy
    @job_offer.destroy
    redirect_to job_offers_url, notice: 'Job offer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_offer
      @job_offer = JobOffer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_offer_params
      params.fetch(:job_offer, {}).permit(:name, skill_list: [])
    end
end

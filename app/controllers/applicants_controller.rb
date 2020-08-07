class ApplicantsController < AuthenticatedController
  before_action :set_applicant, only: [:show]

  # GET /applicants/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant
      @applicant = Applicant.find(params[:id])
    end
end

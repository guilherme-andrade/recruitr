class ApplicantsController < AuthenticatedController
  def show
    render inline: render_to_string(Applicants::Pages::ShowComponent.new), layout: 'application'
  end
end

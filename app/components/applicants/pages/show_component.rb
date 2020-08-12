class Applicants::Pages::ShowComponent < ApplicationComponent
  def initialize
    @review_form_open = false
  end

  def before_render
    @applicant = Applicant.find(params[:id]) if params.key? :id
    @applicant.reviews.reload
  end

  def open_review_form
    @review_form_open = true
  end

  def close_review_form
    @review_form_open = false
  end

  def review_form_open?
    @review_form_open
  end
end

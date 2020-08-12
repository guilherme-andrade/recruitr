class JobOffers::Applications::FormComponent < JobOffers::BaseComponent
  def initialize(page_key:, job_offer:)
    @job_offer = job_offer
    @page_key = page_key
    @application = @job_offer.applications.new
    @applicant = @application.applicant || @application.build_applicant
  end

  def select_applicant
    @application.send("#{element.name}=", element.value)
    save_application
  end

  def update_applicant_field
    @applicant.send("#{element.name}=", element.value)
  end

  def add_skill
    if element.checked
      @applicant.skill_list.add(element.name)
    else
      @applicant.skill_list.remove(element.name)
    end
  end

  def create_applicant
    if @applicant.save
      @application = Application.new(job_offer: @job_offer, applicant: @applicant)
      save_application
    end
  end

  def save_application
    close if @application.save
  end

  def close
    stimulate('JobOffers::Pages::ShowComponent#close_application_form', { key: @page_key, **params_hash })
  end
end

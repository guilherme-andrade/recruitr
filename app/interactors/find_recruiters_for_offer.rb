class FindRecruitersForOffer
  include Interactor

  delegate :application, to: :context

  delegate :job_offer, to: :application

  delegate :skill_list, to: :job_offer, prefix: true

  def call
    find_recruiters_by_skills
  end

  private

  def find_recruiters_by_skills
    context.recruiters = Recruiter.tagged_with(job_offer_skill_list, any: true)
  end
end

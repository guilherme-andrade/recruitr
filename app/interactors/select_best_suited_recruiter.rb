class SelectBestSuitedRecruiter
  include Interactor

  delegate :recruiters, :application, to: :context

  def call
    select_recruiter
  end

  def select_recruiter
    context.recruiter = best_suited_recruiter
  end

  def best_suited_recruiter
    recruiters.max_by do |recruiter|
      (recruiter.skill_list & application.job_offer_skill_list).count
    end
  end
end

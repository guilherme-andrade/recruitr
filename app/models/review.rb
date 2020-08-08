class Review < ApplicationRecord
  belongs_to :applicant, touch: true
  belongs_to :reviewer, polymorphic: true

  validates :dynamism, :interest_in_the_company, :experience,
            presence: true,
            numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 0 }


  def self.reviewer_options
    [User, Recruiter]
  end
end

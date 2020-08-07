class Recruiter < ApplicationRecord
  include Skillable

  has_many :appointments

  def full_name
    [first_name, last_name].join(' ')
  end
end

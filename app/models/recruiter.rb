class Recruiter < ApplicationRecord
  include Skillable
  include Nameable

  has_many :appointments
  has_many :reviews, as: :reviewer
end

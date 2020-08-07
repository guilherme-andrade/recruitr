class JobOffer < ApplicationRecord
  include Skillable

  has_many :applications
  has_many :applicants, through: :applications
end

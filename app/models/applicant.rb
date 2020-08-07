class Applicant < ApplicationRecord
  include Skillable

  has_many :appointments
  has_many :applications

  def full_name
    [first_name, last_name].join(' ')
  end
end

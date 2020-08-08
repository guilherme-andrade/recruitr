class Applicant < ApplicationRecord
  include Skillable

  has_many :appointments
  has_many :applications

  validates :first_name, :last_name, presence: true

  def full_name
    [first_name, last_name].join(' ')
  end
end

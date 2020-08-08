class Applicant < ApplicationRecord
  include Nameable
  include Skillable

  has_many :appointments
  has_many :applications
  has_many :reviews

  def score_card
    return @score_card if @score_card && saved_changes.blank?

    @score_card = ScoreCard.new(applicant: self)
  end
end

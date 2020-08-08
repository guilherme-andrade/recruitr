class Review < ApplicationRecord
  belongs_to :applicant
  belongs_to :reviewer, polymorphic: true
end

class User < ApplicationRecord
  include Skillable
  include Nameable

  acts_as_taggable_on :skills

  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  has_many :reviews, as: :reviewer
end

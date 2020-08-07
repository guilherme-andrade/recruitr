class User < ApplicationRecord
  acts_as_taggable_on :skills

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end

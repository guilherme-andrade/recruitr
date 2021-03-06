module Nameable
  extend ActiveSupport::Concern

  included do
    validates :first_name, :last_name, presence: true

    def full_name
      [first_name, last_name].join(' ')
    end
  end
end

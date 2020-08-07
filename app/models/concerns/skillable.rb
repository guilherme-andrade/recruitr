module Skillable
  extend ActiveSupport::Concern

  SKILL_OPTIONS = %w[ruby_on_rails javascript ruby heroku sql html css python].freeze

  included do
    acts_as_taggable_on :skills
  end

  class_methods do
    def skill_options
      SKILL_OPTIONS.map(&:humanize)
    end
  end
end

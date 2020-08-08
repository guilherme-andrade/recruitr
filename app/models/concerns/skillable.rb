module Skillable
  extend ActiveSupport::Concern

  SKILL_OPTIONS = %w[ruby_on_rails javascript ruby heroku sql html css python].freeze
  SENIORITY_LEVELS = { padawan: 0,  knight: 1, master: 2 }.freeze

  included do
    acts_as_taggable_on :skills

    enum seniority_level: SENIORITY_LEVELS
  end

  class_methods do
    def skill_options
      SKILL_OPTIONS.map(&:humanize)
    end

    def seniority_options
      SENIORITY_LEVELS.stringify_keys.to_a
    end
  end
end

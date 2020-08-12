class ApplicationComponent < ViewComponentReflex::Component
  include ApplicationHelper
  include CableReady::Broadcaster
  include Devise::Controllers::Helpers

  delegate :remove_css_class, :remove, :set_style, :insert_adjacent_html,
           to: :cable_ready_on_reflex_channel

  def cable_ready_on_reflex_channel
    cable_ready['StimulusReflex::Channel']
  end

  def params_hash
    params.to_enum.to_h.symbolize_keys
  end
end

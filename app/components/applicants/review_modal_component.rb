class Applicants::ReviewModalComponent < ViewComponentReflex::Component
  include CableReady::Broadcaster

  def initialize(applicant:, id:)
    @id = id
    @applicant = applicant
    @review = @applicant.reviews.new
    @review.reviewer = User.first
    @error = nil
  end

  def create_review
    if @review.save
      close_modal
    else
      @error = 'Could not save your review.'
    end
  end

  # Called by element with data-attribute and data-value, updates an attribute of the review
  def update_review_attribute
    @error = nil
    @review.send("#{element.data_attribute}=", element.data_value.to_i)
  end

  # Called by element with value = { reviewer_type: 'SomeClass', reviewer_id: some_id }, adds that reviewer to the review.
  def update_reviewer
    @error = nil
    reviewer_attributes = JSON.parse(element.value)
    @review.reviewer_type = reviewer_attributes.dig('reviewer_type')
    @review.reviewer_id = reviewer_attributes.dig('reviewer_id')
  end

  # Sets the options for the reviewer select input.
  def reviewer_options
    option_groups_from_collection_for_select(
      Review.reviewer_options,
      :all,
      :to_s,
      lambda(&method(:to_reviewer_attributes_hash)),
      :full_name,
      to_reviewer_attributes_hash(@review.reviewer)
    )
  end

  # Function that converts a reviewer to json so that it can be passed from the html to stimulus_reflex
  def to_reviewer_attributes_hash(reviewer)
    { reviewer_type: reviewer.class.to_s, reviewer_id: reviewer.id }.to_json
  end

  # Returns 5 spans with a star icons inside. Any span can be clicked to trigger #update_review_attribute.
  def stars_for(attribute)
    star_icon = inline_svg_pack_tag('media/icons/star-fill.svg', class: 'lead')

    (1..5).to_a.reduce('') do |html, number|
      class_name = @review.send(attribute) >= number ? 'active' : ''
      star_input = reflex_tag(
                     'click->update_review_attribute',
                     :span,
                     star_icon,
                     class: class_name,
                     data: { value: number, attribute: attribute }
                   )
      html + star_input
    end
  end

  # Function that closes a modal, should ideally be moved to a mixin.
  def close_modal
    cable_ready['StimulusReflex::Channel'].remove_css_class(
      selector: "##{@id}",
      name: 'show'
    )
    cable_ready['StimulusReflex::Channel'].remove(
      selector: ".modal-backdrop",
      name: 'show'
    )
    cable_ready['StimulusReflex::Channel'].set_style(
      selector: "##{@id}",
      name: 'display',
      value: 'none'
    )
  end
end

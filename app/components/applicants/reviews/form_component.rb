class Applicants::Reviews::FormComponent < Applicants::BaseComponent
  def initialize(applicant:, page_key:)
    @page_key = page_key
    @applicant = applicant
    @review = @applicant.reviews.new
  end

  def before_render
    @review.reviewer = current_user
  end

  def create_review
    close && refresh_all! if @review.save
  end

  def update_review_attribute
    @review.send("#{element.data_attribute}=", element.data_value.to_i)
  end

  def update_reviewer
    reviewer_attributes = JSON.parse(element.value)
    @review.reviewer_type = reviewer_attributes.dig('reviewer_type')
    @review.reviewer_id = reviewer_attributes.dig('reviewer_id')
  end

  def to_reviewer_attributes_hash(reviewer)
    { reviewer_type: reviewer.class.to_s, reviewer_id: reviewer.id }.to_json
  end

  def stars_for(attribute)
    (1..5).to_a.reduce('') do |html, number|
      class_name = @review.send(attribute) >= number ? 'active' : ''
      star_input = reflex_tag('click->update_review_attribute', :span, star_icon, class: class_name, data: { value: number, attribute: attribute, key: SecureRandom.hex })
      html + star_input
    end
  end

  def star_icon
    inline_svg_pack_tag('media/icons/star-fill.svg', class: 'lead')
  end

  def close
    stimulate('Applicants::Pages::ShowComponent#close_review_form', { key: @page_key, id: @review.id })
  end
end

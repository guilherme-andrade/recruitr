class ScoreCard
  REVIEW_ATTRIBUTES = %i[interest_in_the_company dynamism experience].freeze

  attr_reader *REVIEW_ATTRIBUTES, :applicant

  delegate :reviews, to: :applicant

  delegate :count, to: :reviews, prefix: true

  def initialize(applicant:)
    @applicant = applicant
    set_averages
  end

  def set_averages
    REVIEW_ATTRIBUTES.each do |attr|
      instance_variable_set("@#{attr}", @applicant.reviews.average(attr))
    end
  end

  def to_chart_labels
    REVIEW_ATTRIBUTES.to_json
  end

  def to_chart_datasets
    [
      {
        'label'                => "#{applicant.full_name}",
        'data'                 => REVIEW_ATTRIBUTES.map { |attr| self.send(attr).to_f },
        'borderColor'          => ['#6610f2'],
        'borderWidth'          => '2',
        'pointBackgroundColor' => '#6610f2'
      }
    ].to_json
  end
end

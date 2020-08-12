class JobOffers::TableRowComponent < JobOffers::BaseComponent
  def initialize(table_row:)
    @job_offer = table_row
  end
end

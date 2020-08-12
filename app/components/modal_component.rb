class ModalComponent < ApplicationComponent
  with_content_areas :header, :footer

  def initialize(button_content:)
    @button_content = button_content
    @show = false
  end

  def open
    @show = true
    # insert_adjacent_html(
    #   selector: 'body',
    #   html: '<div class="modal-backdrop fade"></div>',
    # )
  end

  # Function that closes a modal, should ideally be moved to a mixin.
  def close
    @show = false
    # remove(
    #   selector: ".modal-backdrop"
    # )
  end

  def show?
    @show
  end
end

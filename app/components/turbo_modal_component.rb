# frozen_string_literal: true

class TurboModalComponent < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(title:)
    super
    validate_attributes(title)
    @title = title
  end

  private

  def validate_attributes(title)
    raise ArgumentError, 'Title must be a string' unless title.is_a?(String)
    raise ArgumentError, 'Title cannot be blank' if title.blank?
  end
end

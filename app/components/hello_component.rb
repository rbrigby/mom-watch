# frozen_string_literal: true

class HelloComponent < ViewComponent::Base
  def initialize(name:)
    @name = name
  end
end

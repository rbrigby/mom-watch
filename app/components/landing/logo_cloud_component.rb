# frozen_string_literal: true

module Landing
  class LogoCloudComponent < ViewComponent::Base
    def initialize(brands: nil)
      @brands = brands || default_brands
    end

    attr_reader :brands

    private

    def default_brands
      [
        { name: "Glossier" },
        { name: "The Sill" },
        { name: "Vacation" },
        { name: "Aura Bora" },
        { name: "Kit and Ace" },
        { name: "Super Smalls" }
      ]
    end
  end
end



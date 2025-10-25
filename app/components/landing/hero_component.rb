# frozen_string_literal: true

module Landing
  class HeroComponent < ViewComponent::Base
    def initialize(
      title: "Be the next big thing",
      subtitle: "Dream big, build fast, and grow far.",
      primary_cta_text: "Start for free",
      primary_cta_href: "#",
      secondary_cta_text: "Learn more",
      secondary_cta_href: "#"
    )
      @title = title
      @subtitle = subtitle
      @primary_cta_text = primary_cta_text
      @primary_cta_href = primary_cta_href
      @secondary_cta_text = secondary_cta_text
      @secondary_cta_href = secondary_cta_href
    end

    attr_reader :title, :subtitle, :primary_cta_text, :primary_cta_href,
                :secondary_cta_text, :secondary_cta_href
  end
end



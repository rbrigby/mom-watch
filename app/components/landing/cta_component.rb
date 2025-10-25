# frozen_string_literal: true

module Landing
  class CtaComponent < ViewComponent::Base
    def initialize(title: "Join the waitlist", cta_text: "Join the waitlist", cta_href: "#")
      @title = title
      @cta_text = cta_text
      @cta_href = cta_href
    end

    attr_reader :title, :cta_text, :cta_href
  end
end



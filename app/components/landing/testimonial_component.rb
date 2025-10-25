# frozen_string_literal: true

module Landing
  class TestimonialComponent < ViewComponent::Base
    def initialize(quote: nil, author_name: nil, author_title: nil)
      @quote = quote || "This platform helped us monitor our kids and keep them safe."
      @author_name = author_name || "John Doe"
      @author_title = author_title || "CEO, Mom Watch"
    end

    attr_reader :quote, :author_name, :author_title
  end
end



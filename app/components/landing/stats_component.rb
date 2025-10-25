# frozen_string_literal: true

module Landing
  class StatsComponent < ViewComponent::Base
    def initialize(stats: nil)
      @stats = stats || default_stats
    end

    attr_reader :stats

    private

    def default_stats
      [
        { label: "Kids monitored", value: "1000+" },
        { label: "Parents satisfied", value: "98%" },
        { label: "Hours saved", value: "1000+" }
      ]
    end
  end
end



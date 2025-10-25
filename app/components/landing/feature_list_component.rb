# frozen_string_literal: true

module Landing
  class FeatureListComponent < ViewComponent::Base
    def initialize(features: nil)
      @features = features || default_features
    end

    attr_reader :features

    private

    def default_features
      [
        { title: "Monitor your kids activity", description: "Monitor your kids activity and get alerts on your phone." },
        { title: "Block harmful content", description: "Block harmful content and get alerts on your phone." },
        { title: "Get alerts on your phone", description: "Get alerts on your phone when your kids are doing something you don't want them to do." }
      ]
    end
  end
end



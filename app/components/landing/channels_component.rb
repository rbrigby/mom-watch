# frozen_string_literal: true

module Landing
  class ChannelsComponent < ViewComponent::Base
    def initialize(items: nil)
      @items = items || default_items
    end

    attr_reader :items

    private

    def default_items
      [
        { title: "Google Play", description: "Download the app and start monitoring your kids activity." },
        { title: "App Store", description: "Download the app and start monitoring your kids activity." },
        { title: "Website", description: "Visit the website and start monitoring your kids activity." }
      ]
    end
  end
end



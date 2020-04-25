require_relative '../card_service_pb'
require_relative '../card_service_services_pb'

module CardService
  class Server < CardService::Service
    def fetch_cards_from_set(set, _call)
      PlayingCard.from_set(set).each { |card| Card.new(card) }
    end
  end
end

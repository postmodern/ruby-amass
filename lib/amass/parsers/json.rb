require 'amass/hostname'

require 'json'

module Amass
  module Parsers
    module JSON
      #
      # @return [Hostname]
      #
      def self.parse(line)
        json = ::JSON.parse(line, symbolize_names: true)

        return map_hostname(json)
      end

      def self.map_hostname(json)
        Hostname.new(
          name:      json[:name],
          domain:    json[:domain],
          addresses: json[:addresses].map(&method(:map_address)),
          tag:       json[:tag],
          sources:   json[:sources]
        )
      end

      def self.map_address(json)
        Address.new(**json)
      end
    end
  end
end
require 'amass/hostname'
require 'amass/address'

require 'json'

module Amass
  module Parsers
    #
    # Parses single-line JSON hashes.
    #
    # @api semipublic
    #
    module JSON
      #
      # Parses a single-line of JSON.
      #
      # @param [String] line
      #   The line of JSON.
      #
      # @return [Hostname]
      #   The parsed hostname.
      #
      def self.parse(line)
        json = ::JSON.parse(line)

        return map_hostname(json)
      end

      private

      #
      # Maps a JSON Hash to a {Hostname}.
      #
      # @param [Hash{Symbol => Object}] json
      #   The parsed JSON Hash.
      #
      # @return [Hostname]
      #   The resulting hostname.
      #
      def self.map_hostname(json)
        Hostname.new(
          name:      json['name'],
          domain:    json['domain'],
          addresses: json['addresses'].map(&method(:map_address)),
          tag:       json['tag'],
          sources:   json['sources']
        )
      end

      #
      # Maps a JSON Hash to an {Address}.
      #
      # @param [Hash{Symbol => Object}] json
      #   The parsed JSON Hash.
      #
      # @return [Address]
      #   The resulting address.
      #
      def self.map_address(json)
        Address.new(
          ip:   json['ip'],
          cidr: json['cidr'],
          asn:  json['asn'],
          desc: json['desc']
        )
      end
    end
  end
end

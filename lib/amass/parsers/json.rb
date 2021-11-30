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
      # @param [IO] io
      #   The IO stream to parse.
      #
      # @yield [hostname]
      #   The given block will be passed each parsed hostname.
      #
      # @yieldparam [Hostname] hostname
      #   The parsed hostname.
      #
      # @return [Enumerator]
      #   If no block is given, an Enumerator will be returned.
      #
      def self.parse(io)
        return enum_for(__method__,io) unless block_given?

        io.each_line do |line|
          line.chomp!
          json = ::JSON.parse(line)

          yield map_hostname(json)
        end
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

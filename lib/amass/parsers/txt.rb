require 'amass/hostname'

module Amass
  module Parsers
    #
    # Parses single-line hostnames.
    #
    # @api semipublic
    #
    module TXT
      #
      # Parses a single line of plain-text.
      #
      # @param [String] line
      #   An input line to parse.
      #
      # @return [Hostname]
      #   The parsed hostname.
      #
      def self.parse(line)
        Hostname.new(name: line)
      end
    end
  end
end

require 'amass/hostname'

module Amass
  module Parsers
    #
    # Parses single-line hostnames.
    #
    # @api private
    #
    module TXT
      #
      # @return [Hostname]
      #
      def self.parse(line)
        Hostname.new(name: line)
      end
    end
  end
end

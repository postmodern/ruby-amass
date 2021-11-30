require 'amass/hostname'

module Amass
  module Parsers
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

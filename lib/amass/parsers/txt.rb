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

          yield Hostname.new(name: line)
        end
      end
    end
  end
end

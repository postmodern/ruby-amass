require 'amass/parsers/json'
require 'amass/parsers/txt'

module Amass
  class OutputFile

    PARSERS = {
      '.json' => Parsers::JSON,
      '.txt'  => Parsers::TXT
    }

    # @return [String]
    attr_reader :path

    #
    # @param [String] path
    #
    def initialize(path)
      @path   = File.expand_path(path)
      @parser = PARSERS.fetch(File.extname(@path)) do
        raise(ArgumentError,"unrecognized file type: #{@path.inspect}")
      end
    end

    #
    # @yield [hostname]
    #
    # @yieldparam [Hostname] hostname
    #
    # @return [Enumerator]
    #
    def each
      return enum_for(__method__) unless block_given?

      File.open(@path) do |file|
        file.each_line do |line|
          line.chomp!

          yield @parser.parse(line)
        end
      end
    end

    #
    # @return [String]
    #
    def to_s
      @path
    end

  end
end

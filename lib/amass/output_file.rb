require 'amass/parsers/json'
require 'amass/parsers/txt'

module Amass
  #
  # Represents either a `.json` or `.txt` output file.
  #
  # @api public
  #
  class OutputFile

    # Mapping of formats to parsers.
    #
    # @api private
    PARSERS = {
      :json => Parsers::JSON,
      :txt  => Parsers::TXT
    }

    # The path to the output file.
    #
    # @return [String]
    attr_reader :path

    # The format of the output file.
    #
    # @return [:json, :txt]
    attr_reader :format

    # The parser for the output file format.
    #
    # @return [Parsers::JSON, Parsers::TXT]
    #
    # @api private
    attr_reader :parser

    #
    # Initializes the output file.
    #
    # @param [String] path
    #   The path to the output file.
    #
    # @param [:json, :txt] format
    #   The optional format of the output file. If not given, it will be
    #   inferred by the path's file extension.
    #
    def initialize(path, format: self.class.infer_format(path))
      @path   = File.expand_path(path)
      @format = format

      @parser = PARSERS.fetch(format) do
        raise(ArgumentError,"unrecognized file type: #{@path.inspect}")
      end
    end

    # Mapping of file extensions to formats
    #
    # @api private
    FILE_FORMATS = {
      '.json' => :json,
      '.txt'  => :txt
    }

    #
    # Infers the format from the output file's extension name.
    #
    # @param [String] path
    #   The path to the output file.
    #
    # @return [:json, :txt]
    #   The output format inferred from the file's extension name.
    #
    # @raise [ArgumentError]
    #   The output format could not be inferred from the file's name.
    #
    # @api private
    #
    def self.infer_format(path)
      FILE_FORMATS.fetch(File.extname(path)) do
        raise(ArgumentError,"could not infer format of #{path}")
      end
    end

    #
    # Parses the contents of the output file.
    #
    # @yield [hostname]
    #   The given block will be passed each parsed hostname.
    #
    # @yieldparam [Hostname] hostname
    #   A parsed hostname from the output file.
    #
    # @return [Enumerator]
    #   If no block is given, an Enumerator object will be returned.
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
    # Converts the output file to a String.
    #
    # @return [String]
    #   The path to the output file.
    #
    def to_s
      @path
    end

  end
end

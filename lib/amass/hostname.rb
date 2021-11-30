require 'amass/address'

module Amass
  #
  # @api public
  #
  class Hostname

    # @return [String]
    attr_reader :name

    # @return [String, nil]
    attr_reader :domain

    # @return [Array<Address>]
    attr_reader :addresses

    # @return [String, nil]
    attr_reader :tag

    # @return [Array<String>]
    attr_reader :sources

    #
    # @param [String] name
    #
    # @param [String, nil] domain
    #
    # @param [Array<Address>] addresses
    #
    # @param [String, nil] tag
    #
    # @param [Array<String>] sources
    #
    def initialize(name: , domain: nil, addresses: [], tag: nil, sources: [])
      @name      = name
      @domain    = domain
      @addresses = addresses
      @tag       = tag
      @sources   = sources
    end

    #
    # @return [String]
    #
    def to_s
      @name
    end

  end
end

require 'amass/address'

module Amass
  #
  # A hostname.
  #
  # @api public
  #
  class Hostname

    # The hostname.
    #
    # @return [String]
    attr_reader :name

    # The domain the hostname belongs to.
    #
    # @return [String, nil]
    attr_reader :domain

    # The addresses associated with the hostname.
    #
    # @return [Array<Address>]
    attr_reader :addresses

    # The tag from `amass`.
    #
    # @return [String, nil]
    attr_reader :tag

    # The source(s) that discovered the hostname.
    #
    # @return [Array<String>]
    attr_reader :sources

    #
    # Initializes the hostname.
    #
    # @param [String] name
    #   The hostname.
    #
    # @param [String, nil] domain
    #   The domain the hostname belongs to.
    #
    # @param [Array<Address>] addresses
    #   The addresses associated with the hostname.
    #
    # @param [String, nil] tag
    #   The `amass` tag.
    #
    # @param [Array<String>] sources
    #   The source(s) that discovered the hostname.
    #
    def initialize(name: , domain: nil, addresses: [], tag: nil, sources: [])
      @name      = name
      @domain    = domain
      @addresses = addresses
      @tag       = tag
      @sources   = sources
    end

    #
    # Converts the hostname to a String.
    #
    # @return [String]
    #   The hostname.
    #
    def to_s
      @name
    end

  end
end

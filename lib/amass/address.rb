module Amass
  #
  # An address of a hostname.
  #
  # @api public
  #
  class Address

    # The IP v4 or v6 address.
    #
    # @return [String]
    attr_reader :ip

    # The CIDR mask.
    #
    # @return [String]
    attr_reader :cidr

    # The ASN number.
    #
    # @return [Integer]
    attr_reader :asn

    # The description of the address.
    #
    # @return [String]
    attr_reader :desc

    alias description desc

    #
    # Initializes the address.
    #
    # @param [String] ip
    #   An IP v4 or v6 address.
    #
    # @param [String] cidr
    #   The IP address in CIDR format.
    #
    # @param [Integer] asn
    #   The ASN number for the IP address.
    #
    # @param [String] desc
    #   A description of the IP address.
    #
    def initialize(ip: , cidr: , asn: , desc: )
      @ip   = ip
      @cidr = cidr
      @asn  = asn
      @desc = desc
    end

    #
    # Converts the address to a String.
    #
    # @return [String]
    #   The IP address.
    #
    def to_s
      @ip
    end

  end
end

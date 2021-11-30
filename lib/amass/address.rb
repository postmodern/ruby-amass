module Amass
  #
  # @api public
  #
  class Address

    # @return [String]
    attr_reader :ip

    # @return [String]
    attr_reader :cidr

    # @return [Integer]
    attr_reader :asn

    # @return [String]
    attr_reader :desc

    #
    # @param [String] ip
    #
    # @param [String] cidr
    #
    # @param [Integer] asn
    #
    # @param [String] desc
    #
    def initialize(ip: , cidr: , asn: , desc: )
      @ip   = ip
      @cidr = cidr
      @asn  = asn
      @desc = desc
    end

    #
    # @return [String]
    #
    def to_s
      @ip
    end

  end
end

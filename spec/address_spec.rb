require 'spec_helper'
require 'amass/address'

describe Amass::Address do
  let(:ip)   { "93.184.216.34" }
  let(:cidr) { "93.184.216.0/24" }
  let(:asn)  { 15133 }
  let(:desc) { "EDGECAST - MCI Communications Services, Inc. d/b/a Verizon Business" }

  subject { described_class.new(ip: ip, cidr: cidr, asn: asn, desc: desc) }

  describe "#initialize" do
    it "must set #ip" do
      expect(subject.ip).to eq(ip)
    end

    it "must set #cidr" do
      expect(subject.cidr).to eq(cidr)
    end

    it "must set #asn" do
      expect(subject.asn).to eq(asn)
    end

    it "must set #desc" do
      expect(subject.desc).to eq(desc)
    end
  end

  describe "#to_s" do
    it "must return the #ip" do
      expect(subject.to_s).to eq(ip)
    end
  end
end

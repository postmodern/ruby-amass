require 'spec_helper'
require 'amass/hostname'

describe Amass::Hostname do
  let(:name) { "www.example.com" }
  let(:domain) { "example.com" }

  let(:ip1) { "93.184.216.34" }
  let(:cidr1) { "93.184.216.0/24" }
  let(:asn1) { 15133 }
  let(:desc1) { "EDGECAST - MCI Communications Services, Inc. d/b/a Verizon Business" }

  let(:ip2)   { "2606:2800:220:1:248:1893:25c8:1946" }
  let(:cidr2) { "2606:2800:220::/48" }
  let(:asn2)  { 15133 }
  let(:desc2) { "EDGECAST - MCI Communications Services, Inc. d/b/a Verizon Business" }

  let(:tag) { "cert" }
  let(:source1) { "CertSpotter" }

  let(:addresses) do
    [
      Amass::Address.new(ip: ip1, cidr: cidr1, asn: asn1, desc: desc1),
      Amass::Address.new(ip: ip2, cidr: cidr2, asn: asn2, desc: desc2)
    ]
  end

  let(:sources) { [source1] }

  subject do
    described_class.new(
      name:      name,
      domain:    domain,
      addresses: addresses,
      tag:       tag,
      sources:   sources
    )
  end

  describe "#intialize" do
    context "when only the name: keyword is given" do
      subject { described_class.new(name: name) }

      it "must set #name" do
        expect(subject.name).to eq(name)
      end

      it "must initialize the Hostname's #domain to nil" do
        expect(subject.domain).to be(nil)
      end

      it "must initialize the Hostname's #addresses to []" do
        expect(subject.addresses).to eq([])
      end

      it "must initialize the Hostname's #tag to nil" do
        expect(subject.tag).to be(nil)
      end

      it "must initialize the Hostname's #sources to []" do
        expect(subject.sources).to eq([])
      end
    end

    context "when all keyword arguments are given" do
      it "must set #name" do
        expect(subject.name).to eq(name)
      end

      it "must set #domain" do
        expect(subject.domain).to be(domain)
      end

      it "must set #addresses" do
        expect(subject.addresses).to eq(addresses)
      end

      it "must set #tag" do
        expect(subject.tag).to eq(tag)
      end

      it "must set #sources" do
        expect(subject.sources).to eq(sources)
      end
    end
  end

  describe "#to_s" do
    it "must return #name" do
      expect(subject.to_s).to eq(name)
    end
  end
end

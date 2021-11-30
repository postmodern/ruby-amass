require 'spec_helper'
require 'amass/parsers/json'

describe Amass::Parsers::JSON do
  describe ".parse" do
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

    let(:line) do
      %{{"name":"#{name}","domain":"#{domain}","addresses":[{"ip":"#{ip1}","cidr":"#{cidr1}","asn":#{asn1},"desc":"#{desc1}"},{"ip":"#{ip2}","cidr":"#{cidr2}","asn":#{asn2},"desc":"#{desc2}"}],"tag":"#{tag}","sources":["#{source1}"]}}
    end

    subject { described_class.parse(line) }

    it "must return a Hostname object" do
      expect(subject).to be_kind_of(Amass::Hostname)
    end

    it "must initialize the Hostname's #name to the 'name' attribute" do
      expect(subject.name).to eq(name)
    end

    it "must initialize the Hostname's #domain to the 'domain' attribute" do
      expect(subject.domain).to eq(domain)
    end

    it "must initialize the Hostname's #addresses to an Array of Addresses" do
      expect(subject.addresses).to be_kind_of(Array)
      expect(subject.addresses.length).to eq(2)
      expect(subject.addresses).to all(be_kind_of(Amass::Address))
    end

    describe "Hostname#addresses" do
      subject { super().addresses }

      it "must initialize Address#ip using the 'ip' attributes" do
        expect(subject[0].ip).to eq(ip1)
        expect(subject[1].ip).to eq(ip2)
      end

      it "must initialize Address#cidr using the 'cidr' attributes" do
        expect(subject[0].cidr).to eq(cidr1)
        expect(subject[1].cidr).to eq(cidr2)
      end

      it "must initialize Address#asn using the 'asn' attributes" do
        expect(subject[0].asn).to eq(asn1)
        expect(subject[1].asn).to eq(asn2)
      end

      it "must initialize Address#desc using the 'desc' attributes" do
        expect(subject[0].desc).to eq(desc1)
        expect(subject[1].desc).to eq(desc2)
      end
    end

    it "must initialize the Hostname's #tag to the 'tag' attribute" do
      expect(subject.tag).to eq(tag)
    end

    describe "Hostname#sources" do
      subject { super().sources }

      it "must initialize the Hostname's #sources to an Array of Strings" do
        expect(subject).to be_kind_of(Array)
        expect(subject.length).to eq(1)
        expect(subject).to all(be_kind_of(String))
      end

      it "must initialize Hostname#sources using the 'sources' attribute" do
        expect(subject).to eq([source1])
      end
    end
  end
end

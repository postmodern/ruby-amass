require 'spec_helper'
require 'amass/parsers/json'

describe Amass::Parsers::JSON do
  describe ".parse" do
    let(:name)   { "www.example.com" }
    let(:domain) { "example.com" }

    let(:ip1)   { "93.184.216.34" }
    let(:cidr1) { "93.184.216.0/24" }
    let(:asn1)  { 15133 }
    let(:desc1) { "EDGECAST - MCI Communications Services, Inc. d/b/a Verizon Business" }

    let(:ip2)   { "2606:2800:220:1:248:1893:25c8:1946" }
    let(:cidr2) { "2606:2800:220::/48" }
    let(:asn2)  { 15133 }
    let(:desc2) { "EDGECAST - MCI Communications Services, Inc. d/b/a Verizon Business" }

    let(:tag)     { "cert" }
    let(:source1) { "CertSpotter" }

    let(:line) do
      %{{"name":"#{name}","domain":"#{domain}","addresses":[{"ip":"#{ip1}","cidr":"#{cidr1}","asn":#{asn1},"desc":"#{desc1}"},{"ip":"#{ip2}","cidr":"#{cidr2}","asn":#{asn2},"desc":"#{desc2}"}],"tag":"#{tag}","sources":["#{source1}"]}}
    end
    let(:io) { StringIO.new(line + $/) }

    it "must parse each line and yield Amass::Hostname objects" do
      yielded_hostnames = []

      subject.parse(io) do |hostname|
        yielded_hostnames << hostname
      end

      expect(yielded_hostnames.length).to eq(1)
      expect(yielded_hostnames.first).to be_kind_of(Amass::Hostname)

      yielded_hostname = yielded_hostnames.first

      expect(yielded_hostname.name).to eq(name)
      expect(yielded_hostname.domain).to eq(domain)

      expect(yielded_hostname.addresses).to be_kind_of(Array)
      expect(yielded_hostname.addresses.length).to eq(2)
      expect(yielded_hostname.addresses).to all(be_kind_of(Amass::Address))

      expect(yielded_hostname.addresses[0].ip).to eq(ip1)
      expect(yielded_hostname.addresses[0].cidr).to eq(cidr1)
      expect(yielded_hostname.addresses[0].asn).to eq(asn1)
      expect(yielded_hostname.addresses[0].desc).to eq(desc1)

      expect(yielded_hostname.addresses[1].ip).to eq(ip2)
      expect(yielded_hostname.addresses[1].cidr).to eq(cidr2)
      expect(yielded_hostname.addresses[1].asn).to eq(asn2)
      expect(yielded_hostname.addresses[1].desc).to eq(desc2)

      expect(yielded_hostname.tag).to eq(tag)
      expect(yielded_hostname.sources).to eq([source1])
    end
  end
end

require 'spec_helper'
require 'amass/parsers/txt'

describe Amass::Parsers::TXT do
  describe ".parse" do
    let(:line) { "wbldr2.example.com" }
    let(:io)   { StringIO.new(line + $/) }

    it "must parse each line and yield Amass::Hostname objects" do
      yielded_hostnames = []

      subject.parse(io) do |hostname|
        yielded_hostnames << hostname
      end

      expect(yielded_hostnames.length).to eq(1)
      expect(yielded_hostnames.first).to be_kind_of(Amass::Hostname)

      yielded_hostname = yielded_hostnames.first

      expect(yielded_hostname.name).to eq(line)
      expect(yielded_hostname.domain).to be(nil)
      expect(yielded_hostname.addresses).to eq([])
      expect(yielded_hostname.tag).to be(nil)
      expect(yielded_hostname.sources).to eq([])
    end
  end
end

require 'spec_helper'
require 'amass/parsers/txt'

describe Amass::Parsers::TXT do
  describe ".parse" do
    let(:line) { "wbldr2.example.com" }

    subject { described_class.parse(line) }

    it "must return a Hostname object" do
      expect(subject).to be_kind_of(Amass::Hostname)
    end

    it "must initialize the Hostname's #name to the line" do
      expect(subject.name).to eq(line)
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
end

# ruby-amass

[![CI](https://github.com/postmodern/ruby-amass/actions/workflows/ruby.yml/badge.svg)](https://github.com/postmodern/ruby-amass/actions/workflows/ruby.yml)
[![Gem Version](https://badge.fury.io/rb/ruby-amass.svg)](https://badge.fury.io/rb/ruby-amass)

* [Source](https://github.com/postmodern/ruby-amass/)
* [Issues](https://github.com/postmodern/ruby-amass/issues)
* [Documentation](http://rubydoc.info/gems/ruby-amass/frames)

## Description

A Ruby interface to [amass], an in-depth Attack Surface Mapping and Asset
Discovery tool.

## Features

* Provides a Ruby interface for running the `amass` command.

## Examples

Run `amass enum -d example.com -dir ...` from Ruby:

```ruby
require 'amass/command'

Amass::Command.run(enum: {domain: 'example.com', output_dir: '/path/to/output/dir'})
```

Parser an `amass` JSON file:

```ruby
require 'amass/output_file'

output_file = Amass::OutputFile.new('/path/to/amass.json')
output_file.each do |hostname|
  p hostname
end
```

```
#<Amass::Hostname:0x0000565365b58308 @name="www.example.com", @domain="example.com", @addresses=[#<Amass::Address:0x0000565365b58538 @ip="93.184.216.34", @cidr="93.184.216.0/24", @asn=15133, @desc="EDGECAST - MCI Communications Services, Inc. d/b/a Verizon Business">, #<Amass::Address:0x0000565365b58448 @ip="2606:2800:220:1:248:1893:25c8:1946", @cidr="2606:2800:220::/48", @asn=15133, @desc="EDGECAST - MCI Communications Services, Inc. d/b/a Verizon Business">], @tag="cert", @sources=["CertSpotter"]>
#<Amass::Hostname:0x0000565365b46568 @name="example.com", @domain="example.com", @addresses=[#<Amass::Address:0x0000565365b466f8 @ip="2606:2800:220:1:248:1893:25c8:1946", @cidr="2606:2800:220::/48", @asn=15133, @desc="EDGECAST - MCI Communications Services, Inc. d/b/a Verizon Business">, #<Amass::Address:0x0000565365b466a8 @ip="93.184.216.34", @cidr="93.184.216.0/24", @asn=15133, @desc="EDGECAST - MCI Communications Services, Inc. d/b/a Verizon Business">], @tag="cert", @sources=["CertSpotter"]>
#<Amass::Hostname:0x0000565365b44f88 @name="waterregion643.example.com", @domain="example.com", @addresses=[#<Amass::Address:0x0000565365b45078 @ip="54.144.128.85", @cidr="54.144.0.0/14", @asn=14618, @desc="AMAZON-AES - Amazon.com, Inc.">], @tag="api", @sources=["Sublist3rAPI"]>
#<Amass::Hostname:0x0000565365b3b7d0 @name="ringneo5.example.com", @domain="example.com", @addresses=[#<Amass::Address:0x0000565365b44100 @ip="54.144.128.85", @cidr="54.144.0.0/14", @asn=14618, @desc="AMAZON-AES - Amazon.com, Inc.">], @tag="api", @sources=["Sublist3rAPI"]>
#<Amass::Hostname:0x0000565365b3a628 @name="ratara72.example.com", @domain="example.com", @addresses=[#<Amass::Address:0x0000565365b3a7e0 @ip="54.144.128.85", @cidr="54.144.0.0/14", @asn=14618, @desc="AMAZON-AES - Amazon.com, Inc.">], @tag="api", @sources=["Sublist3rAPI"]>
#<Amass::Hostname:0x0000565365b39688 @name="serafim.example.com", @domain="example.com", @addresses=[#<Amass::Address:0x0000565365b39700 @ip="54.144.128.85", @cidr="54.144.0.0/14", @asn=14618, @desc="AMAZON-AES - Amazon.com, Inc.">], @tag="api", @sources=["Sublist3rAPI"]>
#<Amass::Hostname:0x0000565365b38a30 @name="a8boyyy.example.com", @domain="example.com", @addresses=[#<Amass::Address:0x0000565365b38b48 @ip="54.144.128.85", @cidr="54.144.0.0/14", @asn=14618, @desc="AMAZON-AES - Amazon.com, Inc.">], @tag="api", @sources=["Sublist3rAPI"]>
#<Amass::Hostname:0x0000565365b33738 @name="bikamzhaz.example.com", @domain="example.com", @addresses=[#<Amass::Address:0x0000565365b33800 @ip="54.144.128.85", @cidr="54.144.0.0/14", @asn=14618, @desc="AMAZON-AES - Amazon.com, Inc.">], @tag="api", @sources=["Sublist3rAPI"]>
#<Amass::Hostname:0x0000565365b324a0 @name="wwwakamai.example.com", @domain="example.com", @addresses=[#<Amass::Address:0x0000565365b32518 @ip="54.144.128.85", @cidr="54.144.0.0/14", @asn=14618, @desc="AMAZON-AES - Amazon.com, Inc.">], @tag="alt", @sources=["Alterations"]>
#<Amass::Hostname:0x0000565365b305b0 @name="wwwakamaiint.example.com", @domain="example.com", @addresses=[#<Amass::Address:0x0000565365b30650 @ip="54.144.128.85", @cidr="54.144.0.0/14", @asn=14618, @desc="AMAZON-AES - Amazon.com, Inc.">], @tag="alt", @sources=["Alterations"]>
#<Amass::Hostname:0x0000565365b2ba60 @name="billing-serafim.example.com", @domain="example.com", @addresses=[#<Amass::Address:0x0000565365b2bb50 @ip="54.144.128.85", @cidr="54.144.0.0/14", @asn=14618, @desc="AMAZON-AES - Amazon.com, Inc.">], @tag="alt", @sources=["Alterations"]>
#<Amass::Hostname:0x0000565365b29058 @name="bikamzhazstaff.example.com", @domain="example.com", @addresses=[#<Amass::Address:0x0000565365b29968 @ip="54.144.128.85", @cidr="54.144.0.0/14", @asn=14618, @desc="AMAZON-AES - Amazon.com, Inc.">], @tag="alt", @sources=["Alterations"]>
#<Amass::Hostname:0x0000565365b23680 @name="bikamzhaz-6.example.com", @domain="example.com", @addresses=[#<Amass::Address:0x0000565365b23810 @ip="54.144.128.85", @cidr="54.144.0.0/14", @asn=14618, @desc="AMAZON-AES - Amazon.com, Inc.">], @tag="alt", @sources=["Alterations"]>
#<Amass::Hostname:0x0000565365b22a50 @name="wwwakamaiintorigin.example.com", @domain="example.com", @addresses=[#<Amass::Address:0x0000565365b22ac8 @ip="54.144.128.85", @cidr="54.144.0.0/14", @asn=14618, @desc="AMAZON-AES - Amazon.com, Inc.">], @tag="alt", @sources=["Alterations"]>
```

## Requirements

* [ruby] >= 2.0.0
* [amass] >= 3.0.0
* [command_mapper] ~> 0.1

[ruby]: https://www.ruby-lang.org/
[command_mapper]: https://github.com/postmodern/command_mapper.rb#readme

## Install

```shell
$ gem install ruby-amass
```

### gemspec

```ruby
gemspec.add_dependency 'ruby-amass', '~> 0.1'
```

### Gemfile

```ruby
gem 'ruby-amass', '~> 0.1'
```

## License

Copyright (c) 2021 Hal Brodigan

See {file:LICENSE.txt} for license information.

[amass]: https://github.com/OWASP/Amass#readme

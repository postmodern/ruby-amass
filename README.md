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

Run `amass enum -d example.com` from Ruby:

```ruby
require 'amass/command'

Amass::Command.run(enum: {domain: 'example.com'})
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

require 'command_mapper/command'

module Amass
  #
  # Represents the `amass` command and it's subcommands.
  #
  # ## Example
  #
  #     require 'amass/command'
  #     
  #     Amass::Command.run(enum: {domain: 'example.com', output_dir: '/path/to/output/dir'})
  #
  # ## `amass` subcommands
  #
  # ### `amass intel`
  #
  # * `-active` - `amass.active`
  # * `-addr` - `amass.addr`
  # * `-asn` - `amass.asn`
  # * `-cidr` - `amass.cidr`
  # * `-config` - `amass.config`
  # * `-d` - `amass.domain`
  # * `-demo` - `amass.demo`
  # * `-df` - `amass.domains_file`
  # * `-dir` - `amass.output_dir`
  # * `-ef` - `amass.exclude_file`
  # * `-exclude` - `amass.exclude`
  # * `-help` - `amass.help`
  # * `-if` - `amass.include_file`
  # * `-include` - `amass.include`
  # * `-ip` - `amass.ip`
  # * `-ipv4` - `amass.ipv4`
  # * `-ipv6` - `amass.ipv6`
  # * `-list` - `amass.list`
  # * `-log` - `amass.log`
  # * `-max-dns-queries` - `amass.max_dns_queries`
  # * `-o` - `amass.output`
  # * `-org` - `amass.org`
  # * `-p` - `amass.ports`
  # * `-r` - `amass.resolver`
  # * `-rf` - `amass.resolver_file`
  # * `-src` - `amass.src`
  # * `-timeout` - `amass.timeout`
  # * `-v` - `amass.verbose`
  # * `-whois` - `amass.whois`
  #
  # ### `amass enum`
  #
  # * `-active` - `amass.active`
  # * `-addr` - `amass.addr`
  # * `-asn` - `amass.asn`
  # * `-aw` - `amass.alterations_wordlist_file`
  # * `-awm` - `amass.alterations_wordlist_mask`
  # * `-bl` - `amass.blacklist`
  # * `-blf` - `amass.blacklist_file`
  # * `-brute` - `amass.bruteforce`
  # * `-cidr` - `amass.cidr`
  # * `-config` - `amass.config`
  # * `-d` - `amass.domain`
  # * `-demo` - `amass.demo`
  # * `-df` - `amass.domains_file`
  # * `-dir` - `amass.output_dir`
  # * `-ef` - `amass.exclude_file`
  # * `-exclude` - `amass.exclude`
  # * `-help` - `amass.help`
  # * `-if` - `amass.include_file`
  # * `-iface` - `amass.iface`
  # * `-include` - `amass.include`
  # * `-ip` - `amass.ip`
  # * `-ipv4` - `amass.ipv4`
  # * `-ipv6` - `amass.ipv6`
  # * `-json` - `amass.json`
  # * `-list` - `amass.list`
  # * `-log` - `amass.log`
  # * `-max-depth` - `amass.max_depth`
  # * `-max-dns-queries` - `amass.max_dns_queries`
  # * `-min-for-recursive` - `amass.min_for_recursive`
  # * `-nf` - `amass.known_subdomains_file`
  # * `-noalts` - `amass.no_alts`
  # * `-nocolor` - `amass.no_color`
  # * `-nolocaldb` - `amass.no_localdb`
  # * `-norecursive` - `amass.no_recursive`
  # * `-o` - `amass.output`
  # * `-oA` - `amass.output_prefix`
  # * `-p` - `amass.ports`
  # * `-passive` - `amass.passive`
  # * `-r` - `amass.resolver`
  # * `-rf` - `amass.resolver_file`
  # * `-scripts` - `amass.scripts`
  # * `-share` - `amass.share`
  # * `-silent` - `amass.silent`
  # * `-src` - `amass.src`
  # * `-timeout` - `amass.timeout`
  # * `-v` - `amass.verbose`
  # * `-w` - `amass.wordlist_file`
  # * `-wm` - `amass.wordlist_mask`
  #
  # ### `amass viz`
  #
  # * `-config` - `amass.config`
  # * `-d` - `amass.domain`
  # * `-d3` - `amass.d3`
  # * `-df` - `amass.domains_file`
  # * `-dir` - `amass.database_dir`
  # * `-dot` - `amass.dot`
  # * `-enum` - `amass.enum`
  # * `-gexf` - `amass.gexf`
  # * `-graphistry` - `amass.graphistry`
  # * `-help` - `amass.help`
  # * `-i` - `amass.input`
  # * `-maltego` - `amass.maltego`
  # * `-nocolor` - `amass.nocolor`
  # * `-o` - `amass.output`
  # * `-silent` - `amass.silent`
  #
  # ### `amass track`
  #
  # * `-config` - `amass.config`
  # * `-d` - `amass.domain`
  # * `-df` - `amass.domains_file`
  # * `-dir` - `amass.output_dir`
  # * `-help` - `amass.help`
  # * `-history` - `amass.history`
  # * `-last` - `amass.last`
  # * `-nocolor` - `amass.nocolor`
  # * `-silent` - `amass.silent`
  # * `-since` - `amass.since`
  #
  # ### `amass db`
  #
  # * `-config` - `amass.config`
  # * `-d` - `amass.domain`
  # * `-demo` - `amass.demo`
  # * `-df` - `amass.domains_file`
  # * `-dir` - `amass.output_dir`
  # * `-enum` - `amass.enum`
  # * `-help` - `amass.help`
  # * `-ip` - `amass.ip`
  # * `-ipv4` - `amass.ipv4`
  # * `-ipv6` - `amass.ipv6`
  # * `-list` - `amass.list`
  # * `-names` - `amass.names`
  # * `-nocolor` - `amass.nocolor`
  # * `-o` - `amass.output`
  # * `-show` - `amass.show`
  # * `-silent` - `amass.silent`
  # * `-src` - `amass.src`
  # * `-summary` - `amass.summary`
  #
  # ### `amass dns`
  #
  # * `-bl` - `amass.blacklist`
  # * `-blf` - `amass.blacklist_file`
  # * `-config` - `amass.config`
  # * `-d` - `amass.domain`
  # * `-demo` - `amass.demo`
  # * `-df` - `amass.domains_file`
  # * `-dir` - `amass.output_dir`
  # * `-help` - `amass.help`
  # * `-ip` - `amass.ip`
  # * `-ipv4` - `amass.ipv4`
  # * `-ipv6` - `amass.ipv6`
  # * `-json` - `amass.json`
  # * `-log` - `amass.log`
  # * `-max-dns-queries` - `amass.max_dns_queries`
  # * `-nf` - `amass.known_subdomains_file`
  # * `-o` - `amass.output`
  # * `-oA` - `amass.output_prefix`
  # * `-r` - `amass.resolver`
  # * `-rf` - `amass.resolver_file`
  # * `-t` - `amass.type`
  # * `-timeout` - `amass.timeout`
  # * `-v` - `amass.verbose`
  #
  # @api public
  #
  class Command < CommandMapper::Command

    command 'amass' do
      subcommand :intel do
        option '-active'
        option '-addr', value: true
        option '-asn', value: true
        option '-cidr', value: true
        option '-config', value: {type: InputFile.new}
        option '-d', name: :domain, value: true, repeats: true
        option '-demo'
        option '-df', name: :domains_file, value: true
        option '-dir', name: :output_dir, value: true
        option '-ef', name: :exclude_file, value: {type: InputFile.new}
        option '-exclude', value: true
        option '-help'
        option '-if', name: :include_file, value: {type: InputFile.new}
        option '-include', value: {type: List.new}
        option '-ip'
        option '-ipv4'
        option '-ipv6'
        option '-list'
        option '-log', value: true
        option '-max-dns-queries', value: {type: Num.new}
        option '-o', name: :output, value: true
        option '-org', value: true
        option '-p', name: :ports, value: {type: List.new}
        option '-r', name: :resolver, value: true, repeats: true
        option '-rf', name: :resolver_file, value: true
        option '-src'
        option '-timeout', value: {type: Num.new}
        option '-v', name: :verbose
        option '-whois'
      end

      subcommand :enum do
        option '-active'
        option '-addr', value: true
        option '-asn', value: true
        option '-aw', name: :alterations_wordlist_file, value: {type: InputFile.new}
        option '-awm', name: :alterations_wordlist_mask, value: true
        option '-bl', name: :blacklist, value: true
        option '-blf', name: :blacklist_file, value: {type: InputFile.new}
        option '-brute', name: :bruteforce
        option '-cidr', value: true, repeats: true
        option '-config', value: {type: InputFile.new}
        option '-d', name: :domain, value: true, repeats: true
        option '-demo'
        option '-df', name: :domains_file, value: {type: InputFile.new}
        option '-dir', name: :output_dir, value: true
        option '-ef', name: :exclude_file, value: {type: InputFile.new}
        option '-exclude', value: true
        option '-help'
        option '-if', name: :include_file, value: {type: InputFile.new}
        option '-iface', value: true
        option '-include', value: {type: List.new}
        option '-ip'
        option '-ipv4'
        option '-ipv6'
        option '-json', value: true
        option '-list'
        option '-log', value: true
        option '-max-depth', value: {type: Num.new}
        option '-max-dns-queries', value: {type: Num.new}
        option '-min-for-recursive', value: {type: Num.new}
        option '-nf', name: :known_subdomains_file, value: {type: InputFile.new}
        option '-noalts', name: :no_alts
        option '-nocolor', name: :no_color
        option '-nolocaldb', name: :no_localdb
        option '-norecursive', name: :no_recursive
        option '-o', name: :output, value: true
        option '-oA', name: :output_prefix, value: true
        option '-p', name: :ports, value: {type: List.new}
        option '-passive'
        option '-r', name: :resolver, value: true, repeats: true
        option '-rf', name: :resolver_file, value: true
        option '-scripts', value: {type: InputDir.new}
        option '-share'
        option '-silent'
        option '-src'
        option '-timeout', value: {type: Num.new}
        option '-v', name: :verbose
        option '-w', name: :wordlist_file, value: {type: InputFile.new}
        option '-wm', name: :wordlist_mask, value: true
      end

      subcommand :viz do
        option '-config', value: true
        option '-d', name: :domain, value: true, repeats: true
        option '-d3'
        option '-df', name: :domains_file, value: true
        option '-dir', name: :database_dir, value: true
        option '-dot'
        option '-enum', value: {type: Num.new}
        option '-gexf'
        option '-graphistry'
        option '-help'
        option '-i', name: :input, value: {type: InputFile.new}
        option '-maltego'
        option '-nocolor'
        option '-o', name: :output, value: true
        option '-silent'
      end

      subcommand :track do
        option '-config', value: {type: InputFile.new}
        option '-d', name: :domain, value: true, repeats: true
        option '-df', name: :domains_file, value: true
        option '-dir', name: :output_dir, value: true
        option '-help'
        option '-history'
        option '-last', value: {type: Num.new}
        option '-nocolor'
        option '-silent'
        option '-since', value: true
      end

      subcommand :db do
        option '-config', value: {type: InputFile.new}
        option '-d', name: :domain, value: true, repeats: true
        option '-demo'
        option '-df', name: :domains_file, value: true
        option '-dir', name: :output_dir, value: true
        option '-enum', value: {type: Num.new}
        option '-help'
        option '-ip'
        option '-ipv4'
        option '-ipv6'
        option '-list'
        option '-names'
        option '-nocolor'
        option '-o', name: :output, value: true
        option '-show'
        option '-silent'
        option '-src'
        option '-summary'
      end

      subcommand :dns do
        option '-bl', name: :blacklist, value: true
        option '-blf', name: :blacklist_file, value: {type: InputFile.new}
        option '-config', value: {type: InputFile.new}
        option '-d', name: :domain, value: true, repeats: true
        option '-demo'
        option '-df', name: :domains_file, value: true
        option '-dir', name: :output_dir, value: true
        option '-help'
        option '-ip'
        option '-ipv4'
        option '-ipv6'
        option '-json', value: true
        option '-log', value: true
        option '-max-dns-queries', value: {type: Num.new}
        option '-nf', name: :known_subdomains_file, value: {type: InputFile.new}
        option '-o', name: :output, value: true
        option '-oA', name: :output_prefix, value: true
        option '-r', name: :resolver, value: true, repeats: true
        option '-rf', name: :resolver_file, value: true
        option '-t', name: :type, value: true, repeats: true
        option '-timeout', value: {type: Num.new}
        option '-v', name: :verbose
      end
    end
  end
end

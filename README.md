# Cyrillic

[![Ruby](https://github.com/rovetz/cyrillic/actions/workflows/ruby.yml/badge.svg)](https://github.com/rovetz/cyrillic/actions/workflows/ruby.yml)
[![Gem Version](https://badge.fury.io/rb/cyrillic.svg)](https://badge.fury.io/rb/cyrillic)
[![MIT License](https://img.shields.io/badge/license-MIT-green.svg)](https://opensource.org/licenses/MIT)

**Cyrillic** is a Ruby gem for romanization (transliteration) of Cyrillic script into the Roman (Latin) alphabet. It provides a simple and flexible interface with support for international and national standards.

## Supported Schemes

*   `:cyrillic` (Default generic Cyrillic transliteration)
*   `:iso9` (ISO 9:1995 international standard)
*   `:serbian` (Serbian Vuk's Cyrillic to Gaj's Latin)
*   `:gost779b` (GOST 7.79-2000 System B ASCII digraphs)
*   `:bgn_pcgn` (BGN/PCGN 1947 geographic romanization)
*   `:bulgarian` (Bulgarian official Streamlined System)
*   `:belarusian` (Belarusian national / UN 2012 Łacinka)
*   `:ukrainian` (Ukrainian national standard)
*   `:ua_passport` (Ukrainian international passport standard)
*   `:mongolian` (Mongolian Cyrillic MNS 5217:2012)
*   `:de` (German Duden/phonetic transliteration)

## Installation

Add this line to your application's Gemfile:

```ruby
gem "cyrillic"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cyrillic

## Usage

```ruby
require "cyrillic"

# Default Cyrillic transliteration
Cyrillic.transliterate("Кириллица")
# => "KirilliTSa"

# Short alias .t
Cyrillic.t("Кириллица")
# => "KirilliTSa"

# ISO 9:1995 scheme
Cyrillic.t("Не важно, как медленно ты продвигаешься", :iso9)
# => "Ne važno, kak medlenno ty prodvigaešʹsâ"

# Serbian Cyrillic to Latin (Vukovica to Gajica)
Cyrillic.t("Љубљана", :serbian)
# => "Ljubljana"

# GOST 7.79-2000 System B (ASCII digraphs)
Cyrillic.t("Щука", :gost779b)
# => "Shhuka"

# BGN/PCGN 1947 geographic romanization
Cyrillic.t("Хабаровск", :bgn_pcgn)
# => "Khabarovsk"

# Bulgarian Streamlined System
Cyrillic.t("България", :bulgarian)
# => "Balgariya"

# Belarusian national / UN 2012 Łacinka
Cyrillic.t("Мінск", :belarusian)
# => "Minsk"

# Ukrainian scheme
Cyrillic.t("Київ", :ukrainian)
# => "Kyiv"

# Ukrainian passport scheme
Cyrillic.t("Борщагівка", :ua_passport)
# => "Borshchahivka"

# Mongolian scheme
Cyrillic.t("Монгол хэл", :mongolian)
# => "Mongol khel"

# German transliteration scheme
Cyrillic.t("Чайковский", :de)
# => "Tschajkowskij"

# Reverse transliteration (Detransliteration)
Cyrillic.detransliterate("Transliteraciâ", :iso9)
# => "Транслитерация"

# Short alias .det
Cyrillic.det("Ljubljana", :serbian)
# => "Љубљана"
```

### Command Line Interface (CLI)

You can also use `cyrillic` directly from your terminal:

```bash
# Direct argument
$ cyrillic "Кириллица"
KirilliTSa

# Piped input (STDIN)
$ echo "Кириллица" | cyrillic
KirilliTSa

# File input
$ cyrillic text.txt

# Specify transliteration scheme
$ cyrillic -s iso9 "Транслитерация"
Transliteraciâ

$ cyrillic -s serbian "Љубљана"
Ljubljana

$ cyrillic -s gost779b "Щука"
Shhuka

$ cyrillic -s bgn_pcgn "Хабаровск"
Khabarovsk

$ cyrillic -s bulgarian "България"
Balgariya

$ cyrillic -s belarusian "Мінск"
Minsk

$ cyrillic -s ukrainian "Київ"
Kyiv

$ cyrillic -s ua_passport "Борщагівка"
Borshchahivka

$ cyrillic -s de "Весна"
Wesna

# Reverse transliteration (-r, --reverse)
$ cyrillic -r "Transliteraciâ"
Транслитерация

$ cyrillic -r -s serbian "Ljubljana"
Љубљана
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake` to run tests and code style checks (RuboCop). You can run performance benchmarks with `bundle exec rake benchmark`. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rovetz/cyrillic. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cyrillic project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/rovetz/cyrillic/blob/main/CODE_OF_CONDUCT.md).

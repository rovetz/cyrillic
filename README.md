# Cyrillic -> Latin: Cyrillic.t("Кириллица") => "Kirillitsa"

[![Gem Version](https://badge.fury.io/rb/cyrillic.svg)](https://badge.fury.io/rb/cyrillic)
[![Build Status](https://travis-ci.org/rovetz/cyrillic.svg?branch=main)](https://travis-ci.org/rovetz/cyrillic)
[![MIT License](https://img.shields.io/badge/license-MIT-green.svg)](https://opensource.org/licenses/MIT)

**Cyrillic** is a Ruby gem for the romanization (transliteration) of Cyrillic script into the Latin alphabet. It provides a simple and flexible way to convert Cyrillic text using various international and language-specific standards.

## Features

This gem supports multiple transliteration standards:

*   `generic` (Default)
*   `iso9`
*   `ukrainian`
*   `mongolian`

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cyrillic'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cyrillic

## Usage

The gem provides a simple interface through the `Cyrillic.t` (or `Cyrillic.transliterate`) method.

### Basic Usage

By default, it uses a generic transliteration scheme.

```ruby
require "cyrillic"

Cyrillic.t("Кириллица")
#=> "Kirillitsa"
```

### Specifying a Standard

You can specify a transliteration standard by passing a symbol as the second argument.

#### ISO 9

```ruby
Cyrillic.transliterate("Кириллица", :iso9)
#=> "Kirillica"
```

#### Ukrainian

```ruby
Cyrillic.transliterate("Кирилиця", :ukrainian)
#=> "Kyrylytsia"
```

#### Mongolian

```ruby
Cyrillic.t("Монгол хэл", :mongolian)
#=> "Mongol khel"
```

## Development

After checking out the repo, run `bin/setup` to install development dependencies.

To run the test suite, use the `rake` command:

    $ rake

You can also run `bin/console` for an interactive prompt that will allow you to experiment with the gem.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rovetz/cyrillic. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cyrillic project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/rovetz/cyrillic/blob/master/CODE_OF_CONDUCT.md).

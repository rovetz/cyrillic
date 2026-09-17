# frozen_string_literal: true

require "cyrillic/version"
require "cyrillic/iso9"
require "cyrillic/mongolian"
require "cyrillic/ukrainian"
require "cyrillic/ua_passport"
require "cyrillic/de"
require "cyrillic/serbian"
require "cyrillic/gost779b"
require "cyrillic/bgn_pcgn"
require "cyrillic/bulgarian"
require "cyrillic/belarusian"

module Cyrillic
  k = %w[
    А Б В Г Д Е Ё Ж З И І Й К Л М Н О П Р С Т У Ф Х Ц Ч Ш Щ Ъ Ы Ь Ѣ Э Ю Я Ѳ Ѵ
    а б в г д е ё ж з и і й к л м н о п р с т у ф х ц ч ш щ ъ ы ь ѣ э ю я ѳ ѵ
  ].freeze
  v = %w[
    A B V G D E Ë ZH Z I Ī Ĭ K L M N O P R S T U F KH TS CH SH SHCH ʺ Y ʹ IE Ė IU IA Ḟ Ẏ
    a b v g d e ë zh z i ī ĭ k l m n o p r s t u f kh ts ch sh shch ʺ y ʹ ie ė iu ia ḟ ẏ
  ].freeze

  CHARACTER_TABLE = k.zip(v).to_h.freeze
  REGEXP = Regexp.union(CHARACTER_TABLE.keys).freeze

  SCHEMES = {
    cyrillic: [CHARACTER_TABLE, REGEXP].freeze,
    default: [CHARACTER_TABLE, REGEXP].freeze,
    iso9: [Iso9::CHARACTER_TABLE, Iso9::REGEXP].freeze,
    mongolian: [Mongolian::CHARACTER_TABLE, Mongolian::REGEXP].freeze,
    ukrainian: [Ukrainian::CHARACTER_TABLE, Ukrainian::REGEXP].freeze,
    ua_passport: :ua_passport,
    de: [De::CHARACTER_TABLE, De::REGEXP].freeze,
    serbian: [Serbian::CHARACTER_TABLE, Serbian::REGEXP].freeze,
    gost779b: [Gost779b::CHARACTER_TABLE, Gost779b::REGEXP].freeze,
    bgn_pcgn: [BgnPcgn::CHARACTER_TABLE, BgnPcgn::REGEXP].freeze,
    bulgarian: [Bulgarian::CHARACTER_TABLE, Bulgarian::REGEXP].freeze,
    belarusian: [Belarusian::CHARACTER_TABLE, Belarusian::REGEXP].freeze
  }.freeze

  def self.build_reverse_mapping(table, extra = {})
    rev = table.reject { |_cyr, lat| lat.nil? || lat.empty? }.to_h { |cyr, lat| [lat, cyr] }
    rev.merge!(extra)
    sorted_keys = rev.keys.sort_by { |key| -key.length }
    [rev.freeze, Regexp.union(sorted_keys).freeze].freeze
  end

  REVERSE_SCHEMES = {
    iso9: build_reverse_mapping(Iso9::CHARACTER_TABLE),
    serbian: build_reverse_mapping(
      Serbian::CHARACTER_TABLE,
      { "LJ" => "Љ", "NJ" => "Њ", "DŽ" => "Џ", "DZ" => "Џ", "dz" => "џ" }
    ),
    gost779b: build_reverse_mapping(Gost779b::CHARACTER_TABLE),
    bgn_pcgn: build_reverse_mapping(BgnPcgn::CHARACTER_TABLE),
    bulgarian: build_reverse_mapping(Bulgarian::CHARACTER_TABLE),
    belarusian: build_reverse_mapping(Belarusian::CHARACTER_TABLE),
    mongolian: build_reverse_mapping(Mongolian::CHARACTER_TABLE),
    ukrainian: build_reverse_mapping(Ukrainian::CHARACTER_TABLE),
    de: build_reverse_mapping(De::CHARACTER_TABLE),
    cyrillic: build_reverse_mapping(CHARACTER_TABLE),
    default: build_reverse_mapping(CHARACTER_TABLE)
  }.freeze

  class << self
    # Transliterates Cyrillic text into Roman (Latin) script.
    #
    # @param string [String, #to_s] The text to transliterate.
    # @param to [Symbol, String] The transliteration scheme (:cyrillic, :iso9, :mongolian,
    #   :ukrainian, :ua_passport, :de, :serbian, :gost779b, :bgn_pcgn, :bulgarian, :belarusian).
    # @return [String] The transliterated Latin script string.
    # @raise [ArgumentError] If the given transliteration scheme is unknown.
    #
    # @example Default Cyrillic transliteration
    #   Cyrillic.transliterate("Кириллица") #=> "Kirillitsa"
    #
    # @example Short alias .t with ISO 9 scheme
    #   Cyrillic.t("Кириллица", :iso9) #=> "Kirillica"
    #
    # @example Serbian Cyrillic to Latin (Vukovica to Gajica)
    #   Cyrillic.t("Љубљана", :serbian) #=> "Ljubljana"
    def transliterate(string = "", to = :cyrillic)
      return "" if string.nil? || string.empty?

      scheme_key = to.to_s.downcase.to_sym
      scheme = SCHEMES[scheme_key]
      unless scheme
        available = (SCHEMES.keys - [:default]).map(&:inspect).join(", ")
        raise ArgumentError, "Unknown transliteration scheme: #{to.inspect}. Available schemes: #{available}"
      end

      return UaPassport.transliterate(string) if scheme_key == :ua_passport

      table, regexp = scheme
      string.to_s.gsub(regexp, table)
    end
    alias t transliterate

    # Detransliterates (reverses) Latin script text back into Cyrillic script.
    #
    # @param string [String, #to_s] The Latin script text to detransliterate.
    # @param from [Symbol, String] The scheme to reverse (:iso9, :serbian, :gost779b, etc.).
    # @return [String] The Cyrillic script string.
    # @raise [ArgumentError] If the given scheme is unknown.
    #
    # @example Reverse ISO 9:1995 transliteration
    #   Cyrillic.detransliterate("Transliteraciâ", from: :iso9) #=> "Транслитерация"
    #
    # @example Reverse Serbian transliteration (Gajica to Vukovica)
    #   Cyrillic.det("Ljubljana", from: :serbian) #=> "Љубљана"
    #
    # @example Reverse GOST 7.79 System B
    #   Cyrillic.det("Shhuka", from: :gost779b) #=> "Щука"
    def detransliterate(string = "", from: :iso9)
      return "" if string.nil? || string.empty?

      scheme_key = from.to_s.downcase.to_sym
      scheme = REVERSE_SCHEMES[scheme_key]
      unless scheme
        available = (REVERSE_SCHEMES.keys - [:default]).map(&:inspect).join(", ")
        raise ArgumentError, "Unknown detransliteration scheme: #{from.inspect}. Available schemes: #{available}"
      end

      table, regexp = scheme
      string.to_s.gsub(regexp, table)
    end
    alias det detransliterate
    alias reverse_transliterate detransliterate
  end
end

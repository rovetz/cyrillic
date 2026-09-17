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
    #
    # @example GOST 7.79 System B
    #   Cyrillic.t("Щука", :gost779b) #=> "Shhuka"
    #
    # @example Bulgarian Streamlined System
    #   Cyrillic.t("България", :bulgarian) #=> "Bulgariya"
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
  end
end

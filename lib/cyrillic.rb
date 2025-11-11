require "cyrillic/version"
require "cyrillic/iso9"
require "cyrillic/mongolian"
require "cyrillic/ukrainian"
require "cyrillic/ua_passport"
require "cyrillic/de"

module Cyrillic

  k = %w(А Б В Г Д Е Ё Ж З И І Й К Л М Н О П Р С Т У Ф Х Ц Ч Ш Щ Ъ Ы Ь Ѣ Э Ю Я Ѳ Ѵ а б в г д е ё ж з и і й к л м н о п р с т у ф х ц ч ш щ ъ ы ь ѣ э ю я ѳ ѵ)
  v = %w(A B V G D E Ë ZH Z I Ī Ĭ K L M N O P R S T U F KH TS CH SH SHCH ʺ Y ʹ IE Ė IU IA Ḟ Ẏ a b v g d e ë zh z i ī ĭ k l m n o p r s t u f kh ts ch sh shch ʺ y ʹ ie ė iu ia ḟ ẏ)

  CHARACTER_TABLE = Hash[k.zip(v)]

  class << self
    def transliterate(string = "", to = :cyrillic)
      return UaPassport.transliterate(string) if to == :ua_passport

      character_table = Module.const_get(to.to_s.capitalize)::CHARACTER_TABLE
      string.to_s.gsub(/#{Regexp.union(character_table.keys).source}/i, character_table)
    end
    alias_method :t, :transliterate
  end
end

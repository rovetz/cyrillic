# frozen_string_literal: true

module Cyrillic
  # GOST 7.79-2000 System B (ISO 9 System B) ASCII digraphs transliteration.
  module Gost779b
    k = %w[
      А Б В Г Д Е Ё Ж З И Й К Л М Н О П Р С Т У Ф Х Ц Ч Ш Щ Ъ Ы Ь Э Ю Я
      а б в г д е ё ж з и й к л м н о п р с т у ф х ц ч ш щ ъ ы ь э ю я
    ].freeze

    v = %w[
      A B V G D E Yo Zh Z I J K L M N O P R S T U F X Cz Ch Sh Shh " Y ' E' Yu Ya
      a b v g d e yo zh z i j k l m n o p r s t u f x cz ch sh shh " y ' e' yu ya
    ].freeze

    CHARACTER_TABLE = k.zip(v).to_h.freeze
    REGEXP = Regexp.union(CHARACTER_TABLE.keys).freeze
  end
end

Gost779b = Cyrillic::Gost779b unless defined?(Gost779b)

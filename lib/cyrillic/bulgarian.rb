# frozen_string_literal: true

module Cyrillic
  # Bulgarian official Streamlined System (2006/2009) transliteration.
  module Bulgarian
    k = %w[
      А Б В Г Д Е Ж З И Й К Л М Н О П Р С Т У Ф Х Ц Ч Ш Щ Ъ Ь Ю Я
      а б в г д е ж з и й к л м н о п р с т у ф х ц ч ш щ ъ ь ю я
    ].freeze

    v = %w[
      A B V G D E Zh Z I Y K L M N O P R S T U F H Ts Ch Sh Sht A Y Yu Ya
      a b v g d e zh z i y k l m n o p r s t u f h ts ch sh sht a y yu ya
    ].freeze

    CHARACTER_TABLE = k.zip(v).to_h.freeze
    REGEXP = Regexp.union(CHARACTER_TABLE.keys).freeze
  end
end

Bulgarian = Cyrillic::Bulgarian unless defined?(Bulgarian)

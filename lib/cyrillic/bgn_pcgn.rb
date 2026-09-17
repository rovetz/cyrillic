# frozen_string_literal: true

module Cyrillic
  # BGN/PCGN 1947 geographic romanization system.
  module BgnPcgn
    k = %w[
      А Б В Г Д Е Ё Ж З И Й К Л М Н О П Р С Т У Ф Х Ц Ч Ш Щ Ъ Ы Ь Э Ю Я
      а б в г д е ё ж з и й к л м н о п р с т у ф х ц ч ш щ ъ ы ь э ю я
    ].freeze

    v = %w[
      A B V G D E Yo Zh Z I Y K L M N O P R S T U F Kh Ts Ch Sh Shch " Y ' E Yu Ya
      a b v g d e yo zh z i y k l m n o p r s t u f kh ts ch sh shch " y ' e yu ya
    ].freeze

    CHARACTER_TABLE = k.zip(v).to_h.freeze
    REGEXP = Regexp.union(CHARACTER_TABLE.keys).freeze
  end
end

BgnPcgn = Cyrillic::BgnPcgn unless defined?(BgnPcgn)

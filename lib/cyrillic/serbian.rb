# frozen_string_literal: true

module Cyrillic
  # Serbian Cyrillic to Gaj's Latin transliteration (Vukovica to Gajica).
  module Serbian
    k = %w[
      А Б В Г Д Ђ Е Ж З И Ј К Л Љ М Н Њ О П Р С Т Ћ У Ф Х Ц Ч Џ Ш
      а б в г д ђ е ж з и ј к л љ м н њ о п р с т ћ у ф х ц ч џ ш
    ].freeze

    v = %w[
      A B V G D Đ E Ž Z I J K L Lj M N Nj O P R S T Ć U F H C Č Dž Š
      a b v g d đ e ž z i j k l lj m n nj o p r s t ć u f h c č dž š
    ].freeze

    CHARACTER_TABLE = k.zip(v).to_h.freeze
    REGEXP = Regexp.union(CHARACTER_TABLE.keys).freeze
  end
end

Serbian = Cyrillic::Serbian unless defined?(Serbian)

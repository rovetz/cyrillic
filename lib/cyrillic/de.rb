# frozen_string_literal: true

module Cyrillic
  module De
    k = %w[А Б В Г Д Е Ё Ж З И Й К Л М Н О П Р С Т У Ф Х Ц Ч Ш Щ Ъ Ы Ь Э Ю Я а б в г д е ё ж з и й к л м н о п р с т у ф х ц ч ш щ ъ ы ь э ю я].freeze
    v = %w[A B W G D E Jo Sch S I J K L M N O P R S T U F Ch Z Tsch Sch Schtsch "" Y "" E Ju Ja a b w g d e jo sch s i j k l m n o p r s t u f ch z tsch sch schtsch "" y "" e ju ja].freeze

    CHARACTER_TABLE = k.zip(v).to_h.freeze
    REGEXP = Regexp.union(CHARACTER_TABLE.keys).freeze
  end
end

De = Cyrillic::De unless defined?(De)

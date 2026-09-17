# frozen_string_literal: true

module Cyrillic
  module Ukrainian
    k = %w[А Б В Г Ґ Д Е Є Ж З И І Ї Й К Л М Н О П Р С Т У Ф Х Ц Ч Ш Щ Ь Ю Я а б в г ґ д е є ж з и і ї й к л м н о п р с т у ф х ц ч ш щ ь ю я].freeze
    v = %w[A B V H G D E Ye Zh Z Y I Yi I K L M N O P R S T U F Kh Ts Ch Sh Shch ʹ Iu Ia a b v h g d e ye zh z y i yi i k l m n o p r s t u f kh ts ch sh shch ʹ iu ia].freeze

    CHARACTER_TABLE = k.zip(v).to_h.freeze
    REGEXP = Regexp.union(CHARACTER_TABLE.keys).freeze
  end
end

Ukrainian = Cyrillic::Ukrainian unless defined?(Ukrainian)

# frozen_string_literal: true

module Cyrillic
  module Belarusian
    k = %w[
      А Б В Г Д Е Ё Ж З І Й К Л М Н О П Р С Т У Ў Ф Х Ц Ч Ш Ы Ь Э Ю Я
      а б в г д е ё ж з і й к л м н о п р с т у ў ф х ц ч ш ы ь э ю я
    ].freeze

    v = %w[
      A B V H D E Jo Ž Z I J K L M N O P R S T U Ŭ F Ch C Č Š Y ' E Ju Ja
      a b v h d e jo ž z i j k l m n o p r s t u ŭ f ch c č š y ' e ju ja
    ].freeze

    CHARACTER_TABLE = k.zip(v).to_h.freeze
    REGEXP = Regexp.union(CHARACTER_TABLE.keys).freeze
  end
end

Belarusian = Cyrillic::Belarusian unless defined?(Belarusian)

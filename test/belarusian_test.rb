# frozen_string_literal: true

require "test_helper"

class BelarusianTest < Minitest::Test
  def test_belarusian_transliteration
    assert_equal "Minsk", Cyrillic.t("Мінск", :belarusian)
    assert_equal "Hrodna", Cyrillic.t("Гродна", :belarusian)
    assert_equal "Mahiljoŭ", Cyrillic.t("Магілёў", :belarusian)
    assert_equal "Brest", Cyrillic.t("Брэст", :belarusian)
    assert_equal "Polack", Cyrillic.t("Полацк", :belarusian)
    assert_equal "Braslaŭ", Cyrillic.t("Браслаў", :belarusian)
  end
end

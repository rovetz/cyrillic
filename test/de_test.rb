require "test_helper"

class DeTest < Minitest::Test
  def test_de_transliteration
    assert_equal "Tschajkowskij", Cyrillic.t("Чайковский", :de)
    assert_equal "Schtscherbakow", Cyrillic.t("Щербаков", :de)
    assert_equal "Moskwa", Cyrillic.t("Москва", :de)
  end
end

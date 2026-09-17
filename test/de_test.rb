# frozen_string_literal: true

require "test_helper"

class DeTest < Minitest::Test
  def test_de_transliteration
    assert_equal "Tschajkowskij", Cyrillic.t("Чайковский", :de)
    assert_equal "Schtscherbakow", Cyrillic.t("Щербаков", :de)
    assert_equal "Wesna", Cyrillic.t("Весна", :de)
  end
end

# frozen_string_literal: true

require "test_helper"

class Gost779bTest < Minitest::Test
  def test_gost779b_transliteration
    assert_equal "Shhuka", Cyrillic.t("Щука", :gost779b)
    assert_equal "Zheleznyakov", Cyrillic.t("Железняков", :gost779b)
    assert_equal "Czvetkov", Cyrillic.t("Цветков", :gost779b)
    assert_equal "Pod\"ezd", Cyrillic.t("Подъезд", :gost779b)
    assert_equal "Obychnyj", Cyrillic.t("Обычный", :gost779b)
    assert_equal "E'kspress", Cyrillic.t("Экспресс", :gost779b)
  end
end

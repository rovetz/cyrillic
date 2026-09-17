# frozen_string_literal: true

require "test_helper"

class BulgarianTest < Minitest::Test
  def test_bulgarian_transliteration
    assert_equal "Balgariya", Cyrillic.t("България", :bulgarian)
    assert_equal "Sofiya", Cyrillic.t("София", :bulgarian)
    assert_equal "Plovdiv", Cyrillic.t("Пловдив", :bulgarian)
    assert_equal "Veliko Tarnovo", Cyrillic.t("Велико Търново", :bulgarian)
    assert_equal "Peshtera", Cyrillic.t("Пещера", :bulgarian)
    assert_equal "Knyazhevo", Cyrillic.t("Княжево", :bulgarian)
  end
end

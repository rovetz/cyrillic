# frozen_string_literal: true

require "test_helper"

class BgnPcgnTest < Minitest::Test
  def test_bgn_pcgn_transliteration
    assert_equal "Khabarovsk", Cyrillic.t("Хабаровск", :bgn_pcgn)
    assert_equal "Vladivostok", Cyrillic.t("Владивосток", :bgn_pcgn)
    assert_equal "Nizhniy Novgorod", Cyrillic.t("Нижний Новгород", :bgn_pcgn)
    assert_equal "Shchyolkino", Cyrillic.t("Щёлкино", :bgn_pcgn)
    assert_equal "Tsaritsyn", Cyrillic.t("Царицын", :bgn_pcgn)
  end
end

require "test_helper"

class UkrainianTest < Minitest::Test
  def test_ukrainian
    assert_equal "AbvhGD", Cyrillic.t("АбвгҐД", :ukrainian)
    assert_equal "Andrii", Cyrillic.t("Андрій", :ukrainian)
    assert_equal "Kateryna", Cyrillic.t("Катерина", :ukrainian)
  end
end

# frozen_string_literal: true

require "test_helper"

class SerbianTest < Minitest::Test
  def test_serbian_transliteration
    assert_equal "Ljubljana", Cyrillic.t("Љубљана", :serbian)
    assert_equal "Njegoš", Cyrillic.t("Његош", :serbian)
    assert_equal "Džemper", Cyrillic.t("Џемпер", :serbian)
    assert_equal "Đorđe", Cyrillic.t("Ђорђе", :serbian)
    assert_equal "Ćuprija", Cyrillic.t("Ћуприја", :serbian)
    assert_equal "Beograd", Cyrillic.t("Београд", :serbian)
  end

  def test_all_serbian_letters
    cyrillic = "АБВГДЂЕЖЗИЈКЛЉМНЊОПРСТЋУФХЦЧЏШабвгдђежзијклљмнњопрстћуфхцчџш"
    latin = "ABVGDĐEŽZIJKL Lj MN Nj OPRSTĆUFHCČ Dž Šabvgdđežzijkl lj mn nj oprstćufhcč dž š".delete(" ")

    assert_equal latin, Cyrillic.t(cyrillic, :serbian)
  end
end

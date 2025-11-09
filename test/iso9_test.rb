require "test_helper"

class Iso9Test < Minitest::Test
  def test_iso9
    assert_equal "Ne važno, kak medlenno ty prodvigaešʹsâ, glavnoe, čto ty ne ostanavlivaešʹsâ.",
    Cyrillic.t("Не важно, как медленно ты продвигаешься, главное, что ты не останавливаешься.", :iso9)
    
    assert_equal "Sʺešʹ eŝë ètih mâgkih francuzskih bulok, da vypej že čaû.",
    Cyrillic.t("Съешь ещё этих мягких французских булок, да выпей же чаю.", :iso9)

    # fragment of the Preamble of the Universal Declaration of Human Rights in Bulgarian
    assert_equal "Kato vze predvid, če priznavaneto na dostojnstvoto, prisʺŝo na vsički členove na čoveškiâ rod,
na tehnite ravni i neotmenimi prava predstavlâva osnova na svobodata, spravedlivostta i mira v sveta",
    Cyrillic.t("Като взе предвид, че признаването на достойнството, присъщо на всички членове на човешкия род,
на техните равни и неотменими права представлява основа на свободата, справедливостта и мира в света", :iso9)
  end
end

require "test_helper"

class CyrillicTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Cyrillic::VERSION
  end

  def test_it_does_transliteration
    assert_equal "KirilliTSa", Cyrillic.t("КириллиЦа")
  end
end

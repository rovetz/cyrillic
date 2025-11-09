require "test_helper"

class MongolianTest < Minitest::Test
  def test_mongolian
    assert_equal "Mongol khel", Cyrillic.t("Монгол хэл", :mongolian)
  end
end

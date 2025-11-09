require "test_helper"

class MongolianTest < Minitest::Test
  def test_mongolian
    assert_equal "Mongol khel", Cyrillic.t("Монгол хэл", :mongolian)
  end

  def test_mongolian_edge_cases
    assert_equal "OUKhTsChShShIYIEYuYa", Cyrillic.t("ӨҮХЦЧШЩЪЫЬЭЮЯ", :mongolian)
  end

  def test_mongolian_sentence
    assert_equal "Ekh oron", Cyrillic.t("Эх орон", :mongolian)
  end
end

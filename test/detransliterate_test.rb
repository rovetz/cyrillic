# frozen_string_literal: true

require "test_helper"

class DetransliterateTest < Minitest::Test
  def test_iso9_roundtrip
    original = "Не важно, как медленно ты продвигаешься, главное, что ты не останавливаешься."
    latin = Cyrillic.t(original, :iso9)

    assert_equal original, Cyrillic.det(latin, from: :iso9)
    assert_equal original, Cyrillic.detransliterate(latin, from: :iso9)
    assert_equal original, Cyrillic.reverse_transliterate(latin, from: :iso9)
  end

  def test_iso9_single_words
    assert_equal "Транслитерация", Cyrillic.det("Transliteraciâ", from: :iso9)
    assert_equal "Россия", Cyrillic.det("Rossiâ", from: :iso9)
  end

  def test_serbian_roundtrip
    original = "Љубљана"
    latin = Cyrillic.t(original, :serbian)
    assert_equal "Ljubljana", latin
    assert_equal original, Cyrillic.det(latin, from: :serbian)

    assert_equal "Његош", Cyrillic.det("Njegoš", from: :serbian)
    assert_equal "Џемпер", Cyrillic.det("Džemper", from: :serbian)
    assert_equal "Ђорђе", Cyrillic.det("Đorđe", from: :serbian)
    assert_equal "Ћуприја", Cyrillic.det("Ćuprija", from: :serbian)
    assert_equal "ЉУБЉАНА", Cyrillic.det("LJUBLJANA", from: :serbian)
  end

  def test_gost779b_detransliteration
    assert_equal "Щука", Cyrillic.det("Shhuka", from: :gost779b)
    assert_equal "Железняков", Cyrillic.det("Zheleznyakov", from: :gost779b)
    assert_equal "Экспресс", Cyrillic.det("E'kspress", from: :gost779b)
  end

  def test_nil_and_empty_inputs
    assert_equal "", Cyrillic.det(nil)
    assert_equal "", Cyrillic.det("")
    assert_equal "", Cyrillic.det(nil, from: :serbian)
    assert_equal "", Cyrillic.det("", from: :serbian)
  end

  def test_case_insensitive_from_scheme
    assert_equal "Транслитерация", Cyrillic.det("Transliteraciâ", from: "ISO9")
    assert_equal "Љубљана", Cyrillic.det("Ljubljana", from: "SERBIAN")
  end

  def test_unknown_from_scheme_raises_argument_error
    err = assert_raises(ArgumentError) do
      Cyrillic.det("Text", from: :invalid_scheme)
    end
    assert_includes err.message, "Unknown detransliteration scheme: :invalid_scheme"
    assert_includes err.message, "Available schemes:"
  end

  def test_cli_reverse_iso9
    out, status = Open3.capture2("bundle exec exe/cyrillic -r 'Transliteraciâ'")

    assert_predicate status, :success?
    assert_equal "Транслитерация\n", out
  end

  def test_cli_reverse_serbian
    out, status = Open3.capture2("bundle exec exe/cyrillic -r -s serbian 'Ljubljana'")

    assert_predicate status, :success?
    assert_equal "Љубљана\n", out
  end

  def test_cli_reverse_gost779b
    out, status = Open3.capture2("bundle exec exe/cyrillic -r -s gost779b 'Shhuka'")

    assert_predicate status, :success?
    assert_equal "Щука\n", out
  end

  def test_cli_reverse_stdin
    out, status = Open3.capture2("bundle exec exe/cyrillic -r", stdin_data: "Transliteraciâ\n")

    assert_predicate status, :success?
    assert_equal "Транслитерация\n", out
  end
end

# frozen_string_literal: true

require "test_helper"
require "tempfile"

class CyrillicTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Cyrillic::VERSION
  end

  def test_it_does_transliteration
    assert_equal "KirilliTSa", Cyrillic.t("КириллиЦа")
    assert_equal "KirilliTSa", Cyrillic.transliterate("КириллиЦа")
  end

  def test_nil_and_empty_string
    assert_equal "", Cyrillic.t(nil)
    assert_equal "", Cyrillic.t("")
    assert_equal "", Cyrillic.t(nil, :iso9)
    assert_equal "", Cyrillic.t("", :iso9)
    assert_equal "", Cyrillic.t(nil, :ua_passport)
    assert_equal "", Cyrillic.t("", :ua_passport)
  end

  def test_scheme_case_insensitivity
    assert_equal Cyrillic.t("Транслитерация", :iso9), Cyrillic.t("Транслитерация", "ISO9")
    assert_equal Cyrillic.t("Кириллица", :cyrillic), Cyrillic.t("Кириллица", "DEFAULT")
  end

  def test_unknown_scheme_raises_argument_error
    err = assert_raises(ArgumentError) do
      Cyrillic.t("Тест", :unknown_scheme)
    end
    assert_includes err.message, "Unknown transliteration scheme: :unknown_scheme"
    assert_includes err.message, "Available schemes:"
  end

  def test_backwards_compatible_top_level_constants
    assert_equal Cyrillic::Iso9, Iso9
    assert_equal Cyrillic::Mongolian, Mongolian
    assert_equal Cyrillic::Ukrainian, Ukrainian
    assert_equal Cyrillic::UaPassport, UaPassport
    assert_equal Cyrillic::De, De
  end

  def test_cli_argument
    out, status = Open3.capture2("bundle exec exe/cyrillic 'КириллиЦа'")

    assert_predicate status, :success?
    assert_equal "KirilliTSa\n", out
  end

  def test_cli_scheme_argument
    out, status = Open3.capture2("bundle exec exe/cyrillic -s iso9 'Транслитерация'")

    assert_predicate status, :success?
    assert_equal "Transliteraciâ\n", out
  end

  def test_cli_ua_passport_scheme
    out, status = Open3.capture2("bundle exec exe/cyrillic -s ua_passport 'Борщагівка'")

    assert_predicate status, :success?
    assert_equal "Borshchahivka\n", out
  end

  def test_cli_stdin
    out, status = Open3.capture2("bundle exec exe/cyrillic", stdin_data: "КириллиЦа\n")

    assert_predicate status, :success?
    assert_equal "KirilliTSa\n", out
  end

  def test_cli_file_argument
    file = Tempfile.new("cyrillic_test")
    file.write("КириллиЦа\n")
    file.close

    out, status = Open3.capture2("bundle exec exe/cyrillic #{file.path}")

    assert_predicate status, :success?
    assert_equal "KirilliTSa\n", out
  ensure
    file&.unlink
  end

  def test_cli_version
    out, status = Open3.capture2("bundle exec exe/cyrillic --version")

    assert_predicate status, :success?
    assert_equal "cyrillic #{Cyrillic::VERSION}\n", out
  end

  def test_cli_help
    out, status = Open3.capture2("bundle exec exe/cyrillic --help")

    assert_predicate status, :success?
    assert_includes out, "Usage: cyrillic"
    assert_includes out, "Options:"
  end
end

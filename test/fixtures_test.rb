# frozen_string_literal: true

require "test_helper"

class FixturesTest < Minitest::Test
  def read_fixture(filename)
    path = File.expand_path("fixtures/#{filename}", __dir__)
    lines = File.readlines(path, chomp: true).reject(&:empty?)
    headers = lines.first.split(",")
    lines[1..].map { |line| headers.zip(line.split(",")).to_h }
  end

  def test_ua_places_fixture
    read_fixture("ua_places.csv").each do |row|
      cyr = row["cyrillic"]
      assert_equal row["ua_passport"], Cyrillic.t(cyr, :ua_passport), "ua_passport mismatch for #{cyr}"
      assert_equal row["ukrainian"], Cyrillic.t(cyr, :ukrainian), "ukrainian mismatch for #{cyr}"
    end
  end

  def test_serbian_cities_fixture
    read_fixture("serbian_cities.csv").each do |row|
      cyr = row["cyrillic"]
      expected_lat = row["serbian"]
      assert_equal expected_lat, Cyrillic.t(cyr, :serbian), "serbian transliteration mismatch for #{cyr}"
      assert_equal cyr, Cyrillic.det(expected_lat, :serbian), "serbian reverse mismatch for #{expected_lat}"
    end
  end

  def test_bulgarian_cities_fixture
    read_fixture("bulgarian_cities.csv").each do |row|
      cyr = row["cyrillic"]
      assert_equal row["bulgarian"], Cyrillic.t(cyr, :bulgarian), "bulgarian mismatch for #{cyr}"
    end
  end

  def test_belarusian_cities_fixture
    read_fixture("belarusian_cities.csv").each do |row|
      cyr = row["cyrillic"]
      assert_equal row["belarusian"], Cyrillic.t(cyr, :belarusian), "belarusian mismatch for #{cyr}"
    end
  end

  def test_mongolian_cities_fixture
    read_fixture("mongolian_cities.csv").each do |row|
      cyr = row["cyrillic"]
      assert_equal row["mongolian"], Cyrillic.t(cyr, :mongolian), "mongolian mismatch for #{cyr}"
    end
  end

  def test_standard_schemes_fixture
    read_fixture("standard_schemes.csv").each do |row|
      cyr = row["cyrillic"]
      iso9 = row["iso9"]
      gost = row["gost779b"]
      bgn = row["bgn_pcgn"]

      assert_equal iso9, Cyrillic.t(cyr, :iso9), "iso9 mismatch for #{cyr}"
      assert_equal cyr, Cyrillic.det(iso9, :iso9), "iso9 reverse mismatch for #{iso9}"
      assert_equal gost, Cyrillic.t(cyr, :gost779b), "gost779b mismatch for #{cyr}"
      assert_equal bgn, Cyrillic.t(cyr, :bgn_pcgn), "bgn_pcgn mismatch for #{cyr}"
    end
  end
end

# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "benchmark/ips"
require "cyrillic"

SHORT_TEXT = "Не важно, как медленно ты продвигаешься, главное, что ты не останавливаешься."
PARAGRAPH_TEXT = [
  "Весна пришла в город с первыми теплыми лучами солнца и ароматом цветущих садов.",
  "На центральных улицах кипела жизнь: открывались уютные кафе, люди гуляли по набережной.",
  "Каждый новый день приносил вдохновение, надежду и стремление к созиданию прекрасного будущего.",
  "В библиотеках и университетах студенты усердно готовились к весенним экзаменам и научным конференциям."
].join(" ")
LONG_TEXT = "#{PARAGRAPH_TEXT} " * 30

puts "=" * 60
puts "Cyrillic Gem Performance Benchmarks"
puts "Ruby: #{RUBY_DESCRIPTION}"
puts "=" * 60

puts "\n[1] Schemes Comparison (Paragraph Text, ~350 chars)"
Benchmark.ips do |x|
  x.config(time: 1, warmup: 0.5)

  %i[cyrillic iso9 serbian gost779b bgn_pcgn bulgarian belarusian mongolian ukrainian ua_passport de].each do |scheme|
    x.report(scheme.to_s) do
      Cyrillic.t(PARAGRAPH_TEXT, scheme)
    end
  end

  x.compare!
end

puts "\n[2] Forward vs Reverse Transliteration (ISO 9 & Serbian)"
iso9_latin = Cyrillic.t(PARAGRAPH_TEXT, :iso9)
serbian_cyr = "Београд, Нови Сад, Ниш, Крагујевац, Суботица, Зрењанин, Панчево, Чачак, Краљево, Ваљево."
serbian_lat = Cyrillic.t(serbian_cyr, :serbian)

Benchmark.ips do |x|
  x.config(time: 1, warmup: 0.5)

  x.report("iso9 forward")  { Cyrillic.t(PARAGRAPH_TEXT, :iso9) }
  x.report("iso9 reverse")  { Cyrillic.det(iso9_latin, :iso9) }
  x.report("serbian fwd")   { Cyrillic.t(serbian_cyr, :serbian) }
  x.report("serbian rev")   { Cyrillic.det(serbian_lat, :serbian) }

  x.compare!
end

puts "\n[3] Scalability by Text Size (ISO 9: short, medium, long)"
Benchmark.ips do |x|
  x.config(time: 1, warmup: 0.5)

  x.report("short (~75 chars)")    { Cyrillic.t(SHORT_TEXT, :iso9) }
  x.report("medium (~350 chars)")  { Cyrillic.t(PARAGRAPH_TEXT, :iso9) }
  x.report("long (~10,500 chars)") { Cyrillic.t(LONG_TEXT, :iso9) }

  x.compare!
end

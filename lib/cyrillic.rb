require "cyrillic/version"

module Cyrillic

  # Note. The letters І, Ѣ, Ѳ and Ѵ were eliminated in the orthographic reform of 1918.
  # For other  obsolete letters appearing in Russian texts, consult the Church Slavic table.

  CHARACTER_TABLE = {
    "А" => "A",
    "Б" => "B",
    "В" => "V",
    "Г" => "G",
    "Д" => "D",
    "Е" => "E",
    "Ё" => "Ë",
    "Ж" => "ZH",
    "З" => "Z",
    "И" => "I",
    "І" => "Ī",
    "Й" => "Ĭ",
    "К" => "K",
    "Л" => "L",
    "М" => "M",
    "Н" => "N",
    "О" => "O",
    "П" => "P",
    "Р" => "R",
    "С" => "S",
    "Т" => "T",
    "У" => "U",
    "Ф" => "F",
    "Х" => "KH",
    "Ц" => "TS",
    "Ч" => "CH",
    "Ш" => "SH",
    "Щ" => "SHCH",
    "Ъ" => "ʺ", #(HARD SIGN)
    "Ы" => "Y",
    "Ь" => "ʹ", #(SOFT SIGN)
    "Ѣ" => "IE",
    "Э" => "Ė",
    "Ю" => "IU",
    "Я" => "IA",
    "Ѳ" => "Ḟ",
    "Ѵ" => "Ẏ",

    "а" => "a",
    "б" => "b",
    "в" => "v",
    "г" => "g",
    "д" => "d",
    "е" => "e",
    "ё" => "ë",
    "ж" => "zh",
    "з" => "z",
    "и" => "i",
    "і" => "ī",
    "й" => "ĭ",
    "к" => "k",
    "л" => "l",
    "м" => "m",
    "н" => "n",
    "о" => "o",
    "п" => "p",
    "р" => "r",
    "с" => "s",
    "т" => "t",
    "у" => "u",
    "ф" => "f",
    "х" => "kh",
    "ц" => "ts",
    "ч" => "ch",
    "ш" => "sh",
    "щ" => "shch",
    "ъ" => "ʺ", #(hard sign)
    "ы" => "y",
    "ь" => "ʹ", #(soft sign)
    "ѣ" => "ie",
    "э" => "ė",
    "ю" => "iu",
    "я" => "ia",
    "ѳ" => "ḟ",
    "ѵ" => "ẏ",
  }

  class << self
    def transliterate(string = "")
      string.to_s.gsub(Regexp.union(CHARACTER_TABLE.keys), CHARACTER_TABLE)
    end
    alias_method :t, :transliterate
  end
  
end

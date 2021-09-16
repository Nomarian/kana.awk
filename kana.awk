#
# convert romaji into hiragana and katakana.
#

BEGIN {
  FS = ":"

  # slurp the csv kana into associative arrays
  while (getline < ARGV[1] > 0) {
    hiragana[$1] = $2
    katakana[$1] = $3
  }

  while (getline < "-" > 0) {
    # split the string into fields
    gsub("([kstnhmr][aiueo])|(chi)|(tsu)|(shi)|(y[auo])|(w[ao])|(n)|([aiueo])|(\.)", "&:", $0)

    romaji_length = split($0, romaji, ":")

    # chomp off the last ":"
    romaji_length = romaji_length - 1

    # print the hiragana
    for (i = 0; i <= romaji_length; i++) {
      printf("%s", hiragana[romaji[i]])
    }

    printf "\n"

    # print the katakana
    for (i = 0; i <= romaji_length; i++) {
      printf("%s", katakana[romaji[i]])
    }

    printf "\n"
  }
}

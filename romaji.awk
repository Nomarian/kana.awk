#!/usr/bin/awk -f

# awk -F: 'BEGIN{q="\""} {printf("romaji[%s] = %s; romaji[%s] = %s\n",q $2 q,q $1 q,q $3 q, q $1 q) }' kana.csv
# missing some, better to scrape rob pikes nihongo instead

BEGIN {
 romaji["あ"] = "a"; romaji["ア"] = "a"
 romaji["い"] = "i"; romaji["イ"] = "i"
 romaji["う"] = "u"; romaji["ウ"] = "u"
 romaji["え"] = "e"; romaji["エ"] = "e"
 romaji["お"] = "o"; romaji["オ"] = "o"
 romaji["か"] = "ka"; romaji["カ"] = "ka"
 romaji["き"] = "ki"; romaji["キ"] = "ki"
 romaji["く"] = "ku"; romaji["ク"] = "ku"
 romaji["け"] = "ke"; romaji["ケ"] = "ke"
 romaji["こ"] = "ko"; romaji["コ"] = "ko"
 romaji["さ"] = "sa"; romaji["サ"] = "sa"
# romaji["し"] = "si"; romaji["シ"] = "si"
 romaji["し"] = "shi"; romaji["シ"] = "shi"
 romaji["す"] = "su"; romaji["ス"] = "su"
 romaji["せ"] = "se"; romaji["セ"] = "se"
 romaji["そ"] = "so"; romaji["ソ"] = "so"
 romaji["た"] = "ta"; romaji["タ"] = "ta"
# romaji["ち"] = "ti"; romaji["チ"] = "ti"
 romaji["ち"] = "chi"; romaji["チ"] = "chi"
 romaji["つ"] = "tu"; romaji["ツ"] = "tu"
 romaji["つ"] = "tsu"; romaji["ツ"] = "tsu"
 romaji["て"] = "te"; romaji["テ"] = "te"
 romaji["と"] = "to"; romaji["ト"] = "to"
 romaji["な"] = "na"; romaji["ナ"] = "na"
 romaji["に"] = "ni"; romaji["ニ"] = "ni"
 romaji["ぬ"] = "nu"; romaji["ヌ"] = "nu"
 romaji["ね"] = "ne"; romaji["ネ"] = "ne"
 romaji["の"] = "no"; romaji["ノ"] = "no"
 romaji["は"] = "ha"; romaji["ハ"] = "ha"
 romaji["ひ"] = "hi"; romaji["ヒ"] = "hi"
# romaji["ふ"] = "hu"; romaji["フ"] = "hu"
 romaji["ふ"] = "fu"; romaji["フ"] = "fu"
 romaji["へ"] = "he"; romaji["ヘ"] = "he"
 romaji["ほ"] = "ho"; romaji["ホ"] = "ho"
 romaji["ま"] = "ma"; romaji["マ"] = "ma"
 romaji["み"] = "mi"; romaji["ミ"] = "mi"
 romaji["む"] = "mu"; romaji["ム"] = "mu"
 romaji["め"] = "me"; romaji["メ"] = "me"
 romaji["も"] = "mo"; romaji["モ"] = "mo"
 romaji["や"] = "ya"; romaji["ヤ"] = "ya"
 romaji["ゆ"] = "yu"; romaji["ユ"] = "yu"
 romaji["よ"] = "yo"; romaji["ヨ"] = "yo"
 romaji["ら"] = "ra"; romaji["ラ"] = "ra"
 romaji["り"] = "ri"; romaji["リ"] = "ri"
 romaji["る"] = "ru"; romaji["ル"] = "ru"
 romaji["れ"] = "re"; romaji["レ"] = "re"
 romaji["ろ"] = "ro"; romaji["ロ"] = "ro"
 romaji["わ"] = "wa"; romaji["ワ"] = "wa"
 romaji["ん"] = "n"; romaji["ン"] = "n"
 romaji["を"] = "wo"; romaji["ヲ"] = "wo"
# romaji["。"] = "."; romaji["。"] = "."
 romaji["。"] = "."
}

{ s=$0
 while( match(s,regex) ){
  x=substr(s,RSTART,RLENGTH)
  if (romaji[x]) x=romaji[x]
  str=str x
  s=substr(s,RSTART+RLENGTH)
 }
 print str
}

BEGIN { # building that regex
 for(r in romaji) regex = regex r "|"
 regex = regex "."
}

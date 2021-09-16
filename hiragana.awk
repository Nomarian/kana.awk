#!/usr/bin/awk -f

{ s = $0
 while( match(s,regex) ){
  x=substr(s,RSTART,RLENGTH)
  if (kana[x]) x=kana[x]
  str=str x
  s=substr(s,RSTART+RLENGTH)
 }
 print str
}

BEGIN {
 kana["a"] = "あ"
 kana["i"] = "い"
 kana["u"] = "う"
 kana["e"] = "え"
 kana["o"] = "お"
 kana["ka"] = "か"
 kana["ki"] = "き"
 kana["ku"] = "く"
 kana["ke"] = "け"
 kana["ko"] = "こ"
 kana["sa"] = "さ"
 kana["si"] = "し"
 kana["shi"] = "し"
 kana["su"] = "す"
 kana["se"] = "せ"
 kana["so"] = "そ"
 kana["ta"] = "た"
 kana["ti"] = "ち"
 kana["chi"] = "ち"
 kana["tu"] = "つ"
 kana["tsu"] = "つ"
 kana["te"] = "て"
 kana["to"] = "と"
 kana["na"] = "な"
 kana["ni"] = "に"
 kana["nu"] = "ぬ"
 kana["ne"] = "ね"
 kana["no"] = "の"
 kana["ha"] = "は"
 kana["hi"] = "ひ"
 kana["hu"] = "ふ"
 kana["fu"] = "ふ"
 kana["he"] = "へ"
 kana["ho"] = "ほ"
 kana["ma"] = "ま"
 kana["mi"] = "み"
 kana["mu"] = "む"
 kana["me"] = "め"
 kana["mo"] = "も"
 kana["ya"] = "や"
 kana["yu"] = "ゆ"
 kana["yo"] = "よ"
 kana["ra"] = "ら"
 kana["ri"] = "り"
 kana["ru"] = "る"
 kana["re"] = "れ"
 kana["ro"] = "ろ"
 kana["wa"] = "わ"
 kana["n"] = "ん"
 kana["wo"] = "を"
}

BEGIN { # building that regex
 for(r in kana) regex = regex r "|"
 regex = regex "\\.|."
 kana["."] = "。"
}

#!/usr/bin/awk -f

# awk -F: 'BEGIN{q="\""} {printf("hira[%s] = %s; kata[%s] = %s\n",q $1 q,q $2 q,q $1 q, q $3 q) }' kana.csv

{ s=$0
 while( match(s,regex) ){
  x=substr(s,RSTART,RLENGTH)
  if (kana[x]) x=kana[x]
  str=str x
  s=substr(s,RSTART+RLENGTH)
 }
 print str
}

BEGIN {
 kana["a"] = "ア"
 kana["i"] = "イ"
 kana["u"] = "ウ"
 kana["e"] = "エ"
 kana["o"] = "オ"
 kana["ka"] = "カ"
 kana["ki"] = "キ"
 kana["ku"] = "ク"
 kana["ke"] = "ケ"
 kana["ko"] = "コ"
 kana["sa"] = "サ"
 kana["si"] = "シ"
 kana["shi"] = "シ"
 kana["su"] = "ス"
 kana["se"] = "セ"
 kana["so"] = "ソ"
 kana["ta"] = "タ"
 kana["ti"] = "チ"
 kana["chi"] = "チ"
 kana["tu"] = "ツ"
 kana["tsu"] = "ツ"
 kana["te"] = "テ"
 kana["to"] = "ト"
 kana["na"] = "ナ"
 kana["ni"] = "ニ"
 kana["nu"] = "ヌ"
 kana["ne"] = "ネ"
 kana["no"] = "ノ"
 kana["ha"] = "ハ"
 kana["hi"] = "ヒ"
 kana["hu"] = "フ"
 kana["fu"] = "フ"
 kana["he"] = "ヘ"
 kana["ho"] = "ホ"
 kana["ma"] = "マ"
 kana["mi"] = "ミ"
 kana["mu"] = "ム"
 kana["me"] = "メ"
 kana["mo"] = "モ"
 kana["ya"] = "ヤ"
 kana["yu"] = "ユ"
 kana["yo"] = "ヨ"
 kana["ra"] = "ラ"
 kana["ri"] = "リ"
 kana["ru"] = "ル"
 kana["re"] = "レ"
 kana["ro"] = "ロ"
 kana["wa"] = "ワ"
 kana["n"] = "ン"
 kana["wo"] = "ヲ"
}

BEGIN { # building that regex
 for(r in kana) regex = regex r "|"
 regex = regex "\\.|."
 kana["."] = "。"
}

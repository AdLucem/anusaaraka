####Any changes done in stdenglish/abbr1.lex should be updated here and also in abbr_browser.sh


sed 's/(Eng_sen \"//g' English_sentence.dat | sed  's/\")//g'|sed 's/&quot;/\"/g'|  sed 's/\&amp;/&/g'| sed 's/ABBRDOTDOTDOT /. . . /g' | sed 's/ DOTDOTDOT/ .../g' |  sed 's/ABBRThatis/i.e./g' | sed 's/aABBRDOTABBRkABBRDOTABBRaABBRDOTABBR/a.k.a./g' | sed 's/eABBRDOTABBRgABBRDOTABBR/e.g./g'|  sed 's/TWTWTWTW/_/g' |  sed 's/TWTW/ /g' | sed 's/UABBRDOTABBRSABBRDOTABBR/U.S./g' | sed 's/UABBRDOTABBRSABBRDOTABBRAABBRDOTABBR/U.S.A./g' | sed 's/UABBRDOTABBRKABBRDOTABBR/U.K./g' | sed 's/AABBRDOTABBRDABBRDOTABBR/A.D./g' |  sed 's/SrABBRDOT/Sr./g' |  sed 's/JrABBRDOT/Jr./g' | sed 's/DrABBRDOT/Dr./g' |  sed 's/MrABBRDOT/Mr./g' | sed 's/MrsABBRDOT/Mrs./g' | sed 's/MsABBRDOT/Ms./g' | sed 's/IncABBRDOT/Inc./g' | sed 's/ ABBRDOT / . /g' | sed 's/\([0-9]*\) ABBRpercent/\1%/g' | sed 's/ABBRdollar /$/g' | sed 's/ABBRsharp /#/g' | sed 's/ \([rR]\)sABBRDOT/ \1s./g' | sed 's/ \([nN]\)oABBRDOT/ \1o./g' | sed 's/ approxABBRDOT/ approx./g' | sed 's/caABBRDOT /ca. /g' | sed 's/aABBRDOTdABBRDOT /a.d. /g'  | sed 's/bABBRDOTcABBRDOT/b.c./g' | sed 's/mABBRDOTgABBRDOT /m.g. /g' 

cat  hindi_sentence.dat | sed  's/right_paren,/)/g' | sed  's/)\./\./g'|sed  's/equal_to/=/g'|sed  's/left_paren/(/g'|sed  's/right_paren/)/g' |sed  's/\")//g'|sed 's/&quot;/\"/g'|sed 's/\&amp;/&/g'| sed 's/ABBRDOTDOTDOT /. . . /g' | sed 's/ DOTDOTDOT/ .../g'| sed 's/ABBRThatis/i.e./g' | sed 's/aABBRDOTABBRkABBRDOTABBRaABBRDOTABBR/a.k.a./g' | sed 's/eABBRDOTABBRgABBRDOTABBR/e.g./g'| sed 's/TWTWTWTW/_/g' | sed 's/TWTW/ /g' |  sed 's/UABBRDOTABBRSABBRDOTABBR/U.S./g' | sed 's/UABBRDOTABBRSABBRDOTABBRAABBRDOTABBR/U.S.A./g' | sed 's/UABBRDOTABBRKABBRDOTABBR/U.K./g' | sed 's/AABBRDOTABBRDABBRDOTABBR/A.D./g' |  sed 's/SrABBRDOT/Sr./g' |  sed 's/JrABBRDOT/Jr./g' | sed 's/DrABBRDOT/Dr./g' |  sed 's/MrABBRDOT/Mr./g' | sed 's/MrsABBRDOT/Mrs./g' | sed 's/MsABBRDOT/Ms./g' | sed 's/IncABBRDOT/Inc./g' | sed 's/ ABBRDOT / . /g' | sed 's/\([0-9]*\)[\@ ]*ABBRpercent/\1%/g' | sed 's/ABBRdollar /$/g' | sed 's/ABBRsharp /#/g' | sed 's/\([rR]\)sABBRDOT/\1s./g' | sed 's/\([nN]\)oABBRDOT/\1o./g' | sed 's/approxABBRDOT/approx./g' | sed 's/caABBRDOT /ca. /g' | sed 's/aABBRDOTdABBRDOT /a.d. /g'  | sed 's/bABBRDOTcABBRDOT /b.c. /g' | sed 's/mABBRDOTgABBRDOT /m.g. /g'  > hindi_sentence_tmp.dat

cat  hindi_sentence_tmp.dat |  sed -e 's/\\@//g' > hindi_sentence1.dat

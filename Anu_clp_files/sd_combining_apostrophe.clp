 (deffacts dummy_sd_com_apos_facts
 (parser_numeric_id-word)
 (parserid-word)
 (id-word)
 (rel_name-sids)
 (id-sd_cat)
 (Head-Level-Mother-Daughters)
 (Node-Category)
 )
 

 (deffunction string_to_integer (?parser_id) 
; Removes the first characterfrom the input symbol which is assumed to contain digits only from the second position onward; length should be less than 10000]
 (string-to-field (sub-string 2 10000 ?parser_id)))

 (defglobal ?*nid_wrd_fp* =  l_n_w_fp)
 (defglobal ?*l_wrd_fp* =  l_fp )
 (defglobal ?*l_rel_fp* = l_r_fp )
 (defglobal ?*l_cat_fp* = l_c_fp)

; (defrule handling_percentage
; (declare (salience 1000))
; ?f0<-(parser_numeric_id-word ?id ?word)
; ?f1<-(parser_numeric_id-word =(+  ?id 1) %)
; ?f2<-(parserid-word  ?pid ?word)
; ?f3<-(parserid-word  ?pid1  %)
; (id-word  ?wrdid  ?wrd) 
; =>
;        (bind ?wrd_wrd (string-to-field (str-cat ?word "%")))
;        (if (eq ?wrd ?wrd_wrd) then
;                (printout ?*nid_wrd_fp* "(parser_numid-word-remark  " ?id "  "?wrd  "  -)" crlf)
;                (printout ?*l_wrd_fp* "(parserid-word  "?pid "  "?wrd"  )" crlf)
;                (retract ?f0 ?f1 ?f2 ?f3)
;        )
; )
 ;-------------------------------------------------------------------------------------------------------------------
 ; These are children's books.
 ; The parents documented every step of their child's development .
 (defrule word_rule_for_poss
 (declare (salience 100))
 (rel_name-sids poss|num|conj_and|conj_or|dep ?lnode ?rnode)
 ?f1<-(id-sd_cat ?rnode ?c)
 ?f2<-(parserid-word ?rnode ?wrd)
 ?f3<-(parser_numeric_id-word ?rid ?wrd1)
 (test (= (string_to_integer ?rnode) ?rid))
 ?f4<-(parser_numeric_id-word =(+ (string_to_integer ?rnode) 1) ?word&'s|')
  =>
	(retract ?f2 ?f3 ?f4 ?f2)
        (printout ?*nid_wrd_fp*  "(parser_numid-word-remark  " ?rid "  "?wrd1 ?word "  " ?word")" crlf)
        (printout ?*l_wrd_fp* "(parserid-word  "?rnode ?word" "?wrd1 ?word ")" crlf)
        (printout ?*l_cat_fp* "(id-sd_cat  "?rnode ?word" "?c ")" crlf)
	(bind ?wrd1 (str-cat ?rnode ?word))
        (bind ?lnd (explode$ ?wrd1))
        (assert (id-Modified_id ?rnode ?lnd))
 )
 ;-------------------------------------------------------------------------------------------------------------------
 ;I read about the train accident in today's paper. 
 (defrule word_rule_4_possessive
 (declare (salience 100))
 (rel_name-sids possessive ?lnode ?rnode)
 ?f1<-(parserid-word ?lnode ?wrd)
 ?f2<-(parserid-word ?rnode ?rwrd)
 ?f3<-(parser_numeric_id-word ?lid ?wrd1)
 ?f4<-(parser_numeric_id-word ?rid  ?word&'s)
 (test (= (string_to_integer ?lnode) ?lid))
 (test (= (string_to_integer ?rnode) ?rid))
  =>
        (retract ?f2 ?f3 ?f4)
        (printout ?*nid_wrd_fp*  "(parser_numid-word-remark  " ?lid "  "?wrd1 ?word "  " ?word")" crlf)
        (printout ?*l_wrd_fp* "(parserid-word  "?lnode ?word" "?wrd1 ?word ")" crlf)
        (bind ?wrd1 (str-cat ?lnode ?word))
        (bind ?lnd (explode$ ?wrd1))
        (assert (id-Modified_id ?lnode ?lnd))
 )
 ;-------------------------------------------------------------------------------------------------------------------
 (defrule word_rule
 (declare (salience 50))
 (parserid-word  ?pid ?word)
 ?f1<-(id-sd_cat ?pid ?cat)
 ?f0<-(parser_numeric_id-word ?id ?word)
 (test (eq (string_to_integer ?pid) ?id));Added by Roja(17-03-11) Without this condition we get repeated parserid-word facts.
 ;Ex: As the 1970's arrived, the country was emerging from the Kennedy and Martin Luther King assassinations and from the nightmare of Viet Nam and a decade of "everything goes" and if "it feels good, do it, culture. 
 =>
        (printout ?*nid_wrd_fp* "(parser_numid-word-remark  " ?id "  "?word "  -)" crlf)
        (printout ?*l_wrd_fp* "(parserid-word  "?pid "  "?word ")" crlf)
	(printout ?*l_cat_fp* "(id-sd_cat  "?pid "  "?cat ")" crlf)
 )
 ;-------------------------------------------------------------------------------------------------------------------
 ; The parents documented every step of their child's development .
 ; The Big Board's Mr. Grasso said, "Our systemic performance was good."
 (defrule rel_lnode
 (declare (salience 91))
 ?f0<-(rel_name-sids ?lname ?lnode ?rnode)
 (id-Modified_id ?lnode ?lnd)
 (not (modified_lid ?lname))
 =>
       (retract ?f0)
        (assert (modified_rel_name-lnode-rnode ?lname ?lnd ?rnode))
        (assert (modified_lid ?lname))
 )
 ;------------------------------------------------------------------------------------------------------------------- 
 ;These are children's books.
 (defrule rel_rnode
 (declare (salience 91))
 ?f0<-(rel_name-sids ?lname ?lnode ?rnode)
 (id-Modified_id ?rnode ?rnd)
 =>
        (retract ?f0)
        (assert (modified_rel_name-lnode-rnode ?lname ?lnode ?rnd))
 )
 ;-------------------------------------------------------------------------------------------------------------------
 (defrule rel2
 (declare (salience 52))
 ?f0<-(modified_rel_name-lnode-rnode ?lname ?lnode ?rnode)
 =>
        (retract ?f0)
        (printout ?*l_rel_fp* "(rel_name-sids  " ?lname "   "?lnode "  "?rnode")" crlf)
 )
 ;-------------------------------------------------------------------------------------------------------------------
 (defrule rel3
 (declare (salience 30))
 ?f0<-(rel_name-sids ?lname ?lnode ?rnode)
  =>
        (retract ?f0)
        (printout ?*l_rel_fp* "(rel_name-sids  " ?lname "   "?lnode "  "?rnode")" crlf)
 )
 ;-------------------------------------------------------------------------------------------------------------------
 ; Added by shirisha Manju (26-01-12)
 ;"We have been very disappointed in the performance of natural gas prices," said Mr. Cox, Phillips's president.
 ; During the 'state of siege', political opponents were imprisoned (and many of them 'disappeared'), censorship was systematic and all non-government political activity banned.
 ; If first punct is COMMA then retract the fact else substitute daut of P in Mot fact
 (defrule get_left_right_punc1
 (declare (salience 5))
 ?f<-(Head-Level-Mother-Daughters ?h ?lvl ?Mot $?pre ?PUNC ?head ?P ?PUNC1 $?post)
 (Node-Category ?PUNC    ?p&P_DQT|P_SQT|P_LB)
 (Node-Category ?P       ?p2&P_COM|FRAG)
 (Node-Category ?PUNC1   ?p1&P_DQT|P_SQT|P_RB)
 ?f1<-(Head-Level-Mother-Daughters ?h1 ?lvl1 ?PUNC ?child)
 ?f2<-(Head-Level-Mother-Daughters ?h2 ?lvl2 ?PUNC1 ?child1)
 ?f3<-(Head-Level-Mother-Daughters ?h3 ? ?P $?d ?d1)
  =>
        (retract ?f ?f1 ?f2 ?f3)
        (assert (mother-punct_head-left_punctuation ?head ?PUNC ?h1))
	(if (eq ?p2 FRAG) then
		(assert (Head-Level-Mother-Daughters ?h ?lvl ?Mot $?pre ?head $?d ?d1 $?post))
		(assert (mother-punct_head-right_punctuation ?d1 ?PUNC1 ?h2))
	else
		(assert (Head-Level-Mother-Daughters ?h ?lvl ?Mot $?pre ?head $?post))
		(assert (mother-punct_head-punctuation ?head ?P ?h3))
		(assert (mother-punct_head-right_punctuation ?head ?PUNC1 ?h2))
	)
 )
 ;-------------------------------------------------------------------------------------------------------------------
 ;He said such results should be "measurable in dollars and cents" in reducing the U.S. trade deficit with Japan. 
 ;Allahabad is also known for its annual magh mela (mini kumbh mela) and colorful dussehra festival. 
 ; Added by shirisha Manju
 (defrule get_left_right_punc
 (declare (salience 4))
 ?f<-(Head-Level-Mother-Daughters ?h ?lvl ?Mot $?pre ?PUNC ?head  ?PUNC1 $?post)
 (Node-Category ?PUNC    ?p&P_DQT|P_SQT|P_LB|P_DSH)
 (Node-Category ?PUNC1   ?p1&P_DQT|P_SQT|P_RB|P_DSH)
 ?f1<-(Head-Level-Mother-Daughters ?h1 ?lvl1 ?PUNC ?child)
 ?f2<-(Head-Level-Mother-Daughters ?h2 ?lvl2 ?PUNC1 ?child1)
  =>
        (retract ?f ?f1 ?f2)
        (assert (mother-punct_head-left_punctuation ?head ?PUNC ?h1))
        (assert (mother-punct_head-right_punctuation ?head ?PUNC1 ?h2))
        (assert (Head-Level-Mother-Daughters ?h ?lvl ?Mot $?pre ?head $?post))
 )
 ;-------------------------------------------------------------------------------------------------------------------
 ; Added by shirisha Manju (08-02-12)
 ;Revenue totaled $5 million. 
 (defrule get_left_punc
 (declare (salience 3))
 ?f<-(Head-Level-Mother-Daughters ?h ?lvl ?Mot $?pre ?PUNC ?head $?post)
 (Node-Category ?PUNC    ?p&P_DQT|P_SQT|P_LB|P_DOL|P_DSH)
 ?f1<-(Head-Level-Mother-Daughters ?h1 ?lvl1 ?PUNC ?child)
 =>
	(retract ?f ?f1)
	(assert (mother-punct_head-left_punctuation ?head ?PUNC ?h1))
	(assert (Head-Level-Mother-Daughters ?h ?lvl ?Mot $?pre ?head $?post))
 )
 ;-------------------------------------------------------------------------------------------------------------------
 (defrule map_cons
 ?f<-(Head-Level-Mother-Daughters ?pos1 ?lvl ?Mot $?pre ?NN ?POS $?post)
 ?f1<-(Head-Level-Mother-Daughters ?h ?lvl1 ?NN ?noun)
 ?f2<-(Head-Level-Mother-Daughters ?pos&'s|' ?lvl1 ?POS ?child)
 (Node-Category	?POS	POS|NNS|NN|CD|NNP)
  =>
  	(retract ?f ?f1 ?f2)
  	(assert (Head-Level-Mother-Daughters ?pos1 ?lvl ?Mot $?pre ?NN $?post))
        (bind ?noun (explode$ (str-cat ?noun ?pos)))
        (assert (Head-Level-Mother-Daughters ?h ?lvl1 ?NN ?noun))
 )
 ;-------------------------------------------------------------------------------------------------------------------
 (defrule map_cons1
 (declare (salience 1))
 ?f<-(Head-Level-Mother-Daughters ?h ?lvl ?Mot $?pre ?head ?PUNC $?post)
 (Node-Category ?PUNC    ?p&P_COM|P_DOT|P_QES|P_DQ|P_DQT|P_SEM|P_LB|P_RB|P_SQT|P_CLN|P_DSH|P_EXM|P_DOL)
 ?f1<-(Head-Level-Mother-Daughters ?h2 ?lvl1 ?PUNC ?child)
 (not (Node-Category ?head P_COM));"But we would not go into them alone," and Canadian Utilities equity stake would be small, he said.
  =>
        (retract ?f ?f1)
	(assert (mother-punct_head-punctuation ?head ?PUNC ?h2))
        (assert (Head-Level-Mother-Daughters ?h ?lvl ?Mot $?pre ?head $?post))
 )
 ;-------------------------------------------------------------------------------------------------------------------
 ; Added by shirisha Manju
 ;"But we would not go into them alone," and Canadian Utilities equity stake would be small, he said. 
 (defrule map_cons2
 (declare (salience 2))
 ?f<-(Head-Level-Mother-Daughters ?h ?lvl ?Mot $?pre ?PUNC $?post)
 (Node-Category ?PUNC    P_DQT)
 ?f1<-(Head-Level-Mother-Daughters ?h2 ?lvl1 ?PUNC P1)
  =>
        (retract ?f ?f1)
        (assert (mother-punct_head-left_punctuation ?Mot ?PUNC ?h2))
        (assert (Head-Level-Mother-Daughters ?h ?lvl ?Mot $?pre $?post))
 )
 ;-------------------------------------------------------------------------------------------------------------------
 ; Added by shirisha Manju
 ; Allahabad is also known for its annual magh mela (mini kumbh mela) and colorful dussehra festival. 
 (defrule map_cons3
 ?f<-(Head-Level-Mother-Daughters ?h ?lvl ?Mot $?pre ?PUNC $?post)
 (Node-Category ?PUNC   ?p&P_COM|P_DOT|P_QES|P_DQ|P_DQT|P_SEM|P_LB|P_RB|P_SQT|P_CLN|P_DSH|P_EXM|P_DOL)
 ?f1<-(Head-Level-Mother-Daughters ?h2 ?lvl1 ?PUNC ?)
  =>
        (retract ?f ?f1)
        (assert (mother-punct_head-punctuation ?Mot ?PUNC ?h2))
        (assert (Head-Level-Mother-Daughters ?h ?lvl ?Mot $?pre $?post))
 )
 ;-------------------------------------------------------------------------------------------------------------------
 (defrule end
 (declare (salience -50))
 =>
        (close ?*nid_wrd_fp*)
	(close ?*l_wrd_fp*)
	(close  ?*l_rel_fp*)
	(close ?*l_cat_fp*)
 )
 ;-------------------------------------------------------------------------------------------------------------------

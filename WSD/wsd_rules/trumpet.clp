
(defrule trumpet0
(declare (salience 5000))
(id-root ?id trumpet)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id noun)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id wurahI))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  trumpet.clp 	trumpet0   "  ?id "  wurahI )" crlf))
)

;"trumpet","N","1.wurahI"
;He is  playing the trumpet.
;The open flower of the daffodils look like the trumpet .
;
(defrule trumpet1
(declare (salience 4900))
(id-root ?id trumpet)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id verb)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id wurahI_bajA))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  trumpet.clp 	trumpet1   "  ?id "  wurahI_bajA )" crlf))
)

;"trumpet","VT","1.wurahI_bajAnA"
;The guard trumpetted the arrival of the king.
;--"2.ciMGAdZanA"
;The elephant trumpetted in the forest.
;

;@@@ Added by Prachi Rathore
;As soon as night fell, the elephant trumpeted. [gyan-nidhi]
;रात होते ही हाथी ने सूँड ऊपर उठाकर एक चिंघाड़ मारी।
(defrule trumpet2
(declare (salience 5000))
(id-root ?id trumpet)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id verb)
(kriyA-subject  ?id ?id1)
(id-root ?id1 elephant)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id ciMGAdZa_mAra))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  trumpet.clp 	trumpet2   "  ?id "  ciMGAdZa_mAra )" crlf))
)

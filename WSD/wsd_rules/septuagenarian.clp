
(defrule septuagenarian0
(declare (salience 5000))
(id-root ?id septuagenarian)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id adjective)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id sapwawi-varRIya))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  septuagenarian.clp 	septuagenarian0   "  ?id "  sapwawi-varRIya )" crlf))
)

;"septuagenarian","Adj","1.sapwawi-varRIya"
;Ram is septuagenarian. 
;
(defrule septuagenarian1
(declare (salience 4900))
(id-root ?id septuagenarian)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id noun)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id sapwawi-varRIya))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  septuagenarian.clp 	septuagenarian1   "  ?id "  sapwawi-varRIya )" crlf))
)

;"septuagenarian","N","1.sapwawi-varRIya"
;Ram is septuagenarian. 
;

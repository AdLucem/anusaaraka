;Added by Meena(27.5.11)
;The Big Board's Mr. Grasso said, "Our systemic performance was good." 
(defrule systemic0
(declare (salience 5000))
(id-root ?id systemic)
?mng <-(meaning_to_be_decided ?id)
(viSeRya-viSeRaNa  ?id1 ?id)
(id-root ?id1 disease|chemical|drug|performance|weedkiller|disease|poison|problem|change) 
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id sistama_saMbanXI))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  systemic.clp       systemic0   "  ?id "  sistama_saMbanXI )" crlf))
)


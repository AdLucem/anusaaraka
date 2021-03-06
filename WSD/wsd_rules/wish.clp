
(defrule wish0
(declare (salience 5000))
(id-root ?id wish)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id noun)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id icCA))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  wish.clp 	wish0   "  ?id "  icCA )" crlf))
)

;"wish","N","1.icCA"
;Her wish was to serve the needy.
;--"2.ASIrvAxa_xenA"
;I sent my new year wish to my daughter.
;
(defrule wish1
(declare (salience 100))
(id-root ?id wish)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id verb)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id icCA_kara))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  wish.clp 	wish1   "  ?id "  icCA_kara )" crlf))
)

;default_sense && category=verb	icCA_honA[karanA]	0
;"wish","VTI","1.icCA_honA[karanA]"
;I wished to be a doctor.
;--"2.SuBakAmanA_karanA"
;I wish you success.
;

;@@@ Added by Pramila(BU) on 20-02-2014
;I do not wish to diminish the importance of their contribution.
;मैं उनके योगदान का महत्व कम नहीं करना चाहता हूँ .
(defrule wish2
(declare (salience 4900))
(id-root ?id wish)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id verb)
(kriyA-kriyArWa_kriyA  ?id ?id1)
(kriyA-object  ?id1 ?id2)
(viSeRya-of_saMbanXI  ?id2 ?id3)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id cAha))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  wish.clp 	wish2   "  ?id "  cAha )" crlf))
)

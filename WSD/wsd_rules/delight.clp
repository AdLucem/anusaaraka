
(defrule delight0
(declare (salience 5000))
(id-root ?id delight)
?mng <-(meaning_to_be_decided ?id)
(id-word ?id delighted )
(id-cat_coarse ?id adjective)
=>
(retract ?mng)
(assert (id-wsd_word_mng ?id Ananxiwa))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_word_mng  " ?*wsd_dir* "  delight.clp  	delight0   "  ?id "  Ananxiwa )" crlf))
)

(defrule delight1
(declare (salience 4900))
(id-root ?id delight)
?mng <-(meaning_to_be_decided ?id)
(id-word ?id delighted )
(id-cat_coarse ?id adjective)
=>
(retract ?mng)
(assert (id-wsd_word_mng ?id Ananxiwa))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_word_mng  " ?*wsd_dir* "  delight.clp  	delight1   "  ?id "  Ananxiwa )" crlf))
)

;"delighted","Adj","1.Ananxiwa"
;Her delighted smile made him forget all his sorrows.
;
;
(defrule delight2
(declare (salience 4800))
(id-root ?id delight)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id noun)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id KuSI))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  delight.clp 	delight2   "  ?id "  KuSI )" crlf))
)

;"delight","N","1.KuSI"
;His delight to see her was obvious to all.
;To our delight the show started on time.
;
(defrule delight3
(declare (salience 4000))
(id-root ?id delight)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id verb)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id KuSa_ho))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  delight.clp 	delight3   "  ?id "  KuSa_ho )" crlf))
)

;"delight","V","1.KuSa_honA"
;The people of the village were delighted at the arrival of the leader.
;His skillful batting delighted his fans.
;usakI kuSala bEtiMga ne usake praSaMsakoM ko Ananxiwa kiyA.
;

;@@@ Added by Pramila(Banasthali University) on 27-01-2014
;His elevate to the higher rank delighted me.    ;shiksharthi
;ऊँचे दर्जे पर उसकी तरक्की से मुझे प्रसन्नता हुई.
(defrule delight4
(declare (salience 4700))
(id-root ?id delight)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id verb)
(kriyA-subject  ?id ?id2)
(viSeRya-to_saMbanXI  ?id2 ?)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id prasannawA_ho))
(assert (kriyA_id-subject_viBakwi ?id se))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  delight.clp 	delight4   "  ?id "  prasannawA_ho )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-kriyA_id-subject_viBakwi   " ?*wsd_dir* "  delight.clp      delight4   "  ?id " se )" crlf))
)



;This idea is foundation of all economics.	---old
;yaha vicAra saBI arWaSAswroM kA AXAra hE.
;These stories have no foundation.	---oald
;ina kahAniyoM kA koI AXAra nahIM hE.
;Added by Pramila (banasthali university)
(defrule foundation0
(declare (salience 4900))
(id-root ?id foundation)
?mng <-(meaning_to_be_decided ?id)
(or(and(subject-subject_samAnAXikaraNa  ?id2 ?id)(viSeRya-of_saMbanXI  ?id ?id1))(id-root ?id1 story))
(id-cat_coarse ?id noun)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id AXAra))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  foundation.clp 	foundation0   "  ?id "  AXAra )" crlf))
)

;Added by Pramila (banasthali university)
;To get financial support for your research you can apply to various research foundations.          ;hinkhoj
;apane anusaMXAna ke liye ArWika sahAyawA lene ke liye wuma viBinna anusaMXAna saMsWaoM meM Avexana kara sakawe ho.

;They established a foundation to help orphaned children.                    ;m-w
;unhone anAWa baccoM kI sahAyawA ke liye eka saMsWA sWApiwa kI.
(defrule foundation1
(declare (salience 4950))
(id-root ?id foundation)
?mng <-(meaning_to_be_decided ?id)
(or(and(samAsa_viSeRya-samAsa_viSeRaNa  ?id ?id2)(kriyA-to_saMbanXI  ?id1 ?id))(saMjFA-to_kqxanwa  ?id ?id1))
(id-cat_coarse ?id noun)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id saMsWA))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  foundation.clp       foundation1   "  ?id "  saMsWA )" crlf))
)

;Added by Pramila (banasthali university)
;The foundation of a library in the town helped many a students.                          ;hinkhoj
;Sahara meM puswakAlaya ki sWApanA se bahuwa CAwroM ko sahAyawA milI.
(defrule foundation2
(declare (salience 4950))
(id-root ?id foundation)
?mng <-(meaning_to_be_decided ?id)
(viSeRya-of_saMbanXI  ?id ?id1)
(viSeRya-in_saMbanXI  ?id1 ?id2)
(id-cat_coarse ?id noun)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id sWApanA))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  foundation.clp       foundation2   "  ?id "  sWApanA )" crlf))
)

;Added by Pramila (banasthali university)
;The book explains the moral foundations on which her political career was built.              ;m-w
;kiwAba nEwika sixXAnwoM kA varNana karawI hE jina para usakA rAjanIwika kEriyara banA huA hE.
(defrule foundation3
(declare (salience 4950))
(id-root ?id foundation)
?mng <-(meaning_to_be_decided ?id)
(viSeRya-jo_samAnAXikaraNa  ?id ?id1)
(id-cat_coarse ?id noun)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id sixXAnwa))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  foundation.clp       foundation3   "  ?id "  sixXAnwa )" crlf))
)

;Added by Pramila (banasthali university)
;These allegations are completely without foundation.   ;cald
;ye Aropa pUrI waraha se binA buniyAxa ke hE.
(defrule foundation4
(declare (salience 5000))
(id-root ?id foundation)
?mng <-(meaning_to_be_decided ?id)
(kriyA-subject  ?id1 ?id2)
(kriyA-without_saMbanXI  ?id1 ?id)
(id-cat_coarse ?id noun)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id buniyAxa))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  foundation.clp 	foundation4   "  ?id "  buniyAxa )" crlf))
)

;-------------------------------- Default rules ----------------------------------
;Modified by Pramila : Removed the fact  => (id-word ?id1 house|plot|factory)
;The foundations of the house are being laid today.
;Aja Gara kI nIMva raKI jA rahI hE.
;The science of electricity and magnetism is the foundation for the modern technological civilisation.   ;physics
;विद्युत एवं चुम्बकत्व का विज्ञान आधुनिक प्रौद्योगिक सभ्यता की नींव है .
(defrule foundation5
(declare (salience 4000))
(id-root ?id foundation)
?mng <-(meaning_to_be_decided ?id)    
(id-cat_coarse ?id noun)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id nIMva))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  foundation.clp 	foundation5   "  ?id "  nIMva )" crlf))
)


(defrule foundation6
(declare (salience 3000))
(id-root ?id foundation)
?mng <-(meaning_to_be_decided ?id)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id nIMva))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  foundation.clp 	foundation6   "  ?id "  nIMva )" crlf))
)

;****************************** Removed rules *********************************
;1. foundation_noun       nIMva
;   (viSeRya-viSeRaNa ?id1 ?id) 
;   (id-word ?id1 glorious)

;2. foundation_noun       mUla_vicAra

;****************************** Examples *************************************
;default_sense && category=noun	AXAra	0
;"foundation","N","1.AXAra"
;The foundation of the building was layed way back in 1997.
;--"2.sWApanA
;The foundation of a library in the town helpe dmany a students.
;--"3.saMsWA
;To get financial support for your research you can apply to various 
;research foundations.
;
;****************************************************************************

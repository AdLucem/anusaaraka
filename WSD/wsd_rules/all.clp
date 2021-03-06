
;Added by Meena(11.8.11)
;She is all for it.
(defrule all00
(declare (salience 5000))
(id-root ?id all)
?mng <-(meaning_to_be_decided ?id)
(viSeRya-for_saMbanXI  ?id ?saMb)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id pUrI_waraha_se))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  all.clp       all00   "  ?id "  pUrI_waraha_se )" crlf))
)

;$$$ Modified by Shirisha Manju Suggested by Chaitanya Sir (11-12-13) added they|you|us|them|we in the list and
; used root fact insteadof word fact.
(defrule all0
(declare (salience 4000))
(id-root ?id all)
?mng <-(meaning_to_be_decided ?id)
(id-root =(- ?id 1) be|they|you|us|them|we)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id saba))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  all.clp 	all0   "  ?id "  saba )" crlf))
)

(defrule all1
(declare (salience 4900))
(id-root ?id all)
?mng <-(meaning_to_be_decided ?id)
(id-word =(+ ?id 1) through)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id pUre))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  all.clp 	all1   "  ?id "  pUre )" crlf))
)

;We enjoyed a lot all through the conference.
(defrule all2
(declare (salience 4700));salience reduced by Garima Singh
(id-root ?id all)
?mng <-(meaning_to_be_decided ?id)
(id-word =(+ ?id 1) the)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id saBI))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  all.clp 	all2   "  ?id "  saBI )" crlf))
)


;$$$ modified by Garima Singh(M.Tech-C.S, Banasthali Vidyapith) 02-jan-2014
;Removed (+ ?id 1) as day and  Added viSeRya-det_viSeRaNa and viSeRya as day|night  
;They have been dashing all the day.[shiksharthi Kosh]
;वे पूरा दिन भागते दौड़ते रहे
; In all the following examples, Bara has been replaced by pUrA, since Bara 
; needs to be moved, whereas pUrA behaves as an adjective.
(defrule all3
(declare (salience 4700))
(id-root ?id all)
?mng <-(meaning_to_be_decided ?id)
(viSeRya-det_viSeRaNa  ?id1 ?id)
(id-word ?id1 day|night)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id pUrA))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  all.clp 	all3   "  ?id "  pUrA )" crlf))
)

(defrule all4
(declare (salience 4600))
(id-root ?id all)
?mng <-(meaning_to_be_decided ?id)
(id-word =(+ ?id 1) morning)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id pUrI))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  all.clp 	all4   "  ?id "  pUrI )" crlf))
)

(defrule all5
(declare (salience 4500))
(id-root ?id all)
?mng <-(meaning_to_be_decided ?id)
(id-word =(+ ?id 1) night)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id pUrI))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  all.clp 	all5   "  ?id "  pUrI )" crlf))
)

(defrule all6
(declare (salience 4400))
(id-root ?id all)
?mng <-(meaning_to_be_decided ?id)
(id-word =(+ ?id 1) week)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id pUrA))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  all.clp 	all6   "  ?id "  pUrA )" crlf))
)

;$$$ Modified by Garima Singh(M.Tech-C.S, Banasthali Vidyapith) 25-jan-2014
;She was a champion of the poor all her life. [oald]
;वह जीवन भर गरीबों के हित के लिये लड़ती रही
;removed '?id +1 my' and '?id +2 life' facts
(defrule all7
(declare (salience 4300))
(id-root ?id all)
?mng <-(meaning_to_be_decided ?id)
(viSeRya-det_viSeRaNa  ?id1 ?id) ; added by  Garima 25-jan-2014
(viSeRya-RaRTI_viSeRaNa  ?id1 ?id2); added by  Garima 25-jan-2014
(id-word ?id1 life)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id Bara))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  all.clp 	all7   "  ?id "  Bara )" crlf))
)

;You've had all the fun && I've had all the hard work.
(defrule all8
(declare (salience 4200))
(id-root ?id all)
?mng <-(meaning_to_be_decided ?id)
(niReXAwmaka_vAkya      )
(id-word =(+ ?id 1) that )
(id-cat_coarse =(+ ?id 2) adjective)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  all.clp 	all8   "  ?id "  - )" crlf))
)

;She is not all that good. (that  uwanA; all  0)
;She does not sing all all that well. (that  uwanA; all  0)
(defrule all9
(declare (salience 4100))
(id-root ?id all)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) fell)
(id-word =(+ ?id 1) in)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id WakAna))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  all.clp 	all9   "  ?id "  WakAna )" crlf))
)

;She felt all in.
;Usane mahasUsa kiyA WakAna
(defrule all10
(declare (salience 4000))
(id-root ?id all)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse =(+ ?id 1) preposition)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id pUrA))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  all.clp 	all10   "  ?id "  pUrA )" crlf))
)

;He has eaten all of it.
(defrule all11
(declare (salience 3900))
(id-root ?id all)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id adjective)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id saba))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  all.clp 	all11   "  ?id "  saba )" crlf))
)

;"all","Adj","1.saba"
;--"2.sArA"
;We sat up all night.
;
(defrule all12
(declare (salience 3800))
(id-root ?id all)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id adverb)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id pUrNa_rupa_se))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  all.clp 	all12   "  ?id "  pUrNa_rupa_se )" crlf))
)

;"all","Adv","1.pUrNa_rupa_se"
;She lives all alone.
;
(defrule all13
(declare (salience 3700))
(id-root ?id all)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id noun)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id sabakuCa))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  all.clp 	all13   "  ?id "  sabakuCa )" crlf))
)

;"all","N","1.sabakuCa"
;They gave their all in the war.
;
;LEVEL 
;Headword : all
;
;Examples --
;
;"all","adj","1.sArA " <--saba
;We sat up all night.
;hama loga sArI rAwa bETe rahe
;
;"all","Adv","1.pUrNa rupa se" <---hara waraha se <---bilkula <---saba_waraha_se <-saba
;She lives all alone.
;vaha pUrNa rUpa se akelI rahawI hE
;
;"all","N","1.sabakuCa"<--sarvasva<--saba
;They gave their all in the war.
;unhone apanA sabakuCa yuXxa meM xe xiyA
;
;                                                  
;nota:--uparyukwa'all'ke saBI saMjFA, viSeRaNa,Ora kriyA viSeRaNa,ke vAkyoM ko xeKane 
;      ke uparAnwa,yaha niRkarRa nikAla sakawe hEM ki isa Sabxa kA mUla arWa,'saba'
;     Ora'pUrNawayA se liyA jA sakawA hE awaH isakA sUwra nimna prakAra liKa sakawe  
;      hEM   
;
;sUwra : saba`
;
;
;
;
;
;
;
;
;
;
;

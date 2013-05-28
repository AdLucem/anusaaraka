;This file added by Roja (03-05-13) Suggested by Chaitanya Sir
;When category is adjective loading with original word and word
;If file not loaded then checking in default dictionary

; Load user original word file
 (defrule load_user_org_word_file1
 (declare (salience 7495))
 (id-original_word ?id ?word)
 (id-cat_coarse ?id adjective)
 (not (meaning_has_been_decided ?id))
 (not (file_loaded ?id))
 (not (not_SandBox)) ;Added for server purpose. (Suggested by Chaitanya Sir, Added by Roja(05-03-11))
 =>
        (bind ?file (str-cat ?*provisional_wsd_path* "/" ?word ".clp"))
        (if (neq (load* ?file) FALSE) then
            (assert (file_loaded ?id))
       )
 )
 ;---------------------------------------------------------------------------------------------------------
 ; Load user word file
 (defrule load_user_word_file1
 (declare (salience 7480))
 (id-word ?id ?word)
 (id-cat_coarse ?id adjective)
 (not (meaning_has_been_decided ?id))
 (not (file_loaded ?id))
 (not (not_SandBox)) ;Added for server purpose. (Suggested by Chaitanya Sir, Added by Roja(05-03-11))
 =>
        (bind ?file (str-cat ?*provisional_wsd_path* "/" ?word ".clp"))
        (if (neq (load* ?file) FALSE) then
            (assert (file_loaded ?id))
       )
 )
 ;---------------------------------------------------------------------------------------------------------
 ;Loads system original word file 
 (defrule load_org_word_file1
 (declare (salience 7450))
 (id-original_word ?id ?word)
 (id-cat_coarse ?id adjective)
 (not (meaning_has_been_decided ?id))
 (not (file_loaded ?id))
 =>
        (bind ?file (str-cat ?*path* "/WSD/wsd_rules/canonical_form_wsd_rules/" ?word ".clp"))
        (if (neq (load* ?file) FALSE) then
            (assert (file_loaded ?id))
       )
 )
 ;---------------------------------------------------------------------------------------------------------
 ; Load system word file
 (defrule load_word_file1
 (declare (salience 7400))
 (id-word ?id ?word)
 (id-cat_coarse ?id adjective)
 (not (meaning_has_been_decided ?id))
 (not (file_loaded ?id))
 =>
        (bind ?file (str-cat ?*path* "/WSD/wsd_rules/canonical_form_wsd_rules/" ?word ".clp"))
        (if (neq (load* ?file) FALSE) then
                (assert (file_loaded ?id))
        )
 )
 ;---------------------------------------------------------------------------------------------------------
 ; Added by Roja (03-05-13)
 ; Lookup original word in dictionary (only for adjective case)
 ; He saw the broken window. 
 (defrule load_dic_org_word_file
 (declare (salience 7300))
 (id-original_word ?id ?org_wrd)
 (id-cat_coarse ?id adjective)
 (test (neq (gdbm_lookup "default-iit-bombay-shabdanjali-dic.gdbm" (str-cat ?org_wrd "_" adjective)) "FALSE"))
 (not (meaning_has_been_decided ?id))
 (not (file_loaded ?id))
 =>
	(bind ?a (gdbm_lookup "default-iit-bombay-shabdanjali-dic.gdbm" (str-cat ?org_wrd "_" adjective)))
        (if (neq ?a "FALSE") then
           (if (neq (str-index "/" ?a) FALSE) then
		(bind ?h_mng (string-to-field (sub-string  1 (- (str-index "/" ?a) 1) ?a)))
                (assert (id-wsd_root_mng ?id ?h_mng))
                (assert (meaning_has_been_decided ?id))
                (assert (file_loaded ?id))
		(printout t "Multiple adjective senses are available for "?org_wrd ". WSD rule is required " crlf)
            else
                (bind ?h_mng  (string-to-field ?a))
		(assert (id-wsd_root_mng ?id ?h_mng))
        	(assert (file_loaded ?id))
		(assert (meaning_has_been_decided ?id))
           )
       )
 )
 ;---------------------------------------------------------------------------------------------------------
 ; Added by Roja (03-05-13)
 ; Load word in dictionary (only for adjective case)
 ; Broken windows need to be replaced. 
 (defrule load_dic_word_file
 (declare (salience 7200))
 (id-word ?id ?wrd)
 (id-cat_coarse ?id adjective)
 (test (neq (gdbm_lookup "default-iit-bombay-shabdanjali-dic.gdbm" (str-cat ?wrd "_" adjective)) "FALSE"))
 (not (meaning_has_been_decided ?id))
 (not (file_loaded ?id))
 =>
        (bind ?a (gdbm_lookup "default-iit-bombay-shabdanjali-dic.gdbm" (str-cat ?wrd "_" adjective)))
        (if (neq ?a "FALSE") then
           (if (neq (str-index "/" ?a) FALSE) then
                (bind ?h_mng (string-to-field (sub-string  1 (- (str-index "/" ?a) 1) ?a)))
		(assert (id-wsd_root_mng ?id ?h_mng))
		(assert (meaning_has_been_decided ?id))
		(assert (file_loaded ?id))
		(printout t "Multiple adjective senses are available for "?wrd ". WSD rule is required " crlf)
            else
                (bind ?h_mng  (string-to-field ?a))
		(assert (id-wsd_root_mng ?id ?h_mng))
		(assert (meaning_has_been_decided ?id))
	        (assert (file_loaded ?id))
           )
       )
 )
 ;---------------------------------------------------------------------------------------------------------
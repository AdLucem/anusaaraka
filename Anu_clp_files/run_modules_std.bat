 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/word_without_adverb.bclp"))
 (bload ?*path*)
 (load-facts "original_word.dat")
 (assert (Current_id 1))
 (open "word_info_w_adv.dat" rm_advp_fp "a")
 (run)
 (close rm_advp_fp)
 (clear)
 ;--------------------------------------------------------------------------------
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/sd_combining_apostrophe.clp"))
 (load ?*path*)
 (load-facts "sd_numeric_word_tmp.dat")
 (load-facts "sd_word_tmp.dat")
 (load-facts "sd-relations_tmp.dat")
 (open "sd_word.dat" l_fp "a")
 (open "sd_numeric_word.dat" l_n_w_fp "a")
 (open "sd-relations_tmp1.dat" l_r_fp "a")
 (run)
 (clear)
 ;--------------------------------------------------------------------------------
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/parserid_wordid_mapping.clp"))
 (load ?*path*)
 (load-facts "sd_numeric_word.dat")
 (load-facts "original_word.dat")
 (open "parserid_wordid_mapping.dat" link_word_fp "a")
 (run)
 (clear)
 ;--------------------------------------------------------------------------------
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/lwgid_wordid_mapping.bclp"))
 (bload ?*path*)
 (load-facts "original_word.dat")
 (load-facts "word_info_w_adv.dat")
 (open "lwgid_wordid_mapping.dat" lid_wrdid_fp "a")
 (run)
 (close lid_wrdid_fp)
 (clear)
 ;-------------------------------------------------------------------------------- 
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/sd_category.clp"))
 (load ?*path*)
 (load-facts "sd_category.dat")
 (open "sd_category_info.dat" cat_fp "a")
 (run)
 (clear)
 ;---------------------------------------------------------------------------------
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/sd_cat_rule.clp"))
 (load ?*path*)
 (load-facts "pos_cat.dat")
 (load-facts "sd_category_info.dat")
 (load-facts "parserid_wordid_mapping.dat")
 (open "parser_pos_cat.dat" cat_fp1 "a")
 (run)
 (clear)
 ;-----------------------------------------------------------------------------------
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/root_rule.bclp"))
 (bload ?*path*)
 (load-facts "parser_pos_cat.dat")
 (load-facts "morph.dat")
 (load-facts "original_word.dat")
 (load-facts "morph_root_tobe_choosen.dat")
 (load-facts "parserid_wordid_mapping.dat")
 (open "root_tmp.dat" rt_fp "a")
 (open "preferred_morph_tmp.dat" pre_fp "a")
 (run)
 (clear)
 ;-----------------------------------------------------------------------------------
 (load "global_path.clp")
 (defglobal ?*path1* = ?*path*)
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/load_lwg_rules.clp"))
 (batch* ?*path*)
 (assert (run_sd_parser_lwg_rules))
 (assert (run_old_lwg_rules))
 (run)
 (clear)
 ;-----------------------------------------------------------------------------------
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/sd_relation_rules.clp"))
 (batch* ?*path*)
 (load-facts "sd-relations_tmp1.dat")
 (load-facts "sd_word.dat")
 (load-facts "lwg_info_tmp.dat")
 (load-facts "parserid_wordid_mapping.dat")
 (load-facts "parser_pos_cat.dat")
 (run)
 (clear)
 ;-----------------------------------------------------------------------------------
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/lwg_consistency_check.bclp"))
 (bload ?*path*)
 (load-facts "lwg_info_tmp.dat")
 (load-facts "word.dat")
 (load-facts "parserid_wordid_mapping.dat")
 (open "lwg_differences.dat" lwg_diff_fp "a")
 (open "revised_lwg_info.dat" revised_lwg_fp "a")
 (run)
 (clear)
 ;-------------------------------------------------------------------------------------
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/root_consistency_check.clp"))
 (load ?*path*)
 (load-facts "original_word.dat")
 (load-facts "morph.dat")
 (load-facts "parser_pos_cat.dat")
 (load-facts "root_tmp.dat")
 (load-facts "parserid_wordid_mapping.dat")
 (open "root_consistency_check_tmp.dat" root_cons_tmp_fp "a")
 (run)
 (clear)
 ;-------------------------------------------------------------------------------------
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/parser_id_mapping.bclp"))
 (bload ?*path*)
 (load-facts "root_consistency_check_tmp.dat")
 (load-facts "revised_lwg_info.dat")
 (load-facts "word.dat")
 (load-facts "original_word.dat")
 (load-facts "preferred_morph_tmp.dat")
 (load-facts "sd-relations_tmp1.dat")
 (load-facts "relations_tmp.dat")
 (load-facts "parser_pos_cat.dat")
 (load-facts "parserid_wordid_mapping.dat")
 (open "root.dat" root_fp "a")
 (open "preferred_morph.dat" pre_morph_fp "a")
 (open "lwg_info.dat" lwg_fp "a")
 (open "relations.dat" file "a")
 (open "relations_tmp1.dat" file1 "a")
 (open "sd-relations.dat" sd_rel_fp "a")
 (open "cat_consistency_check.dat" cat_cons_fp "a")
 (run)
 (clear)
 ;~~~~~~~~~~~~~~~~~~~~WSD MODULE ~~~~~~~~~~~~~~~~~~~~~~~~~~
(defmodule MAIN (export ?ALL)
                 (export deftemplate ?ALL))
 (deftemplate word-morph(slot original_word)(slot morph_word)(slot root)(slot category)(slot suffix)(slot number))
 (load-facts "meaning_to_be_decided.dat")
 (load-facts "word.dat")
 (load-facts "original_word.dat")
 (load-facts "root.dat")
 (load-facts "relations.dat")
 (load-facts "lwg_info.dat")
 (load-facts "morph.dat")
 (load-facts "cat_consistency_check.dat")
 (load-facts "preferred_morph.dat")
 (load* "global_path.clp")
 (defmodule WSD_MODULE (export ?ALL)
                       (import MAIN ?ALL)
                       (import MAIN deftemplate ?ALL))
 (set-current-module WSD_MODULE)
 (bind ?path1 (str-cat ?*path* "/Anu_clp_files/wsd_meaning.clp"))
 (defglobal ?*prov_dir* = ?*provisional_wsd_path*)
 (defglobal ?*wsd_dir* = "anu_testing/WSD/wsd_rules/")
 (load* ?path1)
 (open "debug_file.dat" wsd_fp "a")
 (focus WSD_MODULE)
 (run)
 (focus WSD_MODULE)
 (undefrule *)
 (defrule retract_cntrl_fact
 (declare (salience -9999))
 ?f0<-(file_loaded ?id)
 =>
 (retract ?f0)
 )
 (run)
 (focus WSD_MODULE)
 (save-facts "wsd_facts_output.dat" local)
 (clear)
 ;----------------------------------------------------------------------
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/preferred_morph_consistency_check.bclp"))
 (bload ?*path*)
 (load-facts "root.dat")
 (load-facts "morph.dat")
 (load-facts "preferred_morph.dat")
 (load-facts "wsd_facts_output.dat")
 (open "revised_preferred_morph.dat" morph_cons_fp "a")
 (open "revised_root.dat" rev_rt_fp "a")
 (run)
 (clear)
 ;----------------------------------------------------------------------
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/vibakthi_id.bclp"))
 (bload ?*path*)
 (load-facts "lwg_info.dat")
 (load-facts "meaning_to_be_decided.dat")
 (load-facts "revised_preferred_morph.dat")
 (load-facts "morph.dat")
 (load-facts "original_word.dat")
 (open "vibakthi_id.dat" vib_id_fp "a")
 (open "tam_id.dat" tam_id_fp "a")
 (run)
  (clear)
 ;----------------------------------------------------------------------
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/hindi_tam_rules.bclp"))
 (bload ?*path*)
 (load-facts "lwg_info.dat")
 (open "hindi_tam_tmp.dat" Hin_tam "a")
 (run)
 (clear)
 ;----------------------------------------------------------------------
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/sd_pada.clp"))
 (load ?*path*)
 (load-facts "to_be_included_in_paxa.dat")
 (load-facts "relations_tmp1.dat")
 (load-facts "lwg_info.dat")
 (load-facts "sd-relations.dat")
 (load-facts "word.dat")
 (open "vachan_to_be_decided.dat" vachan_fp  "a")
 (open "agmt_control_fact.dat" agmt_cntrl_fp "a")
 (open "pada_control_fact.dat" pada_cntrl_fp "a")
 (open "pada_debug.dat" pada_debug_fp "a")
 (open "errors.txt" err_file "a")
 (run)
 (save-facts "pada_id_info.dat" local pada_info)
 (save-facts "pada_count.dat"  local count)
 (clear)
 ;----------------------------------------------------------------------
 (defmodule MAIN (export ?ALL))
; (load-facts "root.dat")
 (load-facts "revised_root.dat")
 (load-facts "word.dat")
 (load-facts "cat_consistency_check.dat")
 (load-facts "relations.dat")
 (load-facts "meaning_to_be_decided.dat")
 (load-facts "tam_id.dat")
 (load-facts "revised_preferred_morph.dat")
 (load-facts "original_word.dat")
 (load* "global_path.clp")
 (defmodule WSD_TAM_MODULE (export ?ALL)
                       (import MAIN ?ALL))
 (set-current-module WSD_TAM_MODULE)
 (bind ?path1 (str-cat ?*path* "/Anu_clp_files/wsd_tam_meaning.clp"))
 (bind ?wsd_path (str-cat "anu_testing" "/WSD/wsd_rules/"))
 (defglobal ?*prov_dir* = ?*provisional_wsd_path*)
 (defglobal ?*wsd_dir* = ?wsd_path)
 (load ?path1)
 (focus WSD_TAM_MODULE)
 (run)
 (focus WSD_TAM_MODULE)
 (undefrule *)
 (defrule retract_cntrl_fact
 (declare (salience -9999))
 ?f0<-(file_loaded ?id)
 =>
 (retract ?f0)
 )
 (run)
 (focus WSD_TAM_MODULE)
 (save-facts "wsd_tam_facts_output.dat" local)
 (clear)
 ;----------------------------------------------------------------------
  (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/tam_meaning.bclp"))
 (bload ?*path*)
 (load-facts "wsd_tam_facts_output.dat")
 (load-facts "hindi_tam_tmp.dat")
 (load-facts "wsd_facts_output.dat")
 (load-facts "pada_id_info.dat")
 (load-facts "relations.dat")
 (load-facts "meaning_to_be_decided.dat")
 (run)
 (save-facts "hindi_tam_info.dat" local pada_info)
 (clear)
 ;----------------------------------------------------------------------
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/hindi_meaning.bclp"))
 (bload ?*path*)
 (load-facts "cat_consistency_check.dat")
 (load-facts "meaning_to_be_decided.dat")
 (load-facts "relations.dat")
 (load-facts "sen_phrase.dat")
 (load-facts "compound_phrase.dat")
; (load-facts "root.dat")
 (load-facts "revised_root.dat")
 (load-facts "wsd_facts_output.dat")
 (load-facts "wsd_tam_facts_output.dat")
 (load-facts "lwg_info.dat")
 (load-facts "original_word.dat")
 (open "hindi_meanings_tmp.dat" fp "a")
 (run)
 (clear)
 ;----------------------------------------------------------------------
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/causative_verb_mng.bclp"))
 (bload ?*path*)
 (load-facts "meaning_to_be_decided.dat")
 (load-facts "lwg_info.dat")
 (load-facts "original_word.dat")
 (load-facts "hindi_meanings_tmp.dat")
 (load-facts "wsd_facts_output.dat")
 (load-facts "wsd_tam_facts_output.dat")
 (load-facts "cat_consistency_check.dat")
 (open "hindi_meanings.dat" caus_mng_fp "a")
 (run)
 (clear)
 ;----------------------------------------------------------------------
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/gender_info.bclp"))
 (bload ?*path*)
 (load-facts "meaning_to_be_decided.dat")
 (load-facts "cat_consistency_check.dat")
 (load-facts "original_word.dat")
 (load-facts "hindi_meanings.dat")
 (open "gender.dat" gen_fp "a")
 (run)
 (clear)
 ;----------------------------------------------------------------------
  (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/vibakthi.bclp"))
 (bload ?*path*)
 (assert (load_yA_tams_with_ne))
 (load-facts "hindi_meanings.dat")
 (load-facts "pada_control_fact.dat")
 (load-facts "relations.dat")
 (load-facts "wsd_tam_facts_output.dat")
 (load-facts "hindi_tam_tmp.dat")
 (load-facts "hindi_tam_info.dat")
 (load-facts "wsd_facts_output.dat")
 (load-facts "compound_phrase.dat")
 (load-facts "original_word.dat")
 (load-facts "revised_root.dat")
 (run)
 (save-facts "vibakthi_info.dat" local pada_info)
 (clear)
 ;----------------------------------------------------------------------
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/agreement.bclp"))
 (bload ?*path*)
 (load-facts "vibakthi_info.dat")
 (load-facts "relations.dat")
 (load-facts "agmt_control_fact.dat")
 (load-facts "hindi_meanings.dat")
 (open "verb_agreement.dat" agrmt_fp "a")
 (open "agreement_debug.dat" agrmt_db "a")
 (run)
 (clear)
 ;----------------------------------------------------------------------
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/number.bclp"))
 (bload ?*path*)
 (load-facts "word.dat")
 (load-facts "pada_id_info.dat")
 (load-facts "revised_preferred_morph.dat")
 (load-facts "original_word.dat")
 (load-facts "vachan_to_be_decided.dat")
 (load-facts "word.dat")
 (run)
 (save-facts "number.dat" local id-number-src)
 (clear)
 ;--------------------------------------------------------------------------
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/GNP_agreement.bclp"))
 (bload ?*path*)
 (load-facts "vibakthi_info.dat")
 (load-facts "verb_agreement.dat")
 (load-facts "original_word.dat")
 (load-facts "relations.dat")
 (load-facts "number.dat")
 (load-facts "gender.dat")
 (load-facts "hindi_meanings.dat")
 (load-facts "pada_control_fact.dat")
 (open "GNP_errors.txt" err_fp "a")
 (open "GNP_debug.dat" gnp_fp "a")
 (run)
 (save-facts "GNP_agmt_info.dat" local pada_info)
 (close gnp_fp)
 (clear)
 ;-------------------------------------------------------------------------------
  (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/sd_hindi_position.bclp"))
 (bload ?*path*)
 (load-facts "word.dat")
 (load-facts "GNP_agmt_info.dat")
 (load-facts "relations.dat")
 (load-facts "chunk.dat")
 (load-facts "relations_tmp1.dat")
 (load-facts "lwg_info.dat")
 (load-facts "Eng_id_order.dat")
 (load-facts "cat_consistency_check.dat")
 (load-facts "punctuation_info.dat")
 (load-facts "hindi_meanings.dat")
 (run)
 (save-facts "hindi_id_order.dat" local hindi_id_order)
 (save-facts "hindi_position.dat" local pada_info)
 (clear)
 ;---------------------------------------------------------------------------------
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/sd_hindi_sent_reorder.clp"))
 (load ?*path*)
 (load-facts "sd-relations.dat")
 (load-facts "hindi_id_order.dat")
 (load-facts "hindi_position.dat")
 (load-facts "relations.dat")
 (load-facts "word.dat")
 (load-facts "revised_root.dat")
 (load-facts "cat_consistency_check.dat")
 (open "hindi_id_reorder_debug.dat" h_id_reorder_fp "a")
 (run)
 (save-facts "hindi_id_reorder.dat" local hindi_id_order)
 (clear)
 ;--------------------------------------------------------------------------
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/prepare_apertium_input.bclp"))
 (bload ?*path*)
 (assert (load_facts))
 (load-facts "word.dat")
 (load-facts "lwg_info.dat")
 (load-facts "original_word.dat")
 (load-facts "hindi_position.dat")
 (load-facts "hindi_meanings.dat")
 (load-facts "relations.dat")
 (load-facts "wsd_facts_output.dat")
 (load-facts "wsd_tam_facts_output.dat")
 (load-facts "hindi_id_reorder.dat")
 (load-facts "verb_agreement.dat")
 (load-facts "number.dat")
 (load-facts "gender.dat")
 (load-facts "sen_phrase.dat")
 (load-facts "cat_consistency_check.dat")
 (load-facts "tam_id.dat")
 (open "id_Apertium_input.dat" fp5 "a")
 (open "apertium_input_debug" aper_debug "a")
 (run)
 (clear)
 ;--------------------------------------------------------------------------
 (load "global_path.clp")
 (bind ?*path* (str-cat ?*path* "/Anu_clp_files/padasuthra.bclp"))
 (bload ?*path*)
 (load-facts "original_word.dat")
 (load-facts "word.dat")
 (load-facts "revised_root.dat")
 (load-facts "cat_consistency_check.dat")
 (load-facts "hindi_meanings.dat")
 (open "padasuthra.dat" paxasUwra_fp "a")
 (run)
 (close paxasUwra_fp)
 (clear)
 (exit)

########################   To run all the trees #############################

 rm  E_constituents_info.dat Node_category_info.dat cons_tree.dat $1.error $1_* 

# java  -mx900m -cp "$STANFORD_PATH/stanford-parser.jar:" edu.stanford.nlp.parser.lexparser.LexicalizedParser -sentences "newline" -outputFormat oneline -outputFormatOptions "treeDependencies" $STANFORD_PATH/grammar/englishPCFG.ser.gz  $1 > $1_derived_tree  2> /dev/null
 java  -mx900m -cp "$STANFORD_PATH/stanford-parser.jar:" edu.stanford.nlp.parser.lexparser.LexicalizedParser -sentences "newline" -outputFormat oneline -outputFormatOptions "treeDependencies" -printPCFGkBest 25 $STANFORD_PATH/englishPCFG.ser.gz  $1 > $1_derived_tree  2> /dev/null

 java -mx800m -cp "$STANFORD_PATH/stanford-parser.jar:" edu.stanford.nlp.trees.EnglishGrammaticalStructure -treeFile $1_derived_tree  -CCprocessed -conllx -keepPunct -lexicalize  > $1_dependency_tree

 java -mx900m -cp "$STANFORD_PATH/stanford-parser.jar:" edu.stanford.nlp.trees.TreePrint -options "lexicalize" $1_derived_tree > $1_lexicalize_output

 ./constituency_parse E_constituents_info.dat Node_category_info.dat < $1_lexicalize_output
 clips -f get_constituency_tree.clp >  $1.error
 sed  's/LB /(/g' cons_tree.dat |sed 's/RB /)/g' |sed 's/(Cons-tree//g' |sed 's/RB)$/)/g'> $1_derivation_tree

 java -jar ConstTreeViewer_13_05_10.jar & 

 java -jar DepTreeeViewer_17_06_10.jar
#To get Dictionaries in canonical form::
#Added by Roja(16-07-12)
###########################################
#Text which has left coloumn hindi
while read line
do
        cut -f1 $line".txt"  > $line".hindi"
        cut -f2 $line".txt"  > $line".eng"
	./get_canonical_form-dic.out  $line".hindi" > $line".canonical_form"
	paste  $line".canonical_form" $line".eng" > dictionaries/$line"_in_canonical_form.txt"
	rm $line".txt" $line".hindi" $line".eng" $line".canonical_form"
        echo "Generated $line"_in_canonical_form.txt"" 
done < list-left
###########################################
#Text which has right coloumn hindi
while read line
do
        cut -f1 $line".txt"  > $line".eng"
        cut -f2 $line".txt"  > $line".hindi"
	./get_canonical_form-dic.out  $line".hindi" > $line".canonical_form"
        paste  $line".eng" $line".canonical_form"  > dictionaries/$line"_in_canonical_form.txt"
        rm $line".txt" $line".eng" $line".hindi" $line".canonical_form"
        echo "Generated $line"_in_canonical_form.txt"" 
done < list-right
###########################################
#Text which has both sides hindi
while read line
do
	cut -f1 $line".txt"  > $line".hnd"
        cut -f2 $line".txt"  > $line".hindi"
        ./get_canonical_form-dic.out  $line".hnd"   > $line".hnd1.canonical_form"
        ./get_canonical_form-dic.out  $line".hindi" > $line".hnd2.canonical_form"
	paste $line".hnd1.canonical_form"  $line".hnd2.canonical_form" > dictionaries/$line"_in_canonical_form.txt"
	rm $line".txt" $line".hnd" $line".hindi" $line".hnd1.canonical_form" $line".hnd2.canonical_form"
	echo "Generated $line"_in_canonical_form.txt""
done < list-two-side-hindi
###########################################
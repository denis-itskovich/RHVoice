THIS_DIR=$(dirname $0)
LANG_NAME=$(basename $PWD)
LANG_DIR=$THIS_DIR/../../../data/languages/$LANG_NAME

for fm in `ls *.foma`
do
    echo Processing $fm ...
    (echo write att $fm.att; echo quit) | foma -l $fm > /dev/null
    $THIS_DIR/att2bin $fm.att $LANG_DIR/${fm%.*}.fst > /dev/null
    rm $fm.att
done

for i in `ls OSIM2_10M_MSLR_MEDDRA_11_CSV/*csv vocabulary_4_unrestricted_csv/*csv`; do
    echo ${i}
    sed -i '.bak' -e 's/|$//' -e 's/,""/,/g' ${i}
done

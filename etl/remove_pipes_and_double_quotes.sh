for i in `ls OSIM2_1M_MSLR_SNOMED_0_CSV/*csv vocabulary_4_csv/*csv`; do
    echo ${i}
    sed -i '.bak' -e 's/|$//' -e 's/,"",/,,/g' ${i}
done

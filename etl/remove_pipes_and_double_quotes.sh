for i in `OSIM2_10M_MSLR_MEDDRA_11_CSV/*csv ls vocabulary_4_csv/*csv`; do
    echo ${i}
    sed -i '.bak' -e 's/|$//' -e 's/,"",/,,/g' ${i}
done

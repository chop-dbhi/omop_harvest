awk 'BEGIN{FS=",";OFS=","}{print $1,$2,$3,$5,$6,$7,$8}' OSIM2_1M_MSLR_SNOMED_0_CSV/condition_era.csv > OSIM2_1M_MSLR_SNOMED_0_CSV/new_condition_era.csv
mv OSIM2_1M_MSLR_SNOMED_0_CSV/new_condition_era.csv OSIM2_1M_MSLR_SNOMED_0_CSV/condition_era.csv
awk 'BEGIN{FS=",";OFS=","}{print $1,$2,$3,$4}' OSIM2_1M_MSLR_SNOMED_0_CSV/observation_period.csv > OSIM2_1M_MSLR_SNOMED_0_CSV/new_observation_period.csv
mv OSIM2_1M_MSLR_SNOMED_0_CSV/new_observation_period.csv OSIM2_1M_MSLR_SNOMED_0_CSV/observation_period.csv
awk 'BEGIN{FS=",";OFS=","}{print $1,$2,$3,$4,$6,$7,$9}' OSIM2_1M_MSLR_SNOMED_0_CSV/person.csv > OSIM2_1M_MSLR_SNOMED_0_CSV/new_person.csv
mv OSIM2_1M_MSLR_SNOMED_0_CSV/new_person.csv OSIM2_1M_MSLR_SNOMED_0_CSV/person.csv

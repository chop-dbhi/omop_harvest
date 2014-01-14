ALTER TABLE omop_care_site 
    ADD CONSTRAINT omop_care_site_location_FK FOREIGN KEY 
    ( 
     location_id
    ) 
    REFERENCES omop_location 
    ( 
     location_id
    ) 
;


ALTER TABLE omop_care_site 
    ADD CONSTRAINT omop_care_site_organization_FK FOREIGN KEY 
    ( 
     organization_id
    ) 
    REFERENCES omop_organization 
    ( 
     organization_id
    ) 
;


ALTER TABLE omop_condition_era 
    ADD CONSTRAINT omop_condition_era_person_FK FOREIGN KEY 
    ( 
     person_id
    ) 
    REFERENCES omop_person 
    ( 
     person_id
    ) 
;


ALTER TABLE omop_condition_occurrence 
    ADD CONSTRAINT omop_condition_occurrence_person_FK FOREIGN KEY 
    ( 
     person_id
    ) 
    REFERENCES omop_person 
    ( 
     person_id
    ) 
;


ALTER TABLE omop_condition_occurrence 
    ADD CONSTRAINT omop_condition_provider_FK FOREIGN KEY 
    ( 
     associated_provider_id
    ) 
    REFERENCES omop_provider 
    ( 
     provider_id
    ) 
;


ALTER TABLE omop_condition_occurrence 
    ADD CONSTRAINT omop_condition_visit_FK FOREIGN KEY 
    ( 
     visit_occurrence_id
    ) 
    REFERENCES omop_visit_occurrence 
    ( 
     visit_occurrence_id
    ) 
;


ALTER TABLE omop_death 
    ADD CONSTRAINT omop_death_person_FK FOREIGN KEY 
    ( 
     person_id
    ) 
    REFERENCES omop_person 
    ( 
     person_id
    ) 
;


ALTER TABLE omop_drug_cost 
    ADD CONSTRAINT omop_drug_cost_drug_exposure_FK FOREIGN KEY 
    ( 
     drug_exposure_id
    ) 
    REFERENCES omop_drug_exposure 
    ( 
     drug_exposure_id
    ) 
;


ALTER TABLE omop_drug_cost 
    ADD CONSTRAINT omop_drug_cost_payer_plan_period_FK FOREIGN KEY 
    ( 
     payer_plan_period_id
    ) 
    REFERENCES omop_payer_plan_period 
    ( 
     payer_plan_period_id
    ) 
;


ALTER TABLE omop_drug_era 
    ADD CONSTRAINT omop_drug_era_person_FK FOREIGN KEY 
    ( 
     person_id
    ) 
    REFERENCES omop_person 
    ( 
     person_id
    ) 
;


ALTER TABLE omop_drug_exposure 
    ADD CONSTRAINT omop_drug_exposure_person_FK FOREIGN KEY 
    ( 
     person_id
    ) 
    REFERENCES omop_person 
    ( 
     person_id
    ) 
;


ALTER TABLE omop_drug_exposure 
    ADD CONSTRAINT omop_drug_exposure_provider_FK FOREIGN KEY 
    ( 
     prescribing_provider_id
    ) 
    REFERENCES omop_provider 
    ( 
     provider_id
    ) 
;


ALTER TABLE omop_drug_exposure 
    ADD CONSTRAINT omop_drug_visit_FK FOREIGN KEY 
    ( 
     visit_occurrence_id
    ) 
    REFERENCES omop_visit_occurrence 
    ( 
     visit_occurrence_id
    ) 
;


ALTER TABLE omop_observation 
    ADD CONSTRAINT omop_observation_person_FK FOREIGN KEY 
    ( 
     person_id
    ) 
    REFERENCES omop_person 
    ( 
     person_id
    ) 
;


ALTER TABLE omop_observation_period 
    ADD CONSTRAINT omop_observation_period_person_FK FOREIGN KEY 
    ( 
     person_id
    ) 
    REFERENCES omop_person 
    ( 
     person_id
    ) 
;


ALTER TABLE omop_observation 
    ADD CONSTRAINT omop_observation_provider_FK FOREIGN KEY 
    ( 
     associated_provider_id
    ) 
    REFERENCES omop_provider 
    ( 
     provider_id
    ) 
;


ALTER TABLE omop_observation 
    ADD CONSTRAINT omop_observation_visit_FK FOREIGN KEY 
    ( 
     visit_occurrence_id
    ) 
    REFERENCES omop_visit_occurrence 
    ( 
     visit_occurrence_id
    ) 
;


ALTER TABLE omop_organization 
    ADD CONSTRAINT omop_organization_location_FK FOREIGN KEY 
    ( 
     location_id
    ) 
    REFERENCES omop_location 
    ( 
     location_id
    ) 
;


ALTER TABLE omop_payer_plan_period 
    ADD CONSTRAINT omop_payer_plan_period_person_FK FOREIGN KEY 
    ( 
     person_id
    ) 
    REFERENCES omop_person 
    ( 
     person_id
    ) 
;


ALTER TABLE omop_person 
    ADD CONSTRAINT omop_person_care_site_FK FOREIGN KEY 
    ( 
     care_site_id
    ) 
    REFERENCES omop_care_site 
    ( 
     care_site_id
    ) 
;


ALTER TABLE omop_person 
    ADD CONSTRAINT omop_person_location_FK FOREIGN KEY 
    ( 
     location_id
    ) 
    REFERENCES omop_location 
    ( 
     location_id
    ) 
;


ALTER TABLE omop_person 
    ADD CONSTRAINT omop_person_provider_FK FOREIGN KEY 
    ( 
     provider_id
    ) 
    REFERENCES omop_provider 
    ( 
     provider_id
    ) 
;


ALTER TABLE omop_procedure_cost 
    ADD CONSTRAINT omop_procedure_cost_payer_plan_FK FOREIGN KEY 
    ( 
     payer_plan_period_id
    ) 
    REFERENCES omop_payer_plan_period 
    ( 
     payer_plan_period_id
    ) 
;


ALTER TABLE omop_procedure_cost 
    ADD CONSTRAINT omop_procedure_cost_procedure_FK FOREIGN KEY 
    ( 
     procedure_occurrence_id
    ) 
    REFERENCES omop_procedure_occurrence 
    ( 
     procedure_occurrence_id
    ) 
;


ALTER TABLE omop_procedure_occurrence 
    ADD CONSTRAINT omop_procedure_occurrence_person_FK FOREIGN KEY 
    ( 
     person_id
    ) 
    REFERENCES omop_person 
    ( 
     person_id
    ) 
;


ALTER TABLE omop_procedure_occurrence 
    ADD CONSTRAINT omop_procedure_provider_FK FOREIGN KEY 
    ( 
     associated_provider_id
    ) 
    REFERENCES omop_provider 
    ( 
     provider_id
    ) 
;


ALTER TABLE omop_procedure_occurrence 
    ADD CONSTRAINT omop_procedure_visit_FK FOREIGN KEY 
    ( 
     visit_occurrence_id
    ) 
    REFERENCES omop_visit_occurrence 
    ( 
     visit_occurrence_id
    ) 
;


ALTER TABLE omop_provider 
    ADD CONSTRAINT omop_provider_care_site_FK FOREIGN KEY 
    ( 
     care_site_id
    ) 
    REFERENCES omop_care_site 
    ( 
     care_site_id
    ) 
;


ALTER TABLE omop_visit_occurrence 
    ADD CONSTRAINT omop_visit_occurrence_person_FK FOREIGN KEY 
    ( 
     person_id
    ) 
    REFERENCES omop_person 
    ( 
     person_id
    ) 
;

ALTER TABLE omop_drug_era 
    ADD CONSTRAINT omop_drug_era_exposure_type_FK FOREIGN KEY 
    ( 
     drug_exposure_type
    ) 
    REFERENCES omop_drug_exposure_type 
    ( 
     drug_exposure_type
    ) 
;


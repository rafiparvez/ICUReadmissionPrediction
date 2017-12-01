set search_path to mimiciii;

drop materialized view if exists admission_details;
create materialized view admission_details as
  select ad.subject_id, ad.hadm_id, ad.admittime, ad.dischtime, ad.deathtime
  , ie.first_careunit, ie.last_careunit
  , extract(epoch from (ad.admittime - p.dob))/60.0/60.0/24.0/365.242 as age
  , p.gender as gender
  , ad.marital_status as marital_status
  , ad.insurance as insurance
  from admissions ad
    inner join icustays ie
	on ad.hadm_id = ie.hadm_id
    inner join patients p
    on ad.subject_id = p.subject_id
  order by ad.subject_id,ad.hadm_id;
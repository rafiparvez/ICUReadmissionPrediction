set search_path to mimiciii;

select icustay_id, itemid, charttime,value,VALUENUM
from chartevents
where itemid in
(
211,
742,
646,
618,
212,
161,
128,
550,
1125,
220045,
220210,
220277,
159,
1484,
51,
8368,
52,
220048,
227969,
224650,
5815,
8549,
5820,
8554,
5819,
8553,
834,
3450,
8518,
3603,
581,
3609,
8532,
455,
8441,
456,
31,
5817,
8551,
220181,
220179,
220180,
113,
1703,
220052,
467,
220050,
220051,
80,
1337
)
order by icustay_id,itemid,charttime;
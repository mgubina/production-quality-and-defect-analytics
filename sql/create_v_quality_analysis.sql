CREATE OR REPLACE VIEW public.v_quality_analysis
AS SELECT b.date_obs AS report_date,
    c.ceh_name,
    c.master_name,
    o.name_oborudovaniya AS machine_name,
    o.type_oborudovaniya AS machine_type,
    b.smena AS shift,
    b.kol_godnyh AS qty_good,
    b.kol_braka AS qty_bad,
    b.prichina_braka AS defect_reason,
    b.kol_godnyh + b.kol_braka AS total_produced
   FROM tab_brak b
     LEFT JOIN spr_ceha c ON b.nomer_ceha = c.nomer_ceha
     LEFT JOIN spr_oborudovanie o ON b.nomer_oborudovaniya = o.nomer_oborudovaniya;
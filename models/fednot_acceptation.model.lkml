connection: "fednot-acc-datalake"

# include all the views
include: "/views/**/*.view"

datagroup: fednot_acceptation_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: fednot_acceptation_default_datagroup

map_layer: province_location_belgium {
  file: "/maps/belgium.json"
  property_key: "prov_nl"
}

map_layer: region_location_belgium {
  file: "/maps/belgium.json"
  property_key: "reg_nl"
}

# explore: dim_notary_office {}

# explore: dim_application {}

# explore: dim_province {}

explore: fact_prestation {
  label: "Prestation"
#  access_filter: {
#   field: province.region
#   user_attribute: region
#  }
  join: dim_notary_office {
    sql_on: ${fact_prestation.dim_notary_office_sk} = ${dim_notary_office.h_notary_office_bk} ;;
    relationship: many_to_one
    type: left_outer # Could be excluded since left_outer is the default
    fields: [] #dit zou de hele study view moeten hiden
  }
  join: dim_application {
    sql_on: ${fact_prestation.dim_application_sk} = ${dim_application.dim_application_sk} ;;
    relationship: many_to_one
    type: left_outer # Could be excluded since left_outer is the default
  }
  join: dim_province {
    sql_on: ${fact_prestation.dim_province_sk} = ${dim_province.dim_province_sk} ;;
    relationship: many_to_one
    type: left_outer # Could be excluded since left_outer is the default
  }
  join: dim_date {
    sql_on: CAST(${fact_prestation.dim_days_sk_date} as date) = ${dim_date.date_date} ;;
    relationship:  many_to_one
    type: left_outer
  }
}

# explore: dim_days {}

# explore: dim_date {}

# explore: ereg_vw_dim_deed_edossier {
#   join: m_job_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_deed_edossier.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
#     relationship: many_to_one
#   }
#   join: m_model_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_deed_edossier.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ereg_vw_dim_expedition {
#   join: m_job_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_expedition.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
#     relationship: many_to_one
#   }
#   join: m_model_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_expedition.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ereg_vw_dim_good {
#   join: m_job_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_good.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
#     relationship: many_to_one
#   }
#   join: m_model_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_good.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ereg_vw_dim_good_address {
#   join: m_job_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_good_address.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
#     relationship: many_to_one
#   }
#   join: m_model_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_good_address.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ereg_vw_dim_party {
#   join: m_job_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_party.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
#     relationship: many_to_one
#   }
#   join: m_model_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_party.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ereg_vw_dim_party_address {
#   join: m_job_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_party_address.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
#     relationship: many_to_one
#   }
#   join: m_model_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_party_address.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ereg_vw_dim_party_quality {
#   join: m_model_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_party_quality.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
#     relationship: many_to_one
#   }
#   join: m_job_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_party_quality.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ereg_vw_dim_party_right_type {
#   join: m_model_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_party_right_type.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
#     relationship: many_to_one
#   }
#   join: m_job_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_party_right_type.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ereg_vw_dim_sending_answer {
#   join: m_job_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_sending_answer.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
#     relationship: many_to_one
#   }
#   join: m_model_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_sending_answer.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ereg_vw_dim_sp25 {
#   join: m_model_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_sp25.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
#     relationship: many_to_one
#   }
#   join: m_job_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_sp25.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ereg_vw_dim_study_address {
#   join: m_job_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_study_address.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
#     relationship: many_to_one
#   }
#   join: m_model_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_study_address.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ereg_vw_dim_transaction {
#   join: m_model_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_transaction.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
#     relationship: many_to_one
#   }
#   join: m_job_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_transaction.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ereg_vw_dim_transaction_type {
#   join: m_job_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_transaction_type.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
#     relationship: many_to_one
#   }
#   join: m_model_run {
#     type: left_outer
#     sql_on: ${ereg_vw_dim_transaction_type.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ereg_vw_fact_transaction {
#   join: m_job_run {
#     type: left_outer
#     sql_on: ${ereg_vw_fact_transaction.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
#     relationship: many_to_one
#   }
#   join: m_model_run {
#     type: left_outer
#     sql_on: ${ereg_vw_fact_transaction.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: m_job_run {}

# explore: m_model_run {
#   join: m_job_run {
#     type: left_outer
#     sql_on: ${m_model_run.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: vw_dim_application {}

# explore: vw_dim_application_month {}

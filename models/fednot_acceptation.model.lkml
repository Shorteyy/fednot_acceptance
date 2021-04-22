connection: "fednot-acc-datalake"

# include all the views
include: "/views/**/*.view"

datagroup: fednot_acceptation_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: fednot_acceptation_default_datagroup

explore: dim_application {
  join: m_model_run {
    type: left_outer
    sql_on: ${dim_application.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
    relationship: many_to_one
  }

  join: m_job_run {
    type: left_outer
    sql_on: ${m_model_run.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
    relationship: many_to_one
  }
}

explore: dim_days {}

explore: dim_notary_office {
  join: m_model_run {
    type: left_outer
    sql_on: ${dim_notary_office.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
    relationship: many_to_one
  }

  join: m_job_run {
    type: left_outer
    sql_on: ${m_model_run.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
    relationship: many_to_one
  }
}

explore: dim_province {
  join: m_model_run {
    type: left_outer
    sql_on: ${dim_province.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
    relationship: many_to_one
  }

  join: m_job_run {
    type: left_outer
    sql_on: ${m_model_run.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
    relationship: many_to_one
  }
}

explore: ereg_vw_dim_deed_edossier {
  join: m_job_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_deed_edossier.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
    relationship: many_to_one
  }

  join: m_model_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_deed_edossier.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
    relationship: many_to_one
  }
}

explore: ereg_vw_dim_expedition {
  join: m_job_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_expedition.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
    relationship: many_to_one
  }

  join: m_model_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_expedition.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
    relationship: many_to_one
  }
}

explore: ereg_vw_dim_good {
  join: m_job_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_good.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
    relationship: many_to_one
  }

  join: m_model_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_good.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
    relationship: many_to_one
  }
}

explore: ereg_vw_dim_good_address {
  join: m_job_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_good_address.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
    relationship: many_to_one
  }

  join: m_model_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_good_address.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
    relationship: many_to_one
  }
}

explore: ereg_vw_dim_party {
  join: m_job_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_party.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
    relationship: many_to_one
  }

  join: m_model_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_party.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
    relationship: many_to_one
  }
}

explore: ereg_vw_dim_party_address {
  join: m_job_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_party_address.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
    relationship: many_to_one
  }

  join: m_model_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_party_address.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
    relationship: many_to_one
  }
}

explore: ereg_vw_dim_party_quality {
  join: m_model_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_party_quality.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
    relationship: many_to_one
  }

  join: m_job_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_party_quality.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
    relationship: many_to_one
  }
}

explore: ereg_vw_dim_party_right_type {
  join: m_model_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_party_right_type.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
    relationship: many_to_one
  }

  join: m_job_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_party_right_type.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
    relationship: many_to_one
  }
}

explore: ereg_vw_dim_sending_answer {
  join: m_job_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_sending_answer.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
    relationship: many_to_one
  }

  join: m_model_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_sending_answer.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
    relationship: many_to_one
  }
}

explore: ereg_vw_dim_sp25 {
  join: m_model_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_sp25.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
    relationship: many_to_one
  }

  join: m_job_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_sp25.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
    relationship: many_to_one
  }
}

explore: ereg_vw_dim_study_address {
  join: m_job_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_study_address.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
    relationship: many_to_one
  }

  join: m_model_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_study_address.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
    relationship: many_to_one
  }
}

explore: ereg_vw_dim_transaction {
  join: m_model_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_transaction.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
    relationship: many_to_one
  }

  join: m_job_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_transaction.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
    relationship: many_to_one
  }
}

explore: ereg_vw_dim_transaction_type {
  join: m_job_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_transaction_type.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
    relationship: many_to_one
  }

  join: m_model_run {
    type: left_outer
    sql_on: ${ereg_vw_dim_transaction_type.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
    relationship: many_to_one
  }
}

explore: ereg_vw_fact_transaction {
  join: m_job_run {
    type: left_outer
    sql_on: ${ereg_vw_fact_transaction.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
    relationship: many_to_one
  }

  join: m_model_run {
    type: left_outer
    sql_on: ${ereg_vw_fact_transaction.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
    relationship: many_to_one
  }
}

explore: fact_prestation {
  join: m_model_run {
    type: left_outer
    sql_on: ${fact_prestation.m_model_run_id} = ${m_model_run.m_model_run_id} ;;
    relationship: many_to_one
  }

  join: m_job_run {
    type: left_outer
    sql_on: ${m_model_run.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
    relationship: many_to_one
  }
}

explore: m_job_run {}

explore: m_model_run {
  join: m_job_run {
    type: left_outer
    sql_on: ${m_model_run.m_job_run_id} = ${m_job_run.m_job_run_id} ;;
    relationship: many_to_one
  }
}

explore: vw_dim_application {}

explore: vw_dim_application_month {}

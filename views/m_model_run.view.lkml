view: m_model_run {
  sql_table_name: `dwh.m_model_run`
    ;;
  drill_fields: [m_model_run_id]

  dimension: m_model_run_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.m_model_run_id ;;
  }

  dimension: m_job_run_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.m_job_run_id ;;
  }

  dimension_group: m_model_end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.m_model_end ;;
  }

  dimension: m_model_name {
    type: string
    sql: ${TABLE}.m_model_name ;;
  }

  dimension_group: m_model_start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.m_model_start ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      m_model_run_id,
      m_model_name,
      m_job_run.m_job_run_id,
      m_job_run.m_job_name,
      ereg_vw_dim_expedition.count,
      ereg_vw_dim_good_address.count,
      dim_province.count,
      ereg_vw_dim_deed_edossier.count,
      dim_application.count,
      dim_notary_office.count,
      ereg_vw_dim_good.count,
      ereg_vw_dim_party.count,
      ereg_vw_dim_party_quality.count,
      ereg_vw_dim_sending_answer.count,
      ereg_vw_dim_sp25.count,
      ereg_vw_dim_party_address.count,
      ereg_vw_dim_study_address.count,
      ereg_vw_dim_party_right_type.count,
      ereg_vw_dim_transaction.count,
      ereg_vw_fact_transaction.count,
      ereg_vw_dim_transaction_type.count,
      fact_prestation.count
    ]
  }
}

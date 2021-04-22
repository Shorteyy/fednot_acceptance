view: m_job_run {
  sql_table_name: `dwh.m_job_run`
    ;;
  drill_fields: [m_job_run_id]

  dimension: m_job_run_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.m_job_run_id ;;
  }

  dimension_group: m_job_datetime {
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
    sql: ${TABLE}.m_job_datetime ;;
  }

  dimension: m_job_name {
    type: string
    sql: ${TABLE}.m_job_name ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      m_job_run_id,
      m_job_name,
      ereg_vw_dim_expedition.count,
      ereg_vw_dim_good_address.count,
      ereg_vw_dim_deed_edossier.count,
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
      m_model_run.count
    ]
  }
}

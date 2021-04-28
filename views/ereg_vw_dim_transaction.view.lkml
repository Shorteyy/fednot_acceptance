view: ereg_vw_dim_transaction {
  label: "Transaction"
  sql_table_name: `dwh.ereg_vwDimTransaction`
    ;;

  dimension: is_main_transaction {
    type: string
    sql: ${TABLE}.isMainTransaction ;;
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

  dimension: m_job_run_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.m_job_run_id ;;
  }

  dimension: m_model_run_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.m_model_run_id ;;
  }

  dimension: pk_ereg_transaction {
    type: string
    sql: ${TABLE}.PK_EregTransaction ;;
  }

  dimension: sys_insert_update_date {
    type: string
    sql: ${TABLE}.Sys_InsertUpdateDate ;;
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.TransactionId ;;
  }

  measure: count {
    type: count
    drill_fields: [m_model_run.m_model_run_id, m_model_run.m_model_name, m_job_run.m_job_run_id, m_job_run.m_job_name]
  }
}

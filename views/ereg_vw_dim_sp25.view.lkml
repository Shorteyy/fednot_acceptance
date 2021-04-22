view: ereg_vw_dim_sp25 {
  sql_table_name: `dwh.ereg_vwDimSP25`
    ;;

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

  dimension: pk_ereg_sp25 {
    type: string
    sql: ${TABLE}.PK_EregSP25 ;;
  }

  dimension: sp25_code {
    type: string
    sql: ${TABLE}.SP25Code ;;
  }

  dimension: sp25_label_fr {
    type: string
    sql: ${TABLE}.SP25LabelFR ;;
  }

  dimension: sp25_label_nl {
    type: string
    sql: ${TABLE}.SP25LabelNL ;;
  }

  dimension: sys_insert_update_date {
    type: string
    sql: ${TABLE}.Sys_InsertUpdateDate ;;
  }

  measure: count {
    type: count
    drill_fields: [m_model_run.m_model_run_id, m_model_run.m_model_name, m_job_run.m_job_run_id, m_job_run.m_job_name]
  }
}

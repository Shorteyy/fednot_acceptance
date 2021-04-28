view: ereg_vw_dim_expedition {
  label: "Expedition"
  sql_table_name: `dwh.ereg_vwDimExpedition`
    ;;

  dimension: expedition_change_mode_code {
    type: string
    sql: ${TABLE}.ExpeditionChangeModeCode ;;
  }

  dimension: expedition_change_mode_label_fr {
    type: string
    sql: ${TABLE}.ExpeditionChangeModeLabelFR ;;
  }

  dimension: expedition_change_mode_label_nl {
    type: string
    sql: ${TABLE}.ExpeditionChangeModeLabelNL ;;
  }

  dimension: expedition_id {
    type: string
    sql: ${TABLE}.ExpeditionId ;;
  }

  dimension: expedition_reference {
    type: string
    sql: ${TABLE}.ExpeditionReference ;;
  }

  dimension: expedition_status_code {
    type: string
    sql: ${TABLE}.ExpeditionStatusCode ;;
  }

  dimension: expedition_status_label_fr {
    type: string
    sql: ${TABLE}.ExpeditionStatusLabelFR ;;
  }

  dimension: expedition_status_label_nl {
    type: string
    sql: ${TABLE}.ExpeditionStatusLabelNL ;;
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

  dimension: pk_ereg_expedition {
    type: string
    sql: ${TABLE}.PK_EregExpedition ;;
  }

  dimension: sys_insert_update_date {
    type: string
    sql: ${TABLE}.Sys_InsertUpdateDate ;;
  }

  measure: count {
    type: count
    drill_fields: [m_job_run.m_job_run_id, m_job_run.m_job_name, m_model_run.m_model_run_id, m_model_run.m_model_name]
  }
}

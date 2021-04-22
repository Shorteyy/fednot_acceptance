view: ereg_vw_dim_party_right_type {
  sql_table_name: `dwh.ereg_vwDimPartyRightType`
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

  dimension: party_right_type_code {
    type: string
    sql: ${TABLE}.PartyRightTypeCode ;;
  }

  dimension: party_right_type_label_fr {
    type: string
    sql: ${TABLE}.PartyRightTypeLabelFR ;;
  }

  dimension: party_right_type_label_nl {
    type: string
    sql: ${TABLE}.PartyRightTypeLabelNL ;;
  }

  dimension: pk_ereg_party_right_type {
    type: string
    sql: ${TABLE}.PK_EregPartyRightType ;;
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

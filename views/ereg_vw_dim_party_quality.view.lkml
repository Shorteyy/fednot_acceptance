view: ereg_vw_dim_party_quality {
  label: "Party Quality"
  sql_table_name: `dwh.ereg_vwDimPartyQuality`
    ;;

  # dimension_group: m_job_datetime {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.m_job_datetime ;;
  # }

  # dimension: m_job_run_id {
  #   type: string
  #   # hidden: yes
  #   sql: ${TABLE}.m_job_run_id ;;
  # }

  # dimension: m_model_run_id {
  #   type: string
  #   # hidden: yes
  #   sql: ${TABLE}.m_model_run_id ;;
  # }

  dimension: party_quality_category {
    type: string
    sql: ${TABLE}.PartyQualityCategory ;;
  }

  dimension: party_quality_category_label_fr {
    type: string
    sql: ${TABLE}.PartyQualityCategoryLabelFR ;;
  }

  dimension: party_quality_category_label_nl {
    type: string
    sql: ${TABLE}.PartyQualityCategoryLabelNL ;;
  }

  dimension: party_quality_code {
    type: string
    sql: ${TABLE}.PartyQualityCode ;;
  }

  dimension: party_quality_label_fr {
    type: string
    sql: ${TABLE}.PartyQualityLabelFR ;;
  }

  dimension: party_quality_label_nl {
    type: string
    sql: ${TABLE}.PartyQualityLabelNL ;;
  }

  dimension: pk_ereg_party_quality {
    type: string
    sql: ${TABLE}.PK_EregPartyQuality ;;
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

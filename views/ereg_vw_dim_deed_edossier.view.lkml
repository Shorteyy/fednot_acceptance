view: ereg_vw_dim_deed_edossier {
  label: "Deed eDossier"
  sql_table_name: `dwh.ereg_vwDimDeedEdossier`
    ;;

  dimension: deed_id {
    type: string
    sql: ${TABLE}.DeedId ;;
  }

  dimension: deed_reference {
    type: string
    sql: ${TABLE}.DeedReference ;;
  }

  dimension: edossier_id {
    type: string
    sql: ${TABLE}.EDossierId ;;
  }

  dimension: edossier_reference {
    type: string
    sql: ${TABLE}.EDossierReference ;;
  }

  dimension: is_deed_registered_aa {
    type: string
    sql: ${TABLE}.IsDeedRegisteredAA ;;
  }

  dimension: itprovider_name {
    type: string
    sql: ${TABLE}.ITProviderName ;;
  }

  dimension: last_deed_repertorium {
    type: string
    sql: ${TABLE}.LastDeedRepertorium ;;
  }

  dimension: last_deed_request_formality {
    type: string
    sql: ${TABLE}.LastDeedRequestFormality ;;
  }

  dimension: last_deed_request_formality_label_fr {
    type: string
    sql: ${TABLE}.LastDeedRequestFormalityLabelFR ;;
  }

  dimension: last_deed_request_formality_label_nl {
    type: string
    sql: ${TABLE}.LastDeedRequestFormalityLabelNL ;;
  }

  dimension: last_deed_size {
    type: string
    sql: ${TABLE}.LastDeedSize ;;
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

  dimension: pk_ereg_deed_edossier {
    type: string
    sql: ${TABLE}.PK_EregDeedEdossier ;;
  }

  dimension: sys_insert_update_date {
    type: string
    sql: ${TABLE}.Sys_InsertUpdateDate ;;
  }

  measure: count {
    type: count
    drill_fields: [itprovider_name, m_job_run.m_job_run_id, m_job_run.m_job_name, m_model_run.m_model_run_id, m_model_run.m_model_name]
  }
}

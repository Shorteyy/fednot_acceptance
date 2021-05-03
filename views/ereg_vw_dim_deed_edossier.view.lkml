view: ereg_vw_dim_deed_edossier {
  label: "Deed eDossier"
  sql_table_name: `dwh.ereg_vwDimDeedEdossier`
    ;;

  parameter: pick_language {
    type: string
    allowed_value: { value: "NL" }
    allowed_value: { value: "FR" }
  }

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
    hidden: no
    type: string
    sql: ${TABLE}.LastDeedRequestFormality ;;
  }

  dimension: last_deed_request_formality_label_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.LastDeedRequestFormalityLabelFR ;;
  }

  dimension: last_deed_request_formality_label_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.LastDeedRequestFormalityLabelNL ;;
  }

  dimension: last_deed_request_formality_label {
    label: "Last Deed Request Formality Label"
    label_from_parameter: pick_language
    sql:
        {% if pick_language._parameter_value == "'NL'" %}
          IF(${last_deed_request_formality_label_nl} = "NULL",${last_deed_request_formality_label_fr},${last_deed_request_formality_label_nl})
        {% elsif pick_language._parameter_value == "'FR'" %}
          IF(${last_deed_request_formality_label_fr} = "NULL",${last_deed_request_formality_label_nl },${last_deed_request_formality_label_fr})
         {% else %}
          coalesce(${last_deed_request_formality_label_nl},${last_deed_request_formality_label_fr})
        {% endif %};;
  }

  dimension: last_deed_size {
    type: string
    sql: ${TABLE}.LastDeedSize ;;
  }

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

  dimension: pk_ereg_deed_edossier {
    hidden: yes
    type: string
    sql: ${TABLE}.PK_EregDeedEdossier ;;
  }

  # dimension: sys_insert_update_date {
  #   type: string
  #   sql: ${TABLE}.Sys_InsertUpdateDate ;;
  # }

  measure: count {
    hidden:  yes
    type: count
    drill_fields: []
  }
}

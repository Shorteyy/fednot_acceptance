view: ereg_vw_dim_expedition {
  label: "Expedition"
  sql_table_name: `dwh.ereg_vwDimExpedition`
    ;;

  parameter: pick_language {
    label: "Expedition Language Selector"
    type: string
    allowed_value: { value: "NL" }
    allowed_value: { value: "FR" }
  }

  dimension: expedition_change_mode_code {
    type: string
    sql: ${TABLE}.ExpeditionChangeModeCode ;;
  }

  dimension: expedition_change_mode_label_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.ExpeditionChangeModeLabelFR ;;
  }

  dimension: expedition_change_mode_label_nl {
    hidden:  yes
    type: string
    sql: ${TABLE}.ExpeditionChangeModeLabelNL ;;
  }

  dimension: expedition_change_mode_label {
       label_from_parameter: pick_language
    sql:
        {% if pick_language._parameter_value == "'NL'" %}
          IF(${expedition_change_mode_label_nl} = "NULL",${expedition_change_mode_label_fr},${expedition_change_mode_label_nl})
        {% elsif pick_language._parameter_value == "'FR'" %}
          IF(${expedition_change_mode_label_fr} = "NULL",${expedition_change_mode_label_nl },${expedition_change_mode_label_fr})
         {% else %}
          coalesce(${expedition_change_mode_label_nl},${expedition_change_mode_label_fr})
        {% endif %};;
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
    hidden: yes
    type: string
    sql: ${TABLE}.ExpeditionStatusLabelFR ;;
  }

  dimension: expedition_status_label_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.ExpeditionStatusLabelNL ;;
  }

  dimension: expedition_status_label {
    label_from_parameter: pick_language
    sql:
    {% if pick_language._parameter_value == "'NL'" %}
    IF(${expedition_status_label_nl} = "NULL",${expedition_status_label_fr},${expedition_status_label_nl})
    {% elsif pick_language._parameter_value == "'FR'" %}
    IF(${expedition_status_label_fr} = "NULL",${expedition_status_label_nl},${expedition_status_label_fr})
    {% else %}
    coalesce(${expedition_status_label_nl},${expedition_status_label_fr})
    {% endif %};;
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

  dimension: pk_ereg_expedition {
     hidden:  yes
     type: string
     sql: ${TABLE}.PK_EregExpedition ;;
  }

  # dimension: sys_insert_update_date {
  #   type: string
  #   sql: ${TABLE}.Sys_InsertUpdateDate ;;
  # }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}

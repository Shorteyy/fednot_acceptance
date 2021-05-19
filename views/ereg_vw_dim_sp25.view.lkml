view: ereg_vw_dim_sp25 {
  label: "Dim SP25"
  sql_table_name: `dwh.ereg_vwDimSP25`
    ;;

  parameter: pick_language {
    label: "SP25 Language Selector"
    type: string
    allowed_value: { value: "NL" }
    allowed_value: { value: "FR" }
  }

  dimension: sp25_label {
    label_from_parameter: pick_language
    sql:
        {% if pick_language._parameter_value == "'NL'" %}
          IF(${sp25_label_nl} = "NULL",${sp25_label_fr},${sp25_label_nl})
        {% elsif pick_language._parameter_value == "'FR'" %}
          IF(${sp25_label_fr} = "NULL",${sp25_label_nl},${sp25_label_fr})
         {% else %}
          coalesce(${sp25_label_nl},${sp25_label_fr})
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

  dimension: pk_ereg_sp25 {
    hidden: yes
    type: string
    sql: ${TABLE}.PK_EregSP25 ;;
  }

  dimension: sp25_code {
    type: string
    sql: ${TABLE}.SP25Code ;;
  }

  dimension: sp25_label_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.SP25LabelFR ;;
  }

  dimension: sp25_label_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.SP25LabelNL ;;
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

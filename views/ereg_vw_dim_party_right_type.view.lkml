view: ereg_vw_dim_party_right_type {
  label: "Party"
  sql_table_name: `dwh.ereg_vwDimPartyRightType`
    ;;

  parameter: pick_language_right_type {
    label: "Party Right Type Language Selector"
    type: string
    allowed_value: { value: "NL" }
    allowed_value: { value: "FR" }
  }

  dimension: party_right_type_label {
    group_label: "Right Type"
    group_item_label: "Label"
    label_from_parameter: pick_language_right_type
    sql:
        {% if pick_language_right_type._parameter_value == "'NL'" %}
          IF(${party_right_type_label_nl} = "NULL",${party_right_type_label_fr},${party_right_type_label_nl})
        {% elsif pick_language_right_type._parameter_value == "'FR'" %}
          IF(${party_right_type_label_fr} = "NULL",${party_right_type_label_nl },${party_right_type_label_fr})
         {% else %}
          coalesce(${party_right_type_label_nl},${party_right_type_label_fr})
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

  dimension: party_right_type_code {
    group_label: "Right Type"
    group_item_label: "Code"
    type: string
    sql: ${TABLE}.PartyRightTypeCode ;;
  }

  dimension: party_right_type_label_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.PartyRightTypeLabelFR ;;
  }

  dimension: party_right_type_label_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.PartyRightTypeLabelNL ;;
  }

  dimension: pk_ereg_party_right_type {
    hidden: yes
    type: string
    sql: ${TABLE}.PK_EregPartyRightType ;;
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

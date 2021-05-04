view: ereg_vw_dim_party_quality {
  label: "Party"
  sql_table_name: `dwh.ereg_vwDimPartyQuality`
    ;;

  parameter: pick_language_quality {
    type: string
    allowed_value: { value: "NL" }
    allowed_value: { value: "FR" }
  }

  dimension: party_quality_category_label {
    group_label: "Quality"
    group_item_label: "Category"
    label_from_parameter: pick_language_quality
    sql:
        {% if pick_language_quality._parameter_value == "'NL'" %}
          IF(${party_quality_category_label_nl} = "NULL",${party_quality_category_label_fr},${party_quality_category_label_nl})
        {% elsif pick_language_quality._parameter_value == "'FR'" %}
          IF(${party_quality_category_label_fr} = "NULL",${party_quality_category_label_nl },${party_quality_category_label_fr})
         {% else %}
          coalesce(${party_quality_category_label_nl},${party_quality_category_label_fr})
        {% endif %};;
  }

  dimension: party_quality_label {
    group_label: "Quality"
    group_item_label: "Label"
    label_from_parameter: pick_language_quality
    sql:
        {% if pick_language_quality._parameter_value == "'NL'" %}
          IF(${party_quality_label_nl} = "NULL",${party_quality_label_fr},${party_quality_label_nl})
        {% elsif pick_language_quality._parameter_value == "'FR'" %}
          IF(${party_quality_label_fr} = "NULL",${party_quality_label_nl },${party_quality_label_fr})
         {% else %}
          coalesce(${party_quality_label_nl},${party_quality_label_fr})
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

  dimension: party_quality_category {
    hidden: yes
    type: string
    sql: ${TABLE}.PartyQualityCategory ;;
  }

  dimension: party_quality_category_label_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.PartyQualityCategoryLabelFR ;;
  }

  dimension: party_quality_category_label_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.PartyQualityCategoryLabelNL ;;
  }

  dimension: party_quality_code {
    group_label: "Quality"
    group_item_label: "Code"
    type: string
    sql: ${TABLE}.PartyQualityCode ;;
  }

  dimension: party_quality_label_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.PartyQualityLabelFR ;;
  }

  dimension: party_quality_label_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.PartyQualityLabelNL ;;
  }

  dimension: pk_ereg_party_quality {
    hidden: yes
    type: string
    sql: ${TABLE}.PK_EregPartyQuality ;;
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

view: ereg_vw_dim_transaction_type {
  label: "Transaction Type"
  sql_table_name: `dwh.ereg_vwDimTransactionType`
    ;;

  parameter: pick_language {
    label: "Transaction Type Language Selector"
    type: string
    allowed_value: { value: "NL" }
    allowed_value: { value: "FR" }
  }

  dimension: category_label {
    label_from_parameter: pick_language
    label: "Category"
    sql:
        {% if pick_language._parameter_value == "'NL'" %}
          IF(${category_label_nl} = "NULL",${category_label_fr},${category_label_nl})
        {% elsif pick_language._parameter_value == "'FR'" %}
          IF(${category_label_fr} = "NULL",${category_label_nl},${category_label_fr})
         {% else %}
          coalesce(${category_label_nl},${category_label_fr})
        {% endif %};;
  }

  dimension: sub_category_label {
    label_from_parameter: pick_language
    label: "Deed Type"
    sql:
        {% if pick_language._parameter_value == "'NL'" %}
          IF(${sub_category_label_nl} = "NULL",${sub_category_label_fr},${sub_category_label_nl})
        {% elsif pick_language._parameter_value == "'FR'" %}
          IF(${sub_category_label_fr} = "NULL",${sub_category_label_nl},${sub_category_label_fr})
         {% else %}
          coalesce(${sub_category_label_nl},${sub_category_label_fr})
        {% endif %};;
  }

  dimension: transaction_type_family_label {
    label_from_parameter: pick_language
    label: "Family"
    sql:
        {% if pick_language._parameter_value == "'NL'" %}
          IF(${transaction_type_family_label_nl} = "NULL",${transaction_type_family_label_fr},${transaction_type_family_label_nl})
        {% elsif pick_language._parameter_value == "'FR'" %}
          IF(${transaction_type_family_label_fr} = "NULL",${transaction_type_family_label_nl},${transaction_type_family_label_fr})
         {% else %}
          coalesce(${transaction_type_family_label_nl},${transaction_type_family_label_fr})
        {% endif %};;
  }

  dimension: category_code {
    hidden: yes
    type: string
    sql: ${TABLE}.CategoryCode ;;
  }

  dimension: category_label_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.CategoryLabelFR ;;
  }

  dimension: category_label_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.CategoryLabelNL ;;
  }

  dimension: is_good_mandatory {
    type: string
    sql: ${TABLE}.IsGoodMandatory ;;
  }

  dimension: notary_business_line {
    type: string
    sql: ${TABLE}.notaryBusiness ;;
  }

  dimension: notarial_act_type {
    type: string
    sql: ${TABLE}.akteTypeBusinessLayer ;;
  }

  dimension: is_vlabel_concerned {
    type: string
    sql: ${TABLE}.IsVlabelConcerned ;;
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
  #}

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

  dimension: party_implication_description {
    type: string
    sql: ${TABLE}.PartyImplicationDescription ;;
  }

  dimension: pk_ereg_transaction_type {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.PK_EregTransactionType ;;
  }

  dimension: sub_category_code {
    hidden: yes
    type: string
    sql: ${TABLE}.SubCategoryCode ;;
  }

  dimension: sub_category_label_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.SubCategoryLabelFR ;;
  }

  dimension: sub_category_label_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.SubCategoryLabelNL ;;
  }

  # dimension: sys_insert_update_date {
  #   type: string
  #   sql: ${TABLE}.Sys_InsertUpdateDate ;;
  # }

  dimension: transaction_type_code {
    hidden: yes
    type: string
    sql: ${TABLE}.TransactionTypeCode ;;
  }

  dimension: transaction_type_family {
    hidden:  yes
    type: string
    sql: ${TABLE}.TransactionTypeFamily ;;
  }

  dimension: transaction_type_family_label_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.TransactionTypeFamilyLabelFR ;;
  }

  dimension: transaction_type_family_label_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.TransactionTypeFamilyLabelNL ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }

}

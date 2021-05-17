view: dim_application {
  label: "Application"
  sql_table_name: `dwh.dim_application`
    ;;

  parameter: pick_language {
    label: "Operation Language Selector"
    type: string
    allowed_value: { value: "NL" }
    allowed_value: { value: "FR" }
  }

  parameter: operation_group_picker {
    label: "Operation Group Selector"
    type: unquoted
    allowed_value: { value: "Application" }
    allowed_value: { value: "Business_Group" }
    allowed_value: { value: "Notary_Business" }
  }

  dimension: application_code {
    drill_fields: [description]
    label: "Application"
    type: string
    sql: ${TABLE}.applicationCode ;;
  }

  dimension: business_group {
    drill_fields: [description]
    type: string
    sql: ${TABLE}.businessGroup ;;
  }

  dimension: description_fr {
    type: string
    hidden: yes
    sql: ${TABLE}.descriptionFr ;;
  }

  dimension: description_nl {
    type: string
    hidden: yes
    sql: ${TABLE}.descriptionNl ;;
  }

  dimension: description {
    label: "Operation Description"
    label_from_parameter: pick_language
    sql:
        {% if pick_language._parameter_value == "'NL'" %}
          ${description_nl}
        {% elsif pick_language._parameter_value == "'FR'" %}
          ${description_fr}
         {% else %}
           ${description_nl}
        {% endif %};;
  }

  dimension: dim_application_sk {
    type: string
    hidden: yes
    sql: ${TABLE}.dim_application_sk ;;
  }

  dimension: h_application_bk {
    label: "Operation"
    type: string
    hidden: yes
    sql: ${TABLE}.h_application_bk ;;
  }

  dimension: is_itapplication {
    drill_fields: [application_code, description]
    label: "IT Application"
    type: yesno
    sql: ${TABLE}.isITApplication ;;
  }

 dimension: notary_business {
    label: "Notary Business"
    drill_fields: [description]
    type: string
    sql: ${TABLE}.notaryBusiness ;;
  }

  dimension: operation_group {
    label_from_parameter: operation_group_picker
    type: string
    sql:
    {% if operation_group_picker._parameter_value == 'Application'  %}
      ${application_code}
    {% elsif operation_group_picker._parameter_value == 'Business_Group' %}
      ${business_group}
      {% elsif operation_group_picker._parameter_value == 'Notary_Business' %}
      ${notary_business}
    {% else %}
      ${application_code}
    {% endif %};;
  }

  dimension: row_current {
    type: number
    hidden: yes
    sql: ${TABLE}.row_current ;;
  }

  # dimension_group: row_end_dt {
  #   type: time
  #   hidden: yes
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.row_end_dt ;;
  # }

  # dimension_group: row_start_dt {
  #   type: time
  #   hidden: yes
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.row_start_dt ;;
  # }

  # dimension_group: row_start_dt_orig {
  #   type: time
  #   hidden: yes
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.row_start_dt_orig ;;
  # }

   # dimension: m_model_run_id {
  #   type: string
  #   hidden: yes
  #   sql: ${TABLE}.m_model_run_id ;;
  # }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}

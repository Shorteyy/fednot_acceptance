view: dim_application {
  sql_table_name: `dwh.dim_application`
    ;;

  parameter: pick_language {
    type: string
    allowed_value: { value: "NL" }
    allowed_value: { value: "FR" }
  }

  dimension: application_code {
    label: "Application"
    type: string
    sql: ${TABLE}.applicationCode ;;
  }

  dimension: business_group {
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
    label: "IT Application"
    type: yesno
    sql: ${TABLE}.isITApplication ;;
  }

  dimension: m_model_run_id {
    type: string
    hidden: yes
    sql: ${TABLE}.m_model_run_id ;;
  }

  dimension: notary_business {
    label: "Notary Group"
    type: string
    sql: ${TABLE}.notaryBusiness ;;
  }

  dimension: row_current {
    type: number
    hidden: yes
    sql: ${TABLE}.row_current ;;
  }

  dimension_group: row_end_dt {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.row_end_dt ;;
  }

  dimension_group: row_start_dt {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.row_start_dt ;;
  }

  dimension_group: row_start_dt_orig {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.row_start_dt_orig ;;
  }

  measure: count {
    type: count
    drill_fields: [m_model_run.m_model_run_id, m_model_run.m_model_name]
  }
}

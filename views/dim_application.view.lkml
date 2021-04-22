view: dim_application {
  sql_table_name: `dwh.dim_application`
    ;;

  dimension: application_code {
    type: string
    sql: ${TABLE}.applicationCode ;;
  }

  dimension: business_group {
    type: string
    sql: ${TABLE}.businessGroup ;;
  }

  dimension: description_fr {
    type: string
    sql: ${TABLE}.descriptionFr ;;
  }

  dimension: description_nl {
    type: string
    sql: ${TABLE}.descriptionNl ;;
  }

  dimension: dim_application_sk {
    type: string
    sql: ${TABLE}.dim_application_sk ;;
  }

  dimension: h_application_bk {
    type: string
    sql: ${TABLE}.h_application_bk ;;
  }

  dimension: is_itapplication {
    type: yesno
    sql: ${TABLE}.isITApplication ;;
  }

  dimension: m_model_run_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.m_model_run_id ;;
  }

  dimension: notary_business {
    type: string
    sql: ${TABLE}.notaryBusiness ;;
  }

  dimension: row_current {
    type: number
    sql: ${TABLE}.row_current ;;
  }

  dimension_group: row_end_dt {
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
    sql: ${TABLE}.row_end_dt ;;
  }

  dimension_group: row_start_dt {
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
    sql: ${TABLE}.row_start_dt ;;
  }

  dimension_group: row_start_dt_orig {
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
    sql: ${TABLE}.row_start_dt_orig ;;
  }

  measure: count {
    type: count
    drill_fields: [m_model_run.m_model_run_id, m_model_run.m_model_name]
  }
}

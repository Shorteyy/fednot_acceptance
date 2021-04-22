view: fact_prestation {
  sql_table_name: `dwh.fact_prestation`
    ;;

  dimension: dim_application_sk {
    type: string
    sql: ${TABLE}.dim_application_sk ;;
  }

  dimension_group: dim_days_sk {
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
    sql: ${TABLE}.dim_days_sk ;;
  }

  dimension: dim_notary_office_sk {
    type: string
    sql: ${TABLE}.dim_notaryOffice_sk ;;
  }

  dimension: dim_province_sk {
    type: string
    sql: ${TABLE}.dim_province_sk ;;
  }

  dimension: m_model_run_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.m_model_run_id ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
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

  dimension: year_month {
    type: string
    sql: ${TABLE}.yearMonth ;;
  }

  measure: count {
    type: count
    drill_fields: [m_model_run.m_model_run_id, m_model_run.m_model_name]
  }
}

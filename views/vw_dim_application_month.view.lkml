view: vw_dim_application_month {
  sql_table_name: `dwh.vw_dim_application_month`
    ;;

  dimension: dim_application_sk {
    type: string
    sql: ${TABLE}.dim_application_sk ;;
  }

  dimension: h_application_bk {
    type: string
    sql: ${TABLE}.h_application_bk ;;
  }

  dimension: h_operation_bk {
    type: string
    sql: ${TABLE}.h_operation_bk ;;
  }

  dimension: operation_description_fr {
    type: string
    sql: ${TABLE}.operationDescriptionFr ;;
  }

  dimension: operation_description_nl {
    type: string
    sql: ${TABLE}.operationDescriptionNl ;;
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

  # dimension: row_start_dt_month2 {
  #   type: string
  #   sql: ${TABLE}.row_start_dt_month ;;
  # }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: vw_dim_application {
  sql_table_name: `dwh.vw_dim_application`
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

  dimension: row_end {
    type: string
    sql: ${TABLE}.row_end ;;
  }

  dimension: row_start {
    type: string
    sql: ${TABLE}.row_start ;;
  }

  dimension: row_start_dt_month {
    type: string
    sql: ${TABLE}.row_start_dt_month ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

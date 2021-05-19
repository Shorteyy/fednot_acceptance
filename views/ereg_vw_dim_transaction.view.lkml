view: ereg_vw_dim_transaction {
  label: "Dim Transaction"
  sql_table_name: `dwh.ereg_vwDimTransaction`
    ;;

  dimension: is_main_transaction {
    type: string
    sql: ${TABLE}.isMainTransaction ;;
  }

  dimension: pk_ereg_transaction {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.PK_EregTransaction ;;
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.TransactionId ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}

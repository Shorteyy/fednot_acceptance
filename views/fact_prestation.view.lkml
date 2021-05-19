view: fact_prestation {
  sql_table_name: `dwh.fact_prestation`
    ;;

  dimension: dim_application_sk {
    hidden: yes
    type: string
    sql: ${TABLE}.dim_application_sk ;;
  }

  dimension: dim_days_sk {
    hidden: yes
    type: date
    sql: CAST(${TABLE}.dim_days_sk as date) ;;
  }

  dimension: dim_notary_office_sk {
    hidden: yes
    type: string
    sql: ${TABLE}.dim_notaryOffice_sk ;;
  }

  dimension: dim_province_sk {
    hidden: yes
    type: string
    sql: ${TABLE}.dim_province_sk ;;
  }

  dimension: prestation_compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(cast(${TABLE}.dim_days_sk as string ), ${TABLE}.dim_notaryOffice_sk, ${TABLE}.dim_province_sk, ${TABLE}.dim_application_sk ) ;;
  }

  dimension: is_ytd {
    type: yesno
    label: "Compare YTD"
    sql: EXTRACT(MONTH from ${dim_days_sk}) < EXTRACT(MONTH from CURRENT_TIMESTAMP) ;;
  }

  dimension: qty {
    hidden: yes
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: amount {
    hidden: yes
    type: number
    sql: ${TABLE}.amountWVAT ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: sum_qty {
    label: "# Operations"
    type: sum
    sql: ${qty} ;;
  }

  measure: sum_amount {
    label: "Amount"
    type: sum
    sql: ${amount} ;;
    value_format:"€#,##0.00;-€#,##0.00"
  }

  measure: avg_qty {
    label: "Average # Operations"
    type:  average
    sql: ${qty} ;;
  }

  measure: avg_amount {
    label: "Average Amount"
    type:  average
    sql: ${amount} ;;
    value_format:"€#,##0.00;-€#,##0.00"
  }

  measure: percent_of_total_operations {
    label: "% of Total Operations"
    type: percent_of_total
    value_format: "0.00\%"
    sql: ${sum_qty} ;;
  }

  measure: percent_of_total_amount {
    label: "% of Total Amount"
    type: percent_of_total
    value_format: "0.00\%"
    sql: ${sum_amount} ;;
  }

  measure: total_sum_ytd {
    label: "# Operations YTD"
    type: sum
    filters: {
      field: is_ytd
      value: "yes"
    }
    sql: ${qty} ;;
  }

  measure: total_amount_ytd {
    label: "Amount YTD"
    type: sum
    filters: {
      field: is_ytd
      value: "yes"
    }
    sql: ${amount} ;;
    value_format:"€#,##0.00;-€#,##0.00"
  }
}

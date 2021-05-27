view: fact_izimi_vaults {
  label: "Measures"
  sql_table_name: `dwh.fact_izimiVaults`
    ;;

  dimension: dim_days_sk {
    hidden: yes
    type: date
    sql: ${TABLE}.dim_days_sk ;;
  }

  dimension: dim_izimiuser_sk {
    hidden: yes
    type: string
    sql: ${TABLE}.dim_izimiuser_sk ;;
  }

  dimension: dim_izimivault_sk {
    hidden: yes
    type: string
    sql: ${TABLE}.dim_izimivault_sk ;;
  }

  dimension: h_izimi_user_bk {
    label: "User"
    hidden: yes
    type: number
    sql: ${TABLE}.h_izimi_user_bk ;;
  }

  dimension: h_izimi_vault_bk {
    label: "Vault"
    hidden: yes
    type: number
    sql: ${TABLE}.h_izimi_vault_bk ;;
  }

  dimension: max_size {
    hidden: yes
    type: number
    sql: ${TABLE}.maxSize ;;
  }

  dimension: quantity {
    hidden: yes
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: registered {
    hidden: yes
    type: date
    sql: ${TABLE}.registeredOn ;;
  }

  dimension: used_size {
    hidden: yes
    type: number
    sql: ${TABLE}.usedSize ;;
  }

  measure: used_size_vault {
    label: "Used Size"
    type: sum
    sql: ${used_size} ;;
    drill_fields: []
  }

  measure: max_size_vault {
    label: "Max Size"
    type: sum
    sql: ${max_size} ;;
    drill_fields: []
  }

  measure: avg_max_size_vault {
    label: "Avg Max Size"
    type: average
    sql: ${max_size} ;;
    drill_fields: []
  }

  measure: avg_used_size_vault {
    label: "Avg Used Size"
    type: average
    sql: ${used_size} ;;
    drill_fields: []
  }

  measure: vault_quantity {
    label: "Quantity"
    type: sum
    sql: ${quantity} ;;
    drill_fields: []
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

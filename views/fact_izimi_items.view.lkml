view: fact_izimi_items {
  label: "Measures"
  sql_table_name: `dwh.fact_izimiItems`
    ;;

  dimension: dim_days_sk {
    hidden: yes
    type: date
    sql: ${TABLE}.dim_days_sk ;;
  }

  dimension: dim_izimi_category_group_sk {
    hidden: yes
    type: string
    sql: ${TABLE}.dim_izimiCategoryGroup_sk ;;
  }

  dimension: dim_izimi_item_sk {
    hidden: yes
    type: string
    sql: ${TABLE}.dim_izimiItem_sk ;;
  }

  dimension: dim_izimi_vault_sk {
    hidden: yes
    type: string
    sql: ${TABLE}.dim_izimiVault_sk ;;
  }

  dimension: item_compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(cast(${TABLE}.dim_izimiItem_sk as string ), cast(${TABLE}.dim_izimiVault_sk as string) ;;
  }

  dimension: h_izimi_category_group_bk {
    label: "Category Group"
    hidden: yes
    type: string
    sql: ${TABLE}.h_izimi_category_group_bk ;;
  }

  dimension: h_izimi_item_bk {
    label: "Item"
    hidden: yes
    type: number
    sql: ${TABLE}.h_izimi_item_bk ;;
  }

  dimension: h_izimi_vault_bk {
    hidden: yes
    label: "Vault"
    type: number
    sql: ${TABLE}.h_izimi_vault_bk ;;
  }

  dimension: size {
    hidden: yes
    type: number
    sql: ${TABLE}.size ;;
  }

  dimension: quantity {
    hidden: yes
    type: number
    sql: ${TABLE}.quantity ;;
  }

  measure: size_item {
    label: "Item Size"
    type: sum
    sql: ${size} ;;
    drill_fields: []
  }

  measure: item_quantity {
    label: "Item Quantity"
    type: sum
    sql: ${quantity} ;;
    drill_fields: []
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}

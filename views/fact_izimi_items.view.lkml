view: fact_izimi_items {
  label: "Measures"
  sql_table_name: `dwh.fact_izimiItems`
    ;;

  dimension: dim_days_sk {
    hidden: yes
    type: date
    sql: CAST(${TABLE}.dim_days_sk as date);;
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

  # dimension: m_model_exec_id {
  #   type: string
  #   sql: ${TABLE}.m_model_exec_id ;;
  # }

  # dimension_group: s_izimi_item_category_vault_load_dt {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.s_izimi_item_category_vault_load_dt ;;
  # }

  dimension: size {
    hidden: yes
    type: number
    sql: ${TABLE}.size ;;
  }

  measure: size_item {
    label: "Size"
    type: sum
    sql: ${size} ;;
    drill_fields: []
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

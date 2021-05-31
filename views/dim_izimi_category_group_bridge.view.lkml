view: dim_izimi_category_group_bridge {
  sql_table_name: `dwh.dim_izimiCategoryGroupBridge`
    ;;

  dimension: dim_izimi_category_group_bridge_sk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.dim_izimiCategoryGroupBridge_sk ;;
  }

  dimension: h_izimi_category_group_bk {
    label: "Category Group"
    type: string
    sql: ${TABLE}.h_izimi_category_group_bk ;;
  }

  dimension: izimi_category {
    label: "Category"
    type: string
    sql: ${TABLE}.izimi_category ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}

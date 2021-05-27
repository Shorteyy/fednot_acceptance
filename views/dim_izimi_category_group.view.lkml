view: dim_izimi_category_group {
  label: "Dimensions"
  sql_table_name: `dwh.dim_izimiCategoryGroup`
    ;;

  dimension: dim_izimi_category_group_sk {
    hidden: yes
    type: string
    sql: ${TABLE}.dim_izimiCategoryGroup_sk ;;
  }

  dimension: h_izimi_category_group_bk {
    label: "Category Group"
    type: string
    sql: ${TABLE}.h_izimi_category_group_bk ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}

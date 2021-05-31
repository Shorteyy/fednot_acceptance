view: dim_izimi_category {
  label: "Dimensions"
  sql_table_name: `dwh.dim_izimiCategory`
    ;;

  dimension: dim_izimi_category_sk {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.dim_izimiCategory_sk ;;
  }

  dimension: h_izimi_category_bk {
    label: "Category"
    type: string
    sql: ${TABLE}.h_izimi_category_bk ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}

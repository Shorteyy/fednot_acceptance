view: dim_selling_type {
  label: "Dimensions"
  sql_table_name: `dwh.dbo_vwDimSellingType`
    ;;

  dimension: pk_selling_type {
    group_label: "Selling Type"
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.PK_SellingType ;;
  }

  dimension: selling_type_name {
    label: "Selling Type"
    type: string
    sql: ${TABLE}.SellingTypeName ;;
  }

  measure: count {
    group_label: "Selling Type"
    hidden: yes
    type: count
    drill_fields: [selling_type_name]
  }
}

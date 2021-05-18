view: dim_selling_type {
  sql_table_name: `dwh.dbo_vwDimSellingType`
    ;;

  dimension: pk_selling_type {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.PK_SellingType ;;
  }

  dimension: selling_type_name {
    type: string
    sql: ${TABLE}.SellingTypeName ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [selling_type_name]
  }
}

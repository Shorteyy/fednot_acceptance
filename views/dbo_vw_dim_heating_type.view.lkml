view: dim_heating_type {
  sql_table_name: `dwh.dbo_vwDimHeatingType`
    ;;

  dimension: heating_type_code {
    hidden: yes
    type: number
    sql: ${TABLE}.HeatingTypeCode ;;
  }

  dimension: heating_type_name {
    type: string
    sql: ${TABLE}.HeatingTypeName ;;
  }

  dimension: pk_heating_type {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.PK_HeatingType ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [heating_type_name]
  }
}

view: dim_pebtype {
  sql_table_name: `dwh.dbo_vwDIMPEBType`
    ;;

  dimension: peb_consumption_interval {
    type: string
    sql: ${TABLE}.PEB_ConsumptionInterval ;;
  }

  dimension: peb_type_bk {
    type: number
    sql: ${TABLE}.PEB_TypeBK ;;
  }

  dimension: peb_type_name {
    type: string
    sql: ${TABLE}.PEB_TypeName ;;
  }

  dimension: pk_pebtype {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.PK_PEBType ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [peb_type_name]
  }
}

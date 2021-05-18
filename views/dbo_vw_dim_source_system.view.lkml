view: dim_source_system {
  sql_table_name: `dwh.dbo_vwDimSourceSystem`
    ;;

  dimension: pk_source_system {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.PK_SourceSystem ;;
  }

  dimension: source_name {
    type: string
    sql: ${TABLE}.sourceName ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [source_name]
  }
}

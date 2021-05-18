view: dim_property_type {
  sql_table_name: `dwh.dbo_vwDimPropertyType`
    ;;

  dimension: is_in_asf {
    type: number
    sql: ${TABLE}.isInASF ;;
  }

  dimension: is_in_vgp {
    type: number
    sql: ${TABLE}.isInVGP ;;
  }

  dimension: pk_property_type {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.PK_PropertyType ;;
  }

  dimension: sub_type_name {
    type: string
    sql: ${TABLE}.subTypeName ;;
  }

  dimension: type_name {
    type: string
    sql: ${TABLE}.typeName ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [sub_type_name, type_name]
  }
}

view: dim_property_type {
  label: "Dimensions"
  sql_table_name: `dwh.dbo_vwDimPropertyType`
    ;;

  dimension: is_in_asf {
    group_label: "Property Type"
    hidden: yes
    type: number
    sql: ${TABLE}.isInASF ;;
  }

  dimension: is_in_vgp {
    group_label: "Property Type"
    hidden: yes
    type: number
    sql: ${TABLE}.isInVGP ;;
  }

  dimension: pk_property_type {
    group_label: "Property Type"
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.PK_PropertyType ;;
  }

  dimension: sub_type_name {
    group_label: "Property Type"
    hidden: yes
    type: string
    sql: ${TABLE}.subTypeName ;;
  }

  dimension: type_name {
    label: "Property Type"
    type: string
    sql: ${TABLE}.typeName ;;
  }

  measure: count {
    group_label: "Property Type"
    hidden: yes
    type: count
    drill_fields: [sub_type_name, type_name]
  }
}

view: dim_izimi_event_types {
  label: "Dimensions"
  sql_table_name: `dwh.dim_izimiEventTypes`
    ;;

  dimension: dim_izimievent_type_sk {
    hidden: yes
    type: string
    sql: ${TABLE}.dim_izimievent_type_sk ;;
  }

  dimension: event_type_category {
    group_label: "Event Type"
    type: string
    sql: ${TABLE}.eventTypeCategory ;;
  }

  dimension: event_type_name {
    group_label: "Event Type"
    type: string
    sql: ${TABLE}.eventTypeName ;;
  }

  dimension: event_type_version {
    group_label: "Event Type"
    type: number
    sql: ${TABLE}.eventTypeVersion ;;
  }

  dimension: event_type_visibility {
    group_label: "Event Type"
    type: string
    sql: ${TABLE}.eventTypeVisibility ;;
  }

  dimension: h_izimi_event_type_bk {
    group_label: "Event Type"
    label: "Event Type"
    type: string
    sql: ${TABLE}.h_izimi_event_type_bk ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [event_type_name]
  }
}

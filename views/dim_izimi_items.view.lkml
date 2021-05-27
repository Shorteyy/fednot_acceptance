view: dim_izimi_items {
  label: "Dimensions"
  sql_table_name: `dwh.dim_izimiItems`
    ;;

  dimension: confidentiality_level {
    group_label: "Item"
    type: string
    sql: ${TABLE}.confidentialityLevel ;;
  }

  dimension: dim_izimiitem_sk {
    hidden: yes
    type: string
    sql: ${TABLE}.dim_izimiitem_sk ;;
  }

  dimension: h_izimi_item_bk {
    group_label: "Item"
    label: "Document"
    type: number
    sql: ${TABLE}.h_izimi_item_bk ;;
  }

  dimension_group: item_created {
    group_label: "Item"
    label: "Document Created"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.itemCreatedOn ;;
  }

  dimension_group: item_event_ts {
    group_label: "Item"
    label: "Item Event"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.itemEventTs ;;
  }

  dimension: item_mime_type {
    group_label: "Item"
    type: string
    sql: ${TABLE}.itemMimeType ;;
  }

  dimension_group: item_modified {
    group_label: "Item"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.itemModifiedOn ;;
  }

  dimension: record_type {
    group_label: "Item"
    type: string
    sql: ${TABLE}.recordType ;;
  }

  dimension: scanning_state {
    group_label: "Item"
    type: string
    sql: ${TABLE}.scanningState ;;
  }

  dimension: size {
    group_label: "Item"
    type: number
    sql: ${TABLE}.size ;;
  }

  dimension: upload_source {
    group_label: "Item"
    type: string
    sql: ${TABLE}.uploadSource ;;
  }

  dimension: uri {
    group_label: "Item"
    type: string
    sql: ${TABLE}.uri ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}

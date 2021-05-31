view: dim_izimi_items {
  label: "Dimensions"
  sql_table_name: `dwh.dim_izimiItems`
    ;;

  dimension: confidentiality_level {
    group_label: "Document"
    type: string
    sql: ${TABLE}.confidentialityLevel ;;
  }

  dimension: dim_izimiitem_sk {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.dim_izimiitem_sk ;;
  }

  dimension: h_izimi_item_bk {
    group_label: "Document"
    label: "Document"
    type: number
    sql: ${TABLE}.h_izimi_item_bk ;;
  }

  dimension_group: item_created {
    group_label: "Document"
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
    group_label: "Document"
    label: "Document Event"
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
    group_label: "Document"
    label: "Document Mime Type"
    type: string
    sql: ${TABLE}.itemMimeType ;;
  }

  dimension_group: item_modified {
    group_label: "Document"
    label: "Document Modified"
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
    group_label: "Document"
    label: "Document Type"
    type: string
    sql: ${TABLE}.recordType ;;
  }

  dimension: scanning_state {
    group_label: "Document"
    type: string
    sql: ${TABLE}.scanningState ;;
  }

  dimension: size {
    group_label: "Document"
    type: number
    sql: ${TABLE}.size ;;
  }

  dimension: upload_source {
    group_label: "Document"
    type: string
    sql: ${TABLE}.uploadSource ;;
  }

  dimension: uri {
    group_label: "Document"
    type: string
    sql: ${TABLE}.uri ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}

view: fact_izimi_events {
  label: "Measures"
  sql_table_name: `dwh.fact_izimiEvents`
    ;;

  dimension: dim_days_sk {
    hidden: yes
    type: date
    sql: ${TABLE}.dim_days_sk ;;
  }

  dimension: dim_document_owner_sk {
    hidden: yes
    type: string
    sql: ${TABLE}.dim_document_owner_sk ;;
  }

  dimension: dim_izimi_vault_sk {
    hidden: yes
    type: string
    sql: ${TABLE}.dim_izimiVault_sk ;;
  }

  dimension: dim_izimievent_type_sk {
    hidden: yes
    type: string
    sql: ${TABLE}.dim_izimievent_type_sk ;;
  }

  dimension: dim_izimiuser_sk {
    hidden: yes
    type: string
    sql: ${TABLE}.dim_izimiuser_sk ;;
  }

  dimension: document_id {
    label: "Document ID"
    hidden: yes
    type: string
    sql: ${TABLE}.documentId ;;
  }

  dimension: document_owner_id {
    label: "Document Owner ID"
    hidden: yes
    type: string
    sql: ${TABLE}.documentOwnerId ;;
  }

  dimension: h_izimi_event_type_bk {
    hidden: yes
    label: "Event Type"
    type: string
    sql: ${TABLE}.h_izimi_event_type_bk ;;
  }

  dimension: h_izimi_user_id_bk {
    hidden: yes
    label: "User"
    type: string
    sql: ${TABLE}.h_izimi_user_id_bk ;;
  }

  dimension: h_izimi_vault_bk {
    label: "Vault"
    hidden: yes
    type: string
    sql: ${TABLE}.h_izimi_vault_bk ;;
  }

  dimension: quantity {
    hidden: yes
    type: number
    sql: ${TABLE}.quantity ;;
  }

  measure: qty {
    label: "Quantity"
    type: sum
    sql: ${quantity} ;;
    drill_fields: []
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: fact_izimi_vaults {
  label: "Measures"
  sql_table_name: `dwh.fact_izimiVaults`
    ;;

  dimension: dim_days_sk {
    hidden: yes
    type: date
    sql: ${TABLE}.dim_days_sk_vaultCreated ;;
  }

  dimension: dim_izimiuser_sk {
    hidden: yes
    type: string
    sql: ${TABLE}.dim_izimiuser_sk ;;
  }

  dimension: dim_izimivault_sk {
    hidden: yes
    type: string
    sql: ${TABLE}.dim_izimivault_sk ;;
  }

  dimension: vault_compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(cast(${TABLE}.dim_izimiuser_sk as string ), cast(${TABLE}.dim_izimivault_sk as string) ;;
  }

  dimension: h_izimi_user_bk {
    label: "User"
    hidden: yes
    type: number
    sql: ${TABLE}.h_izimi_user_bk ;;
  }

  dimension: h_izimi_vault_bk {
    label: "Vault"
    hidden: yes
    type: number
    sql: ${TABLE}.h_izimi_vault_bk ;;
  }

  dimension: max_size {
    hidden: yes
    type: number
    sql: ${TABLE}.maxSize ;;
  }

  dimension: registered {
    hidden: yes
    type: date
    sql: ${TABLE}.registeredOn ;;
  }

  dimension: used_size {
    hidden: yes
    type: number
    sql: ${TABLE}.usedSize ;;
  }

  dimension: quantity_preferred_notary {
    hidden: yes
    type: number
    sql: ${TABLE}.quantityPreferredNotary ;;
  }

  dimension: quantity_vault {
    hidden: yes
    type: number
    sql: ${TABLE}.quantityVaults ;;
  }

  dimension: quantity_document {
    hidden: yes
    type: number
    sql: ${TABLE}.quantityDocuments ;;
  }

  measure: used_size_vault {
    label: "Used Size"
    type: sum
    sql: ${used_size} ;;
    drill_fields: []
  }

  measure: max_size_vault {
    label: "Max Size"
    type: sum
    sql: ${max_size} ;;
    drill_fields: []
  }

  measure: avg_max_size_vault {
    label: "Avg Max Size"
    type: average
    sql: ${max_size} ;;
    drill_fields: []
  }

  measure: avg_used_size_vault {
    label: "Avg Used Size"
    type: average
    sql: ${used_size} ;;
    drill_fields: []
  }

  measure: quantity_vaults {
    label: "Quantity Vaults"
    type: sum
    sql: ${quantity_vault} ;;
    drill_fields: []
  }

  measure: quantity_documents {
    label: "Quantity Documents"
    type: sum
    sql: ${quantity_document} ;;
    drill_fields: []
  }

  measure: quantity_preffered_notaries {
    label: "Quantity Preferred Notary"
    type: sum
    sql: ${quantity_preferred_notary} ;;
    drill_fields: []
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}

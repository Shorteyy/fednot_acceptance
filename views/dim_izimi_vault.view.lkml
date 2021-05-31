view: dim_izimi_vault {
  label: "Dimensions"
  sql_table_name: `dwh.dim_izimiVault`
    ;;
  drill_fields: [id]

  dimension: id {
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: claim_expiry {
    group_label: "Vault"
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
    sql: ${TABLE}.claimExpiryDate ;;
  }

  dimension: claim_status {
    group_label: "Vault"
    type: string
    sql: ${TABLE}.claimStatus ;;
  }

  dimension: dim_izimi_vault_sk {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.dim_izimiVault_sk ;;
  }

  dimension: h_izimi_vault_bk {
    group_label: "Vault"
    label: "Vault"
    type: string
    sql: ${TABLE}.h_izimi_vault_bk ;;
  }

  dimension: max_size {
    hidden: yes
    group_label: "Vault"
    type: number
    sql: ${TABLE}.maxSize ;;
  }

  dimension: used_size {
    hidden: yes
    group_label: "Vault"
    type: number
    sql: ${TABLE}.usedSize ;;
  }

  dimension_group: vault_event_ts {
    group_label: "Vault"
    label: "Vault Event"
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
    sql: ${TABLE}.vaultEventTs ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [id]
  }

  measure: vault_used_size {
    hidden: yes
    type: sum
    sql: ${used_size} ;;
    }

  measure: vault_max_size {
    hidden: yes
    type: sum
    sql: ${max_size} ;;
    }
}

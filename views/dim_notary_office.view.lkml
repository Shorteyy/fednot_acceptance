view: dim_notary_office {
  label: "Dimensions"
  sql_table_name: `dwh.dim_notaryOffice`
    ;;

  dimension: address {
    group_label: "Notary Office"
    type: string
    # hidden: yes
    sql: ${TABLE}.address ;;
  }

  dimension: address_fr {
    group_label: "Notary Office"
    type: string
    hidden: yes
    sql: ${TABLE}.addressFr ;;
  }

  dimension: address_nl {
    group_label: "Notary Office"
    hidden: yes
    type: string
    sql: ${TABLE}.addressNl ;;
  }

  dimension: dim_notary_office_sk {
    group_label: "Notary Office"
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.dim_notaryOffice_sk ;;
  }

  dimension: h_notary_office_bk {
    group_label: "Notary Office"
    hidden: yes
    type: number
    sql: ${TABLE}.h_notaryOffice_bk ;;
  }

  dimension: municipality {
    group_label: "Notary Office"
    type: string
    sql: ${TABLE}.municipality ;;
  }

  dimension: municipality_fr {
    group_label: "Notary Office"
    hidden:  yes
    type: string
    sql: ${TABLE}.municipalityFr ;;
  }

  dimension: municipality_nl {
    group_label: "Notary Office"
    hidden:  yes
    type: string
    sql: ${TABLE}.municipalityNl ;;
  }

  dimension: notary_office_name {
    group_label: "Notary Office"
    type: string
    sql: ${TABLE}.notaryOfficeName ;;
  }

  dimension: postal_code {
    group_label: "Notary Office"
    type: number
    sql: ${TABLE}.postalCode ;;
  }

  dimension: row_current {
    group_label: "Notary Office"
    hidden: yes
    type: number
    sql: ${TABLE}.row_current ;;
  }

  measure: count {
    group_label: "Notary Office"
    type: count
    hidden: yes
    drill_fields: []
  }
}

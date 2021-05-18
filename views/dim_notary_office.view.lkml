view: dim_notary_office {
  label: "Notary Office"
  sql_table_name: `dwh.dim_notaryOffice`
    ;;

  dimension: address {
    type: string
    # hidden: yes
    sql: ${TABLE}.address ;;
  }

  dimension: address_fr {
    type: string
    hidden: yes
    sql: ${TABLE}.addressFr ;;
  }

  dimension: address_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.addressNl ;;
  }

  dimension: dim_notary_office_sk {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.dim_notaryOffice_sk ;;
  }

  dimension: h_notary_office_bk {
    hidden: yes
    type: number
    sql: ${TABLE}.h_notaryOffice_bk ;;
  }

  dimension: municipality {
    type: string
    sql: ${TABLE}.municipality ;;
  }

  dimension: municipality_fr {
    hidden:  yes
    type: string
    sql: ${TABLE}.municipalityFr ;;
  }

  dimension: municipality_nl {
    hidden:  yes
    type: string
    sql: ${TABLE}.municipalityNl ;;
  }

  dimension: notary_office_name {
    type: string
    sql: ${TABLE}.notaryOfficeName ;;
  }

  dimension: postal_code {
    type: number
    sql: ${TABLE}.postalCode ;;
  }

  dimension: row_current {
    hidden: yes
    type: number
    sql: ${TABLE}.row_current ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: []
  }
}

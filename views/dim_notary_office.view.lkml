view: dim_notary_office {
  sql_table_name: `dwh.dim_notaryOffice`
    ;;

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: address_fr {
    type: string
    sql: ${TABLE}.addressFr ;;
  }

  dimension: address_nl {
    type: string
    sql: ${TABLE}.addressNl ;;
  }

  dimension: dim_notary_office_sk {
    type: string
    sql: ${TABLE}.dim_notaryOffice_sk ;;
  }

  dimension: h_notary_office_bk {
    type: number
    sql: ${TABLE}.h_notaryOffice_bk ;;
  }

  dimension: m_model_run_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.m_model_run_id ;;
  }

  dimension: municipality {
    type: string
    sql: ${TABLE}.municipality ;;
  }

  dimension: municipality_fr {
    type: string
    sql: ${TABLE}.municipalityFr ;;
  }

  dimension: municipality_nl {
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
    type: number
    sql: ${TABLE}.row_current ;;
  }

  dimension_group: row_end_dt {
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
    sql: ${TABLE}.row_end_dt ;;
  }

  dimension_group: row_start_dt {
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
    sql: ${TABLE}.row_start_dt ;;
  }

  dimension_group: row_start_dt_orig {
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
    sql: ${TABLE}.row_start_dt_orig ;;
  }

  measure: count {
    type: count
    drill_fields: [notary_office_name, m_model_run.m_model_run_id, m_model_run.m_model_name]
  }
}

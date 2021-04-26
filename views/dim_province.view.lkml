view: dim_province {
  label: "Province"
  sql_table_name: `dwh.dim_province`
    ;;

  dimension: country_fr {
    type: string
    sql: ${TABLE}.countryFr ;;
  }

  dimension: country_lat {
    type: number
    sql: ${TABLE}.countryLat ;;
  }

  dimension: country_lon {
    type: number
    sql: ${TABLE}.countryLon ;;
  }

  dimension: country_nl {
    type: string
    sql: ${TABLE}.countryNl ;;
  }

  dimension: dim_province_sk {
    type: string
    sql: ${TABLE}.dim_province_sk ;;
  }

  dimension: h_province_bk {
    type: string
    sql: ${TABLE}.h_province_bk ;;
  }

  dimension: m_model_run_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.m_model_run_id ;;
  }

  dimension: province_fr {
    type: string
    sql: ${TABLE}.provinceFr ;;
  }

  dimension: province_lat {
    type: number
    sql: ${TABLE}.provinceLat ;;
  }

  dimension: province_lon {
    type: number
    sql: ${TABLE}.provinceLon ;;
  }

  dimension: province_nl {
    type: string
    sql: ${TABLE}.provinceNl ;;
  }

  dimension: province_rbr {
    type: string
    sql: ${TABLE}.provinceRbr ;;
  }

  dimension: region_fr {
    type: string
    sql: ${TABLE}.regionFr ;;
  }

  dimension: region_id {
    type: number
    sql: ${TABLE}.regionId ;;
  }

  dimension: region_lat {
    type: number
    sql: ${TABLE}.regionLat ;;
  }

  dimension: region_lon {
    type: number
    sql: ${TABLE}.regionLon ;;
  }

  dimension: region_nl {
    type: string
    sql: ${TABLE}.regionNl ;;
  }

  dimension: region_rbr {
    type: string
    sql: ${TABLE}.regionRbr ;;
  }

  dimension_group: row_end_dt {
    type: time
    hidden: yes
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

  dimension: row_is_current_flag {
    type: number
    hidden: yes
    sql: ${TABLE}.row_is_current_flag ;;
  }

  dimension_group: row_start_dt {
    type: time
    hidden: yes
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

  measure: count {
    type: count
    hidden: yes
    drill_fields: [m_model_run.m_model_run_id, m_model_run.m_model_name]
  }
}

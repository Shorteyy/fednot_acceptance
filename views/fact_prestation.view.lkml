view: fact_prestation {
  sql_table_name: `dwh.fact_prestation`
    ;;

  dimension: dim_application_sk {
    hidden: yes
    type: string
    sql: ${TABLE}.dim_application_sk ;;
  }

  # dimension_group: dim_days_sk {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.dim_days_sk ;;
  # }

  dimension: dim_days_sk {
    hidden: yes
    type: date
    sql: CAST(${TABLE}.dim_days_sk as date) ;;
  }

  dimension: dim_notary_office_sk {
    hidden: yes
    type: string
    sql: ${TABLE}.dim_notaryOffice_sk ;;
  }

  dimension: dim_province_sk {
    hidden: yes
    type: string
    sql: ${TABLE}.dim_province_sk ;;
  }

  dimension: prestation_compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(cast(${TABLE}.dim_days_sk as string ), ' ', ${TABLE}.dim_notaryOffice_sk, ' ', ${TABLE}.dim_province_sk, ' ', ${TABLE}.dim_application_sk ) ;;
  }

  dimension: m_model_run_id {
    type: string
    hidden: yes
    sql: ${TABLE}.m_model_run_id ;;
  }

  dimension: is_ytd {
    hidden: yes
    type: yesno
    label: "Is YTD?"
    sql: EXTRACT(MONTH from ${dim_days_sk}) < EXTRACT(MONTH from CURRENT_TIMESTAMP);;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
  }

  # dimension_group: row_start_dt {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.row_start_dt ;;
  # }

  # dimension: year_month {
  #   type: string
  #   sql: ${TABLE}.yearMonth ;;
  # }

  measure: count {
    type: count
    drill_fields: [m_model_run.m_model_run_id, m_model_run.m_model_name]
  }

  measure: sum_qty {
    label: "# Operations"
    type: sum
    sql: ${qty} ;;
  }

  measure: avg_qty {
    label: "Average # Operations"
    type:  average
    sql: ${qty} ;;
  }

  measure: percent_of_total_operations {
    label: "% of Total # Operations"
    type: percent_of_total
    value_format: "0.00\%"
    sql: ${sum_qty} ;;
  }

  measure: total_sum_ytd {
    label: "# Operations YTD"
    type: sum
    filters: {
      field: is_ytd
      value: "yes"
    }
    sql: ${qty} ;;
  }


}

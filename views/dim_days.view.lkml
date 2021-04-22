view: dim_days {
  sql_table_name: `dwh.dim_days`
    ;;

  dimension: dataset {
    type: string
    sql: ${TABLE}.dataset ;;
  }

  dimension_group: day {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.day_date ;;
  }

  dimension_group: day_date_pre_month {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.day_date_pre_month ;;
  }

  dimension_group: day_date_pre_week {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.day_date_pre_week ;;
  }

  dimension_group: day_date_pre_year {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.day_date_pre_year ;;
  }

  dimension: day_dd {
    type: number
    sql: ${TABLE}.day_dd ;;
  }

  dimension_group: day_minus364 {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.day_minus364 ;;
  }

  dimension_group: day_minus365 {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.day_minus365 ;;
  }

  dimension: day_yyyymmdd {
    type: number
    sql: ${TABLE}.day_yyyymmdd ;;
  }

  dimension: dayofweek_name {
    type: string
    sql: ${TABLE}.dayofweek_name ;;
  }

  dimension: dayofweek_name_short {
    type: string
    sql: ${TABLE}.dayofweek_name_short ;;
  }

  dimension: dayofweek_nr {
    type: number
    sql: ${TABLE}.dayofweek_nr ;;
  }

  dimension: fragmentofweek {
    type: number
    sql: ${TABLE}.fragmentofweek ;;
  }

  dimension_group: isoweek_end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.isoweek_end_date ;;
  }

  dimension_group: isoweek_pre_week_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.isoweek_pre_week_start_date ;;
  }

  dimension_group: isoweek_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.isoweek_start_date ;;
  }

  dimension: isoweek_ww {
    type: number
    sql: ${TABLE}.isoweek_ww ;;
  }

  dimension: isoweek_ww_pre_week {
    type: number
    sql: ${TABLE}.isoweek_ww_pre_week ;;
  }

  dimension: isoweek_yyyyww {
    type: number
    sql: ${TABLE}.isoweek_yyyyww ;;
  }

  dimension: isoweek_yyyyww_pre_week {
    type: number
    sql: ${TABLE}.isoweek_yyyyww_pre_week ;;
  }

  dimension: isoweek_yyyyww_pre_year {
    type: number
    sql: ${TABLE}.isoweek_yyyyww_pre_year ;;
  }

  dimension: isoyear_yyyy {
    type: number
    sql: ${TABLE}.isoyear_yyyy ;;
  }

  dimension: isoyear_yyyy_pre_year {
    type: number
    sql: ${TABLE}.isoyear_yyyy_pre_year ;;
  }

  dimension: maximumweeks {
    type: number
    sql: ${TABLE}.maximumweeks ;;
  }

  dimension_group: month_end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.month_end_date ;;
  }

  dimension: month_mm {
    type: number
    sql: ${TABLE}.month_mm ;;
  }

  dimension: month_name {
    type: string
    sql: ${TABLE}.month_name ;;
  }

  dimension: month_name_short {
    type: string
    sql: ${TABLE}.month_name_short ;;
  }

  dimension: month_splitter {
    type: number
    sql: ${TABLE}.month_splitter ;;
  }

  dimension_group: month_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.month_start_date ;;
  }

  dimension: month_yyyymm {
    type: number
    sql: ${TABLE}.month_yyyymm ;;
  }

  dimension: month_yyyymm_pre_month {
    type: number
    sql: ${TABLE}.month_yyyymm_pre_month ;;
  }

  dimension: month_yyyymm_pre_year {
    type: number
    sql: ${TABLE}.month_yyyymm_pre_year ;;
  }

  dimension_group: quarter_end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.quarter_end_date ;;
  }

  dimension_group: quarter_end_date_pre_quarter {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.quarter_end_date_pre_quarter ;;
  }

  dimension: quarter_qq {
    type: number
    sql: ${TABLE}.quarter_qq ;;
  }

  dimension_group: quarter_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.quarter_start_date ;;
  }

  dimension: quarter_yyyyqq {
    type: number
    sql: ${TABLE}.quarter_yyyyqq ;;
  }

  dimension: quarter_yyyyqq_pre_quarter {
    type: number
    sql: ${TABLE}.quarter_yyyyqq_pre_quarter ;;
  }

  dimension: quarter_yyyyqq_pre_year {
    type: number
    sql: ${TABLE}.quarter_yyyyqq_pre_year ;;
  }

  dimension: runid {
    type: number
    value_format_name: id
    sql: ${TABLE}.runid ;;
  }

  dimension: sopmonth {
    type: number
    sql: ${TABLE}.sopmonth ;;
  }

  dimension: sopweek {
    type: string
    sql: ${TABLE}.sopweek ;;
  }

  dimension: sopweekcode {
    type: string
    sql: ${TABLE}.sopweekcode ;;
  }

  dimension_group: timestamp_ins {
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
    sql: ${TABLE}.timestamp_ins ;;
  }

  dimension_group: timestamp_upd {
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
    sql: ${TABLE}.timestamp_upd ;;
  }

  dimension: week_fragment {
    type: number
    sql: ${TABLE}.week_fragment ;;
  }

  dimension: year_yyyy {
    type: number
    sql: ${TABLE}.year_yyyy ;;
  }

  dimension: year_yyyy_pre_year {
    type: number
    sql: ${TABLE}.year_yyyy_pre_year ;;
  }

  measure: count {
    type: count
    drill_fields: [month_name, dayofweek_name]
  }
}

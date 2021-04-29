view: dim_date {
  # label: "Date Hierarchy"
  sql_table_name: `dwh.DimDate`
    ;;

  # dimension_group: date_group {
  #   type: time
  #   hidden: yes
  #   timeframes: [
  #     raw,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   convert_tz: no
  #   datatype: date
  #   sql: ${TABLE}.Date ;;
  # }

  parameter: timeframe_picker {
    label: "Period Selector"
    type: unquoted
    allowed_value: { value: "Month" }
    allowed_value: { value: "Quarter" }
    allowed_value: { value: "Year" }
    default_value: "Month"
  }

  dimension: date {
    type: date
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: timeframe {
    label_from_parameter: timeframe_picker
    type: string
    sql:
    {% if timeframe_picker._parameter_value == 'Month'  %}
      ${month_year}
    {% elsif timeframe_picker._parameter_value == 'Year' %}
      ${year}
      {% elsif timeframe_picker._parameter_value == 'Quarter' %}
      ${quarter_year}
    {% else %}
      ${quarter_year}
    {% endif %};;
  }

  dimension: day_name {
    type: string
    sql: ${TABLE}.DayName ;;
  }

  dimension: day_of_month {
    type: string
    sql: ${TABLE}.DayOfMonth ;;
  }

  dimension: day_of_quarter {
    type: string
    sql: ${TABLE}.DayOfQuarter ;;
  }

  dimension: day_of_week {
    type: string
    sql: ${TABLE}.DayOfWeek ;;
  }

  dimension: day_of_week_in_month {
    type: string
    sql: ${TABLE}.DayOfWeekInMonth ;;
  }

  dimension: day_of_week_in_year {
    type: string
    sql: ${TABLE}.DayOfWeekInYear ;;
  }

  dimension: day_of_year {
    type: string
    sql: ${TABLE}.DayOfYear ;;
  }

  dimension: day_suffix {
    type: string
    sql: ${TABLE}.DaySuffix ;;
  }

  # dimension_group: first_day_of_month {
  #   type: time
  #   timeframes: [
  #     raw,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   convert_tz: no
  #   datatype: date
  #   sql: ${TABLE}.FirstDayOfMonth ;;
  # }

  dimension: first_day_of_month {
    type: date
    datatype: date
    sql: ${TABLE}.FirstDayOfMonth ;;
  }

  # dimension_group: first_day_of_quarter {
  #   type: time
  #   timeframes: [
  #     raw,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   convert_tz: no
  #   datatype: date
  #   sql: ${TABLE}.FirstDayOfQuarter ;;
  # }

  dimension: first_day_of_quarter {
    type: date
    datatype: date
    sql: ${TABLE}.FirstDayOfQuarter ;;
  }

  # dimension_group: first_day_of_year {
  #   type: time
  #   timeframes: [
  #     raw,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   convert_tz: no
  #   datatype: date
  #   sql: ${TABLE}.FirstDayOfYear ;;
  # }

  dimension: first_day_of_year {
    type: date
    datatype: date
    sql: ${TABLE}.FirstDayOfYear ;;
  }

  dimension: full_date {
    type: string
    sql: ${TABLE}.FullDate ;;
  }

  dimension: is_holiday {
    type: yesno
    sql: ${TABLE}.IsHoliday ;;
  }

  dimension: is_weekday {
    type: yesno
    sql: ${TABLE}.IsWeekday ;;
  }

  # dimension_group: last_day_of_month {
  #   type: time
  #   timeframes: [
  #     raw,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   convert_tz: no
  #   datatype: date
  #   sql: ${TABLE}.LastDayOfMonth ;;
  # }

  dimension: last_day_of_month {
    type: date
    datatype: date
    sql: ${TABLE}.LastDayOfMonth ;;
  }

  # dimension_group: last_day_of_quarter {
  #   type: time
  #   timeframes: [
  #     raw,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   convert_tz: no
  #   datatype: date
  #   sql: ${TABLE}.LastDayOfQuarter ;;
  # }

  dimension: last_day_of_quarter {
    type: date
    datatype: date
    sql: ${TABLE}.LastDayOfQuarter ;;
  }

  # dimension_group: last_day_of_year {
  #   type: time
  #   timeframes: [
  #     raw,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   convert_tz: no
  #   datatype: date
  #   sql: ${TABLE}.LastDayOfYear ;;
  # }

  dimension: last_day_of_year {
    type: date
    datatype: date
    sql: ${TABLE}.LastDayOfYear ;;
  }

  dimension: mmyyyy {
    type: string
    drill_fields: [date]
    sql: ${TABLE}.MMYYYY ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.Month ;;
  }

  dimension: month_name {
    type: string
    sql: ${TABLE}.MonthName ;;
  }

  dimension: month_of_quarter {
    type: string
    sql: ${TABLE}.MonthOfQuarter ;;
  }

  dimension: month_year {
    drill_fields: [date]
    type: string
    sql: ${TABLE}.MonthYear ;;
  }

  dimension: pk_date {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.PK_Date ;;
  }

  dimension: quarter {
    type: string
    sql: ${TABLE}.Quarter ;;
  }

  dimension: quarter_name {
    type: string
    sql: ${TABLE}.QuarterName ;;
  }

  dimension: quarter_year {
    drill_fields: [month_year, date]
    type: string
    sql: ${TABLE}.QuarterYear ;;
  }

  dimension: week_of_month {
    type: string
    sql: ${TABLE}.WeekOfMonth ;;
  }

  dimension: week_of_quarter {
    type: string
    sql: ${TABLE}.WeekOfQuarter ;;
  }

  dimension: week_of_year {
    type: string
    sql: ${TABLE}.WeekOfYear ;;
  }

  dimension: year {
    drill_fields: [month_year,date]
    type: string
    sql: ${TABLE}.Year ;;
  }

  dimension: year_name {
    type: string
    sql: ${TABLE}.YearName ;;
  }

  dimension: year_quarter {
    type: number
    sql: ${TABLE}.YearQuarter ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [year_name, quarter_name, day_name, month_name]
  }
}

# include: "/views/global_parameters.view.lkml"
view: dim_date {
#  extends: [global_parameters]
  # label: "Date Hierarchy"
  sql_table_name: `dwh.dbo_DimDate`
    ;;

  parameter: timeframe_picker {
    label: "{% assign groupname = _field._name | replace: \".timeframe_picker\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \" \" | capitalize %} {{groupname}} Period Selector"
    type: unquoted
    allowed_value: {
      label: "Month"
      value: "Month" }
    allowed_value: {
      label: "Quarter"
      value: "Quarter" }
    allowed_value: {
      label: "Year"
      value: "Year" }
    default_value: "Month"
  }

  dimension: date {
    group_label: "{% assign groupname = _field._name | replace: \".date\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    type: date
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: period {
    group_label: "{% assign groupname = _field._name | replace: \".period\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    label_from_parameter: timeframe_picker
    type: string
    sql:
    {% if timeframe_picker._parameter_value == 'Month'  %}
      concat(${year},if(length(${month}) = 1,"-0","-"),${month})
    {% elsif timeframe_picker._parameter_value == 'Year' %}
      ${year}
    {% elsif timeframe_picker._parameter_value == 'Quarter' %}
      concat(${year}," ",substr(${quarter_year},1,2))
    {% else %}
      ${year}
    {% endif %};;
  }

  dimension: day_name {
    group_label: "{% assign groupname = _field._name | replace: \".day_name\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    type: string
    sql: ${TABLE}.DayName ;;
  }

  dimension: day_of_month {
    group_label: "{% assign groupname = _field._name | replace: \".day_of_month\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    type: string
    sql: ${TABLE}.DayOfMonth ;;
  }

  dimension: day_of_quarter {
    group_label: "{% assign groupname = _field._name | replace: \".day_of_quarter\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    type: string
    sql: ${TABLE}.DayOfQuarter ;;
  }

  dimension: day_of_week {
    group_label: "{% assign groupname = _field._name | replace: \".day_of_week\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    type: string
    sql: ${TABLE}.DayOfWeek ;;
  }

  dimension: day_of_week_in_month {
    group_label: "{% assign groupname = _field._name | replace: \".day_of_week_in_month\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    type: string
    sql: ${TABLE}.DayOfWeekInMonth ;;
  }

  dimension: day_of_week_in_year {
    group_label: "{% assign groupname = _field._name | replace: \".day_of_week_in_year\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    type: string
    sql: ${TABLE}.DayOfWeekInYear ;;
  }

  dimension: day_of_year {
    group_label: "{% assign groupname = _field._name | replace: \".day_of_year\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    type: string
    sql: ${TABLE}.DayOfYear ;;
  }

  dimension: day_suffix {
    group_label: "{% assign groupname = _field._name | replace: \".day_suffix\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    type: string
    sql: ${TABLE}.DaySuffix ;;
  }

  dimension: first_day_of_month {
    group_label: "{% assign groupname = _field._name | replace: \".first_day_of_month\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    type: date
    datatype: date
    sql: ${TABLE}.FirstDayOfMonth ;;
  }

  dimension: first_day_of_quarter {
    group_label: "{% assign groupname = _field._name | replace: \".first_day_of_quarter\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    type: date
    datatype: date
    sql: ${TABLE}.FirstDayOfQuarter ;;
  }

  dimension: first_day_of_year {
    group_label: "{% assign groupname = _field._name | replace: \".first_day_of_year\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    type: date
    datatype: date
    sql: ${TABLE}.FirstDayOfYear ;;
  }

  dimension: full_date {
    group_label: "{% assign groupname = _field._name | replace: \".full_date\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    type: string
    sql: ${TABLE}.FullDate ;;
  }

  dimension: is_holiday {
    group_label: "{% assign groupname = _field._name | replace: \".is_holiday\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    type: yesno
    sql: ${TABLE}.IsHoliday ;;
  }

  dimension: is_weekday {
    hidden: yes
    group_label: "{% assign groupname = _field._name | replace: \".is_weekday\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    type: yesno
    sql: ${TABLE}.IsWeekday ;;
  }

  dimension: last_day_of_month {
    group_label: "{% assign groupname = _field._name | replace: \".last_day_of_month\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    type: date
    datatype: date
    sql: ${TABLE}.LastDayOfMonth ;;
  }

  dimension: last_day_of_quarter {
    group_label: "{% assign groupname = _field._name | replace: \".last_day_of_quarter\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    type: date
    datatype: date
    sql: ${TABLE}.LastDayOfQuarter ;;
  }

  dimension: last_day_of_year {
    group_label: "{% assign groupname = _field._name | replace: \".last_day_of_year\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    type: date
    datatype: date
    sql: ${TABLE}.LastDayOfYear ;;
  }

  dimension: MMYYYY {
    group_label: "{% assign groupname = _field._name | replace: \".MMYYYY\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    order_by_field: YYYYMM
    type: string
    drill_fields: [date]
    sql: ${TABLE}.MMYYYY ;;
  }

  dimension: month {
    group_label: "{% assign groupname = _field._name | replace: \".month\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    order_by_field: YYYYMM
    type: string
    sql: ${TABLE}.Month ;;
  }

  dimension: month_name {
    group_label: "{% assign groupname = _field._name | replace: \".month_name\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    order_by_field: YYYYMM
    type: string
    sql: ${TABLE}.MonthName ;;
  }

  dimension: month_of_quarter {
    group_label: "{% assign groupname = _field._name | replace: \".month_of_quarter\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    order_by_field: YYYYMM
    type: string
    sql: ${TABLE}.MonthOfQuarter ;;
  }

  dimension: month_year {
    group_label: "{% assign groupname = _field._name | replace: \".month_year\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    order_by_field: YYYYMM
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
    group_label: "{% assign groupname = _field._name | replace: \".quarter\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    order_by_field: year_quarter
    type: string
    sql: ${TABLE}.Quarter ;;
  }

  dimension: quarter_name {
    group_label: "{% assign groupname = _field._name | replace: \".quarter_name\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    order_by_field: year_quarter
    type: string
    sql: ${TABLE}.QuarterName ;;
  }

  dimension: quarter_year {
    group_label: "{% assign groupname = _field._name | replace: \".quarter_year\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    order_by_field: year_quarter
    drill_fields: [month_year, date]
    type: string
    sql: ${TABLE}.QuarterYear ;;
  }

  dimension: week_of_month {
    group_label: "{% assign groupname = _field._name | replace: \".week_of_month\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    type: string
    sql: ${TABLE}.WeekOfMonth ;;
  }

  dimension: week_of_quarter {
    group_label: "{% assign groupname = _field._name | replace: \".week_of_quarter\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    type: string
    sql: ${TABLE}.WeekOfQuarter ;;
  }

  dimension: week_of_year {
    group_label: "{% assign groupname = _field._name | replace: \".week_of_year\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    type: string
    sql: ${TABLE}.WeekOfYear ;;
  }

  dimension: year {
    group_label: "{% assign groupname = _field._name | replace: \".year\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    drill_fields: [month_year,date]
    type: string
    sql: ${TABLE}.Year ;;
  }

  dimension: year_name {
    group_label: "{% assign groupname = _field._name | replace: \".year_name\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    type: string
    sql: ${TABLE}.YearName ;;
  }

  dimension: year_quarter {
    group_label: "{% assign groupname = _field._name | replace: \".year_quarter\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    hidden: yes
    type: number
    sql: ${TABLE}.YearQuarter ;;
  }

  measure: count {
    hidden: yes
    type: count
  }

  dimension: YYYYMM {
    group_label: "{% assign groupname = _field._name | replace: \".YYYYMM\" , \" \" | replace: \"_\" , \" \" | replace: \"first sending notary \", \"date fields \" | capitalize %} {{groupname}}"
    type:  number
    sql:  cast(${TABLE}.Year as int64) * 100 + cast(${TABLE}.Month as int64);;
  }

}

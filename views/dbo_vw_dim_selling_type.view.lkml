view: dim_selling_type {
  sql_table_name: `dwh.dbo_vwDimSellingType`
    ;;

  # dimension_group: _date1 {
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
  #   sql: ${TABLE}._date1 ;;
  # }

  # dimension_group: _date2 {
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
  #   sql: ${TABLE}._date2 ;;
  # }

  # dimension: _run_id {
  #   type: string
  #   sql: ${TABLE}._run_id ;;
  # }

  # dimension_group: m_job_datetime {
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
  #   sql: ${TABLE}.m_job_datetime ;;
  # }

  # dimension: m_job_exec_id {
  #   type: string
  #   sql: ${TABLE}.m_job_exec_id ;;
  # }

  # dimension: m_model_exec_id {
  #   type: string
  #   sql: ${TABLE}.m_model_exec_id ;;
  # }

  dimension: pk_selling_type {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.PK_SellingType ;;
  }

  dimension: selling_type_name {
    type: string
    sql: ${TABLE}.SellingTypeName ;;
  }

  # dimension_group: sys_insert_update {
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
  #   sql: ${TABLE}.Sys_InsertUpdateDate ;;
  # }

  measure: count {
    type: count
    drill_fields: [selling_type_name]
  }
}

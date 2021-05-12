view: dbo_vw_dimpebtype {
  sql_table_name: `dwh.dbo_vwDIMPEBType`
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

  dimension: peb_consumption_interval {
    type: string
    sql: ${TABLE}.PEB_ConsumptionInterval ;;
  }

  dimension: peb_type_bk {
    type: number
    sql: ${TABLE}.PEB_TypeBK ;;
  }

  dimension: peb_type_name {
    type: string
    sql: ${TABLE}.PEB_TypeName ;;
  }

  dimension: pk_pebtype {
    type: number
    sql: ${TABLE}.PK_PEBType ;;
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
    drill_fields: [peb_type_name]
  }
}

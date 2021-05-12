view: dbo_vw_dim_property_type {
  sql_table_name: `dwh.dbo_vwDimPropertyType`
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

  dimension: is_in_asf {
    type: number
    sql: ${TABLE}.isInASF ;;
  }

  dimension: is_in_vgp {
    type: number
    sql: ${TABLE}.isInVGP ;;
  }

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

  dimension: pk_property_type {
    type: number
    sql: ${TABLE}.PK_PropertyType ;;
  }

  dimension: sub_type_name {
    type: string
    sql: ${TABLE}.subTypeName ;;
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

  dimension: type_name {
    type: string
    sql: ${TABLE}.typeName ;;
  }

  measure: count {
    type: count
    drill_fields: [sub_type_name, type_name]
  }
}

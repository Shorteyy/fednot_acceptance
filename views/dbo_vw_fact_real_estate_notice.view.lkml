view: dbo_vw_fact_real_estate_notice {
  sql_table_name: `dwh.dbo_vwFactRealEstateNotice`
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

  dimension: fk_address {
    type: number
    sql: ${TABLE}.FK_Address ;;
  }

  dimension: fk_date_first_enot_request {
    type: number
    sql: ${TABLE}.FK_Date_FirstEnotRequest ;;
  }

  dimension: fk_date_first_received_function_ack {
    type: number
    sql: ${TABLE}.FK_Date_FirstReceivedFunctionACK ;;
  }

  dimension: fk_notice_one {
    type: number
    sql: ${TABLE}.FK_NoticeOne ;;
  }

  dimension: fk_property_type {
    type: number
    sql: ${TABLE}.FK_PropertyType ;;
  }

  dimension: fk_real_estate {
    type: number
    sql: ${TABLE}.FK_RealEstate ;;
  }

  dimension: fk_selling_type {
    type: number
    sql: ${TABLE}.FK_SellingType ;;
  }

  dimension: fk_source_system {
    type: number
    sql: ${TABLE}.FK_SourceSystem ;;
  }

  dimension: fk_study {
    type: number
    sql: ${TABLE}.FK_Study ;;
  }

  dimension: fk_transaction_type {
    type: number
    sql: ${TABLE}.FK_TransactionType ;;
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

  dimension: nb_enot_non_additive {
    type: number
    sql: ${TABLE}.Nb_Enot_Non_Additive ;;
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
    drill_fields: []
  }
}

view: dim_notice_one {
  sql_table_name: `dwh.dbo_vwDimNoticeOne`
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

  dimension: creation {
    hidden: yes
    type: date
    sql: ${TABLE}.CreationDate ;;
  }

  dimension: demand_id {
    type: number
    sql: ${TABLE}.Demand_id ;;
  }

  dimension: demand_language {
    type: string
    sql: ${TABLE}.DemandLanguage ;;
  }

  dimension: demand_origin_type {
    type: string
    sql: ${TABLE}.DemandOriginType ;;
  }

  dimension: demand_status_type {
    type: string
    sql: ${TABLE}.DemandStatusType ;;
  }

  dimension: is_outlier {
    type: number
    sql: ${TABLE}.isOutlier ;;
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

  dimension: nb_enot {
    type: number
    sql: ${TABLE}.Nb_Enot ;;
  }

  dimension: notice_one_id {
    type: number
    sql: ${TABLE}.NoticeOne_id ;;
  }

  dimension: notice_one_social_and_fiscal {
    type: number
    sql: ${TABLE}.NoticeOneSocialAndFiscal ;;
  }

  dimension: pk_notice_one {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.PK_NoticeOne ;;
  }

  dimension: replaced_procedure_number {
    type: number
    sql: ${TABLE}.ReplacedProcedureNumber ;;
  }

  dimension: short_request {
    type: string
    sql: ${TABLE}.ShortRequest ;;
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

  dimension: transaction_type {
    type: number
    sql: ${TABLE}.TransactionType ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

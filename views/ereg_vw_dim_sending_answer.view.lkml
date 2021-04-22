view: ereg_vw_dim_sending_answer {
  sql_table_name: `dwh.ereg_vwDimSendingAnswer`
    ;;

  dimension: answer_error_code {
    type: string
    sql: ${TABLE}.AnswerErrorCode ;;
  }

  dimension: answer_status {
    type: string
    sql: ${TABLE}.AnswerStatus ;;
  }

  dimension: answer_status_label_fr {
    type: string
    sql: ${TABLE}.AnswerStatusLabelFR ;;
  }

  dimension: answer_status_label_nl {
    type: string
    sql: ${TABLE}.AnswerStatusLabelNL ;;
  }

  dimension: answer_type {
    type: string
    sql: ${TABLE}.AnswerType ;;
  }

  dimension: answer_type_label_fr {
    type: string
    sql: ${TABLE}.AnswerTypeLabelFR ;;
  }

  dimension: answer_type_label_nl {
    type: string
    sql: ${TABLE}.AnswerTypeLabelNL ;;
  }

  dimension: deed_repertorium {
    type: string
    sql: ${TABLE}.DeedRepertorium ;;
  }

  dimension: deed_request_formality {
    type: string
    sql: ${TABLE}.DeedRequestFormality ;;
  }

  dimension: deed_request_formality_label_fr {
    type: string
    sql: ${TABLE}.DeedRequestFormalityLabelFR ;;
  }

  dimension: deed_request_formality_label_nl {
    type: string
    sql: ${TABLE}.DeedRequestFormalityLabelNL ;;
  }

  dimension: deed_size {
    type: string
    sql: ${TABLE}.DeedSize ;;
  }

  dimension: has_answer_error {
    type: string
    sql: ${TABLE}.HasAnswerError ;;
  }

  dimension_group: m_job_datetime {
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
    sql: ${TABLE}.m_job_datetime ;;
  }

  dimension: m_job_run_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.m_job_run_id ;;
  }

  dimension: m_model_run_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.m_model_run_id ;;
  }

  dimension: pk_ereg_sending_answer {
    type: string
    sql: ${TABLE}.PK_EregSendingAnswer ;;
  }

  dimension: received_answer_time {
    type: string
    sql: ${TABLE}.ReceivedAnswerTime ;;
  }

  dimension: sending_id {
    type: string
    sql: ${TABLE}.SendingId ;;
  }

  dimension: sending_reference {
    type: string
    sql: ${TABLE}.SendingReference ;;
  }

  dimension: sending_time {
    type: string
    sql: ${TABLE}.SendingTime ;;
  }

  dimension: study_bcenumber {
    type: string
    sql: ${TABLE}.StudyBCENumber ;;
  }

  dimension: sys_insert_update_date {
    type: string
    sql: ${TABLE}.Sys_InsertUpdateDate ;;
  }

  measure: count {
    type: count
    drill_fields: [m_job_run.m_job_run_id, m_job_run.m_job_name, m_model_run.m_model_run_id, m_model_run.m_model_name]
  }
}

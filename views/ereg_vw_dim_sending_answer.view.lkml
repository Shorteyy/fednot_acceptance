view: ereg_vw_dim_sending_answer {
  label: "Dim Sending Answer"
  sql_table_name: `dwh.ereg_vwDimSendingAnswer`
    ;;

  parameter: pick_language {
    label: "Sending Answer Language Selector"
    type: string
    allowed_value: { value: "NL" }
    allowed_value: { value: "FR" }
  }

  dimension: answer_status_label {
    label_from_parameter: pick_language
    sql:
        {% if pick_language._parameter_value == "'NL'" %}
          IF(${answer_status_label_nl} = "NULL",${answer_status_label_fr},${answer_status_label_nl})
        {% elsif pick_language._parameter_value == "'FR'" %}
          IF(${answer_status_label_fr} = "NULL",${answer_status_label_nl },${answer_status_label_fr})
         {% else %}
          coalesce(${answer_status_label_nl},${answer_status_label_fr})
        {% endif %};;
  }

  dimension: answer_type_label {
    label_from_parameter: pick_language
    sql:
        {% if pick_language._parameter_value == "'NL'" %}
          IF(${answer_type_label_nl} = "NULL",${answer_type_label_fr},${answer_type_label_nl})
        {% elsif pick_language._parameter_value == "'FR'" %}
          IF(${answer_type_label_fr} = "NULL",${answer_type_label_nl },${answer_type_label_fr})
         {% else %}
          coalesce(${answer_type_label_nl},${answer_type_label_fr})
        {% endif %};;
  }

  dimension: deed_request_formality_label {
    label_from_parameter: pick_language
    sql:
        {% if pick_language._parameter_value == "'NL'" %}
          IF(${deed_request_formality_label_nl} = "NULL",${deed_request_formality_label_fr},${deed_request_formality_label_nl})
        {% elsif pick_language._parameter_value == "'FR'" %}
          IF(${deed_request_formality_label_fr} = "NULL",${deed_request_formality_label_nl },${deed_request_formality_label_fr})
         {% else %}
          coalesce(${deed_request_formality_label_nl},${deed_request_formality_label_fr})
        {% endif %};;
  }

  dimension: answer_error_code {
    type: string
    sql: ${TABLE}.AnswerErrorCode ;;
  }

  dimension: answer_status {
    type: string
    sql: ${TABLE}.AnswerStatus ;;
  }

  dimension: answer_status_label_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.AnswerStatusLabelFR ;;
  }

  dimension: answer_status_label_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.AnswerStatusLabelNL ;;
  }

  dimension: answer_type {
    type: string
    sql: ${TABLE}.AnswerType ;;
  }

  dimension: answer_type_label_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.AnswerTypeLabelFR ;;
  }

  dimension: answer_type_label_nl {
    hidden: yes
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
    hidden: yes
    type: string
    sql: ${TABLE}.DeedRequestFormalityLabelFR ;;
  }

  dimension: deed_request_formality_label_nl {
    hidden: yes
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

  # dimension: m_job_run_id {
  #   type: string
  #   # hidden: yes
  #   sql: ${TABLE}.m_job_run_id ;;
  # }

  # dimension: m_model_run_id {
  #   type: string
  #   # hidden: yes
  #   sql: ${TABLE}.m_model_run_id ;;
  # }

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

  # dimension: sys_insert_update_date {
  #   type: string
  #   sql: ${TABLE}.Sys_InsertUpdateDate ;;
  # }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}

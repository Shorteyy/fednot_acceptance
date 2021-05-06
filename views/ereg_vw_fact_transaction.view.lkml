view: ereg_vw_fact_transaction {
  label: "Fact Transaction"
  sql_table_name: `dwh.ereg_vwFactTransaction`
    ;;

  dimension: transaction_compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(FK_EregDeedEdossier, ${TABLE}.FK_EregExpedition,${TABLE}.FK_EregGood,${TABLE}.FK_EregGoodAddress,${TABLE}.FK_EregParty,${TABLE}.FK_EregPartyAddress, ${TABLE}.fk_ereg_party_quality, ${TABLE}.FK_EregPartyRightType , ${TABLE}.FK_EregSendingAnswer, ${TABLE}.FK_EregSP25, ${TABLE}.FK_EregTransaction, ${TABLE}.FK_EregTransactionType ) ;;
  }

  dimension: fk_date_deed {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_Date_Deed ;;
  }

  dimension: fk_date_deed_registered_aa {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_Date_DeedRegisteredAA ;;
  }

  dimension: fk_date_edossier_creation {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_Date_EdossierCreation ;;
  }

  dimension: fk_date_expedition_signed {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_Date_ExpeditionSigned ;;
  }

  dimension: fk_date_fed_not_received_answer {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_Date_FedNotReceivedAnswer ;;
  }

  dimension: fk_date_fed_not_sending {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_Date_FedNotSending ;;
  }

  dimension: fk_date_first_fed_not_sending {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_Date_FirstFedNotSending ;;
  }

  dimension: fk_date_request {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_Date_Request ;;
  }

  dimension: fk_ereg_deed_edossier {
    hidden: yes
    type: string
    sql: ${TABLE}.FK_EregDeedEdossier ;;
  }

  dimension: fk_ereg_expedition {
    hidden: yes
    type: string
    sql: ${TABLE}.FK_EregExpedition ;;
  }

  dimension: fk_ereg_good {
    hidden: yes
    type: string
    sql: ${TABLE}.FK_EregGood ;;
  }

  dimension: fk_ereg_good_address {
    hidden: yes
    type: string
    sql: ${TABLE}.FK_EregGoodAddress ;;
  }

  dimension: fk_ereg_party {
    hidden: yes
    type: string
    sql: ${TABLE}.FK_EregParty ;;
  }

  dimension: fk_ereg_party_address {
    hidden: yes
    type: string
    sql: ${TABLE}.FK_EregPartyAddress ;;
  }

  dimension: fk_ereg_party_quality {
    hidden: yes
    type: string
    sql: ${TABLE}.FK_EregPartyQuality ;;
  }

  dimension: fk_ereg_party_right_type {
    hidden: yes
    type: string
    sql: ${TABLE}.FK_EregPartyRightType ;;
  }

  dimension: fk_ereg_sending_answer {
    hidden: yes
    type: string
    sql: ${TABLE}.FK_EregSendingAnswer ;;
  }

  dimension: fk_ereg_sp25 {
    hidden: yes
    type: string
    sql: ${TABLE}.FK_EregSP25 ;;
  }

  dimension: fk_ereg_transaction {
    hidden: yes
    type: string
    sql: ${TABLE}.FK_EregTransaction ;;
  }

  dimension: fk_ereg_transaction_type {
    hidden: yes
    type: string
    sql: ${TABLE}.FK_EregTransactionType ;;
  }

  dimension: fk_study {
    hidden: yes
    type: string
    sql: ${TABLE}.FK_Study ;;
  }

  dimension: fk_study_address {
    hidden: yes
    type: string
    sql: ${TABLE}.FK_StudyAddress ;;
  }

  dimension: is_party_from_community {
    type: string
    sql: ${TABLE}.IsPartyFromCommunity ;;
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

  dimension: quota_denominator {
    type: string
    sql: ${TABLE}.QuotaDenominator ;;
  }

  dimension: quota_numerator {
    type: string
    sql: ${TABLE}.QuotaNumerator ;;
  }

  dimension: is_ytd_deed {
    hidden: yes
    type: yesno
    label: "Is YTD?"
    sql: MOD(${fk_date_deed},100) < EXTRACT(MONTH from CURRENT_TIMESTAMP);;
  }

  dimension: is_ytd_first_fednot_sending {
    hidden: yes
    type: yesno
    label: "Is YTD?"
    sql: MOD(${fk_date_first_fed_not_sending},100) < EXTRACT(MONTH from CURRENT_TIMESTAMP);;
  }

  dimension: is_ytd_expedition_signed {
    hidden: yes
    type: yesno
    label: "Is YTD?"
    sql: MOD(${fk_date_expedition_signed},100) < EXTRACT(MONTH from CURRENT_TIMESTAMP);;
  }

  dimension: is_ytd_deed_registered_aa {
    hidden: yes
    type: yesno
    label: "Is YTD?"
    sql: MOD(${fk_date_deed_registered_aa},100) < EXTRACT(MONTH from CURRENT_TIMESTAMP);;
  }

  dimension: is_ytd_edossier_creation {
    hidden: yes
    type: yesno
    label: "Is YTD?"
    sql: MOD(${fk_date_edossier_creation},100) < EXTRACT(MONTH from CURRENT_TIMESTAMP);;
  }

  dimension: is_ytd_fednot_received_answer {
    hidden: yes
    type: yesno
    label: "Is YTD?"
    sql: MOD(${fk_date_fed_not_received_answer},100) < EXTRACT(MONTH from CURRENT_TIMESTAMP);;
  }

  dimension: is_ytd_fednot_sending {
    hidden: yes
    type: yesno
    label: "Is YTD?"
    sql: MOD(${fk_date_fed_not_sending},100) < EXTRACT(MONTH from CURRENT_TIMESTAMP);;
  }

  dimension: is_ytd_request {
    hidden: yes
    type: yesno
    label: "Is YTD?"
    sql: MOD(${fk_date_request},100) < EXTRACT(MONTH from CURRENT_TIMESTAMP);;
  }

 parameter: metric_selector {
    type: unquoted
    allowed_value: {
      label: "Deeds"
      value: "CountDeed"
    }
    allowed_value: {
      label: "Goods"
      value: "CountGood"
    }
    allowed_value: {
      label: "Party"
      value: "CountParty"
    }
    allowed_value: {
      label: "Transaction"
      value: "CountTransaction"
    }
  }

  measure: metric {
    label_from_parameter: metric_selector
    type: number
    sql:
        {% if metric_selector._parameter_value == 'CountDeed' %}
          ${count_deed}
        {% elsif metric_selector._parameter_value == 'CountGood' %}
          ${count_good}
        {% elsif metric_selector._parameter_value == 'CountParty' %}
          ${count_party}
        {% else metric_selector._parameter_value == 'CountTransaction' %}
          ${count_transaction}
        {% else %}
          NULL
        {% endif %} ;;
  }

  # parameter: metric_target {
  #   type: number
  # }

  # measure: metric_targeted {
  #   type: number
  #   sql: ${metric_selector} ;;
  #   html: {% assign var=_filters['_metric_target'] | plus:0 %}
  #         {% if var < ereg_vw_fact_transaction.metric._value %}
  #           <div style="color: black; background-color: red; font-size:100%; text-align:center">{{ rendered_value }}</div>
  #         {% else %}
  #           {{rendered_value}}
  #         {% endif %} ;;
  # }

  # dimension: sys_insert_update_date {
  #   type: string
  #   sql: ${TABLE}.Sys_InsertUpdateDate ;;
  # }

  measure: count_transaction {
    type: count_distinct
    sql: ${fk_ereg_transaction} ;;
  }

  measure: count_party {
    type: count_distinct
    sql: ${fk_ereg_party} ;;
  }

  measure: count_deed {
    type: count_distinct
    sql: ${fk_ereg_deed_edossier} ;;
  }

  measure: count_good {
    type: count_distinct
    sql: ${fk_ereg_good} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  # measure: total_sum_ytd_deed {
  #   label: "# Transactions YTD"
  #   type: sum
  #   filters: {
  #     field: is_ytd_deed
  #     value: "yes"
  #   }
  #   sql: ${count} ;;
  # }
}

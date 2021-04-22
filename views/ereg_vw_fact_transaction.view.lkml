view: ereg_vw_fact_transaction {
  sql_table_name: `dwh.ereg_vwFactTransaction`
    ;;

  dimension: fk_date_deed {
    type: string
    sql: ${TABLE}.FK_Date_Deed ;;
  }

  dimension: fk_date_deed_registered_aa {
    type: string
    sql: ${TABLE}.FK_Date_DeedRegisteredAA ;;
  }

  dimension: fk_date_edossier_creation {
    type: string
    sql: ${TABLE}.FK_Date_EdossierCreation ;;
  }

  dimension: fk_date_expedition_signed {
    type: string
    sql: ${TABLE}.FK_Date_ExpeditionSigned ;;
  }

  dimension: fk_date_fed_not_received_answer {
    type: string
    sql: ${TABLE}.FK_Date_FedNotReceivedAnswer ;;
  }

  dimension: fk_date_fed_not_sending {
    type: string
    sql: ${TABLE}.FK_Date_FedNotSending ;;
  }

  dimension: fk_date_first_fed_not_sending {
    type: string
    sql: ${TABLE}.FK_Date_FirstFedNotSending ;;
  }

  dimension: fk_date_request {
    type: string
    sql: ${TABLE}.FK_Date_Request ;;
  }

  dimension: fk_ereg_deed_edossier {
    type: string
    sql: ${TABLE}.FK_EregDeedEdossier ;;
  }

  dimension: fk_ereg_expedition {
    type: string
    sql: ${TABLE}.FK_EregExpedition ;;
  }

  dimension: fk_ereg_good {
    type: string
    sql: ${TABLE}.FK_EregGood ;;
  }

  dimension: fk_ereg_good_address {
    type: string
    sql: ${TABLE}.FK_EregGoodAddress ;;
  }

  dimension: fk_ereg_party {
    type: string
    sql: ${TABLE}.FK_EregParty ;;
  }

  dimension: fk_ereg_party_address {
    type: string
    sql: ${TABLE}.FK_EregPartyAddress ;;
  }

  dimension: fk_ereg_party_quality {
    type: string
    sql: ${TABLE}.FK_EregPartyQuality ;;
  }

  dimension: fk_ereg_party_right_type {
    type: string
    sql: ${TABLE}.FK_EregPartyRightType ;;
  }

  dimension: fk_ereg_sending_answer {
    type: string
    sql: ${TABLE}.FK_EregSendingAnswer ;;
  }

  dimension: fk_ereg_sp25 {
    type: string
    sql: ${TABLE}.FK_EregSP25 ;;
  }

  dimension: fk_ereg_transaction {
    type: string
    sql: ${TABLE}.FK_EregTransaction ;;
  }

  dimension: fk_ereg_transaction_type {
    type: string
    sql: ${TABLE}.FK_EregTransactionType ;;
  }

  dimension: fk_study {
    type: string
    sql: ${TABLE}.FK_Study ;;
  }

  dimension: fk_study_address {
    type: string
    sql: ${TABLE}.FK_StudyAddress ;;
  }

  dimension: is_party_from_community {
    type: string
    sql: ${TABLE}.IsPartyFromCommunity ;;
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

  dimension: quota_denominator {
    type: string
    sql: ${TABLE}.QuotaDenominator ;;
  }

  dimension: quota_numerator {
    type: string
    sql: ${TABLE}.QuotaNumerator ;;
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

view: ereg_vw_fact_transaction {
  label: "Fact Transaction"
  sql_table_name: `dwh.ereg_vwFactTransaction`
    ;;

  dimension: fk_date_deed {
    hidden: yes
    type: date
    sql: cast(${TABLE}.FK_Date_Deed as date);;
  }

  dimension: fk_date_deed_registered_aa {
    hidden: yes
    type: date
    sql: cast(${TABLE}.FK_Date_DeedRegisteredAA as date) ;;
  }

  dimension: fk_date_edossier_creation {
    hidden: yes
    type: date
    sql: cast(${TABLE}.FK_Date_EdossierCreation as date);;
  }

  dimension: fk_date_expedition_signed {
    hidden: yes
    type: date
    sql: cast(${TABLE}.FK_Date_ExpeditionSigned as date);;
  }

  dimension: fk_date_fed_not_received_answer {
    hidden: yes
    type: date
    sql: cast(${TABLE}.FK_Date_FedNotReceivedAnswer as date);;
  }

  dimension: fk_date_fed_not_sending {
    hidden: yes
    type: date
    sql: cast(${TABLE}.FK_Date_FedNotSending as date);;
  }

  dimension: fk_date_first_fed_not_sending {
    hidden: yes
    type: date
    sql: cast(${TABLE}.FK_Date_FirstFedNotSending as date);;
  }

  dimension: fk_date_request {
    hidden: yes
    type: date
    sql: cast(${TABLE}.FK_Date_Request as date);;
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

  # dimension: sys_insert_update_date {
  #   type: string
  #   sql: ${TABLE}.Sys_InsertUpdateDate ;;
  # }

  measure: count {
    type: count
    drill_fields: []
  }
}

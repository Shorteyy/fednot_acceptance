view: ereg_vw_dim_party {
  label: "Party"
  sql_table_name: `dwh.ereg_vwDimParty`
    ;;

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

  dimension: moral_party_bcenumber {
    type: string
    sql: ${TABLE}.MoralPartyBCENumber ;;
  }

  dimension: party_age {
    type: string
    sql: ${TABLE}.PartyAge ;;
  }

  dimension: party_birth_year {
    type: string
    sql: ${TABLE}.PartyBirthYear ;;
  }

  dimension: party_city {
    type: string
    sql: ${TABLE}.PartyCity ;;
  }

  dimension: party_country_code {
    type: string
    sql: ${TABLE}.PartyCountryCode ;;
  }

  dimension: party_legal_form_label {
    type: string
    sql: ${TABLE}.PartyLegalFormLabel ;;
  }

  dimension: party_legal_form_label_fr {
    type: string
    sql: ${TABLE}.PartyLegalFormLabelFR ;;
  }

  dimension: party_legal_form_label_nl {
    type: string
    sql: ${TABLE}.PartyLegalFormLabelNL ;;
  }

  dimension: party_postal_code {
    type: string
    sql: ${TABLE}.PartyPostalCode ;;
  }

  dimension: party_sending_reference {
    type: string
    sql: ${TABLE}.PartySendingReference ;;
  }

  dimension: party_source {
    type: string
    sql: ${TABLE}.PartySource ;;
  }

  dimension: party_source_label_fr {
    type: string
    sql: ${TABLE}.PartySourceLabelFR ;;
  }

  dimension: party_source_label_nl {
    type: string
    sql: ${TABLE}.PartySourceLabelNL ;;
  }

  dimension: party_street {
    type: string
    sql: ${TABLE}.PartyStreet ;;
  }

  dimension: party_type {
    type: string
    sql: ${TABLE}.PartyType ;;
  }

  dimension: party_type_label_fr {
    type: string
    sql: ${TABLE}.PartyTypeLabelFR ;;
  }

  dimension: party_type_label_nl {
    type: string
    sql: ${TABLE}.PartyTypeLabelNL ;;
  }

  dimension: pk_ereg_party {
    type: string
    sql: ${TABLE}.PK_EregParty ;;
  }

  dimension: sending_party_id {
    type: string
    sql: ${TABLE}.SendingPartyId ;;
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

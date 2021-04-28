view: ereg_vw_dim_study {
  label: "Notary Office"
  sql_table_name: `dwh.ereg_vwDimStudy`
    ;;

  dimension: alternate_wording_de {
    type: string
    sql: ${TABLE}.AlternateWordingDe ;;
  }

  dimension: alternate_wording_fr {
    type: string
    sql: ${TABLE}.AlternateWordingFr ;;
  }

  dimension: alternate_wording_nl {
    type: string
    sql: ${TABLE}.AlternateWordingNl ;;
  }

  dimension: arrond_admin_id {
    type: number
    sql: ${TABLE}.ArrondAdminId ;;
  }

  dimension: arrond_judic_id {
    type: number
    sql: ${TABLE}.ArrondJudicId ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.Comment ;;
  }

  dimension: company_id {
    type: number
    sql: ${TABLE}.CompanyId ;;
  }

  dimension: count_collaborators {
    type: number
    sql: ${TABLE}.CountCollaborators ;;
  }

  dimension: count_notary {
    type: number
    sql: ${TABLE}.CountNotary ;;
  }

  dimension: crt {
    type: number
    sql: ${TABLE}.CRT ;;
  }

  dimension: is_msk {
    type: number
    sql: ${TABLE}.IsMsk ;;
  }

  dimension: language_id {
    type: number
    sql: ${TABLE}.LanguageId ;;
  }

  dimension: locality_id {
    type: number
    sql: ${TABLE}.LocalityId ;;
  }

  dimension: locality_seq {
    type: number
    sql: ${TABLE}.LocalitySeq ;;
  }

  dimension: locality_wording_de {
    type: string
    sql: ${TABLE}.Locality_WordingDe ;;
  }

  dimension: locality_wording_fr {
    type: string
    sql: ${TABLE}.Locality_WordingFr ;;
  }

  dimension: locality_wording_nl {
    type: string
    sql: ${TABLE}.Locality_WordingNl ;;
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
    sql: ${TABLE}.m_job_run_id ;;
  }

  dimension: m_model_run_id {
    type: string
    sql: ${TABLE}.m_model_run_id ;;
  }

  dimension: organization_name {
    type: string
    sql: ${TABLE}.OrganizationName ;;
  }

  dimension: pk_study {
    type: number
    sql: ${TABLE}.PK_Study ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.PostalCode ;;
  }

  dimension: region_id {
    type: number
    sql: ${TABLE}.RegionId ;;
  }

  dimension: short_wording_de {
    type: string
    sql: ${TABLE}.ShortWordingDe ;;
  }

  dimension: short_wording_fr {
    type: string
    sql: ${TABLE}.ShortWordingFr ;;
  }

  dimension: short_wording_nl {
    type: string
    sql: ${TABLE}.ShortWordingNl ;;
  }

  dimension: study_id {
    type: number
    sql: ${TABLE}.StudyId ;;
  }

  dimension: study_is_association {
    type: number
    sql: ${TABLE}.StudyIsAssociation ;;
  }

  dimension_group: sys_insert_update {
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
    sql: ${TABLE}.Sys_InsertUpdateDate ;;
  }

  dimension: wording_de {
    type: string
    sql: ${TABLE}.WordingDe ;;
  }

  dimension: wording_fr {
    type: string
    sql: ${TABLE}.WordingFr ;;
  }

  dimension: wording_nl {
    type: string
    sql: ${TABLE}.WordingNl ;;
  }

  measure: count {
    type: count
    drill_fields: [organization_name]
  }
}

view: ereg_vw_dim_study {
  label: "Dim Notary Office"
  sql_table_name: `dwh.ereg_vwDimStudy`
    ;;

  parameter: pick_language {
    label: "Notary Office Language Selector"
    type: string
    allowed_value: { value: "NL" }
    allowed_value: { value: "FR" }
    allowed_value: { value: "DE" }
  }

  dimension: alternate_wording {
    label: "Municipality Brussel Name"
    description: "The locality of the notarial office in Brussels in French, Dutch, or German (Not Applicable outside Brussels)"
    label_from_parameter: pick_language
    sql:
        {% if pick_language._parameter_value == "'NL'" %}
          ${alternate_wording_nl}
        {% elsif pick_language._parameter_value == "'FR'" %}
          ${alternate_wording_fr}
        {% elsif pick_language._parameter_value == "'DE'" %}
          ${alternate_wording_de}
         {% else %}
          coalesce(${alternate_wording_nl},${alternate_wording_fr},${alternate_wording_de})
        {% endif %};;
  }

  dimension: locality_wording {
    label: "Municipality Name"
    description: "The municipality of the notarial office in French, Dutch, or German if existing, else in language of Region"
    label_from_parameter: pick_language
    sql:
        {% if pick_language._parameter_value == "'NL'" %}
          ${locality_wording_nl}
        {% elsif pick_language._parameter_value == "'FR'" %}
          ${locality_wording_fr}
        {% elsif pick_language._parameter_value == "'DE'" %}
          ${locality_wording_de}
         {% else %}
          coalesce(${locality_wording_nl},${locality_wording_fr},${locality_wording_de})
        {% endif %};;
  }

  # dimension: short_wording {
  #   label_from_parameter: pick_language
  #   sql:
  #       {% if pick_language._parameter_value == "'NL'" %}
  #         ${short_wording_nl}
  #       {% elsif pick_language._parameter_value == "'FR'" %}
  #         ${short_wording_fr}
  #       {% elsif pick_language._parameter_value == "'DE'" %}
  #         ${short_wording_de}
  #       {% else %}
  #         coalesce(${short_wording_nl},${short_wording_fr},${short_wording_de})
  #       {% endif %};;
  # }

  dimension: wording {
    label: "Province Name"
    description: "Name of the province of residence of the notarial office in French, Dutch, or German"
    label_from_parameter: pick_language
    sql:
        {% if pick_language._parameter_value == "'NL'" %}
          ${wording_nl}
        {% elsif pick_language._parameter_value == "'FR'" %}
          ${wording_fr}
        {% elsif pick_language._parameter_value == "'DE'" %}
          ${wording_de}
         {% else %}
          coalesce(${wording_nl},${wording_fr},${wording_de})
        {% endif %};;
  }

  dimension: alternate_wording_de {
    hidden: yes
    type: string
    sql: ifnull(${TABLE}.AlternateWordingDe,"Not Applicable") ;;
  }

  dimension: alternate_wording_fr {
    hidden: yes
    type: string
    sql: ifnull(${TABLE}.AlternateWordingFr,"Not Applicable") ;;
  }

  dimension: alternate_wording_nl {
    hidden: yes
    type: string
    sql: ifnull(${TABLE}.AlternateWordingNl,"Not Applicable") ;;
  }

  dimension: arrond_admin_id {
    label: "Administrative District"
    description: "Internal identifier of the administrative district of residence of the notarial study within BCN source system"
    type: number
    sql: ${TABLE}.ArrondAdminId ;;
  }

  dimension: arrond_judic_id {
    label: "Judiciary District"
    description: "Internal identifier of the judiciary district of residence of the notarial study within BCN source system"
    type: number
    sql: ${TABLE}.ArrondJudicId ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.Comment ;;
  }

  dimension: company_id {
    hidden: yes
    type: number
    sql: ${TABLE}.CompanyId ;;
  }

  dimension: count_collaborators {
    hidden: yes
    type: number
    sql: ${TABLE}.CountCollaborators ;;
  }

  dimension: count_notary {
    hidden: yes
    type: number
    sql: ${TABLE}.CountNotary ;;
  }

  dimension: crt {
    type: number
    sql: ${TABLE}.CRT ;;
  }

  dimension: is_msk {
    label: "Is MSK?"
    type: number
    sql: ${TABLE}.IsMsk ;;
  }

  dimension: language_id {
    type: number
    sql: ${TABLE}.LanguageId ;;
  }

  dimension: locality_id {
    hidden: yes
    type: number
    sql: ${TABLE}.LocalityId ;;
  }

  dimension: locality_seq {
    label: "Sequence Number of Sub-locality"
    type: number
    sql: ${TABLE}.LocalitySeq ;;
  }

  dimension: locality_wording_de {
    hidden: yes
    type: string
    sql: ${TABLE}.Locality_WordingDe ;;
  }

  dimension: locality_wording_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.Locality_WordingFr ;;
  }

  dimension: locality_wording_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.Locality_WordingNl ;;
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
  #   sql: ${TABLE}.m_job_run_id ;;
  # }

  # dimension: m_model_run_id {
  #   type: string
  #   sql: ${TABLE}.m_model_run_id ;;
  # }

  dimension: organization_name {
    label: "Notary Office Name"
    type: string
    sql: ${TABLE}.OrganizationName ;;
  }

  dimension: pk_study {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.PK_Study ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.PostalCode ;;
  }

  dimension: region_id {
    hidden: yes
    type: number
    sql: ${TABLE}.RegionId ;;
  }

  # dimension: short_wording_de {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.ShortWordingDe ;;
  # }

  # dimension: short_wording_fr {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.ShortWordingFr ;;
  # }

  # dimension: short_wording_nl {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.ShortWordingNl ;;
  # }

  dimension: study_id {
    hidden: yes
    type: number
    sql: ${TABLE}.StudyId ;;
  }

  dimension: study_is_association {
    label: "Notary is Association?"
    type: number
    sql: ${TABLE}.StudyIsAssociation ;;
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

  dimension: wording_de {
    hidden: yes
    type: string
    sql: ${TABLE}.WordingDe ;;
  }

  dimension: wording_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.WordingFr ;;
  }

  dimension: wording_nl {
    hidden:  yes
    type: string
    sql: ${TABLE}.WordingNl ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [organization_name]
  }

  measure: sum_collaborators {
    label: "# of Collaborators"
    type: sum
    sql: ${count_collaborators} ;;
  }

  measure: sum_notaries {
    label: "# of Notaries"
    type: sum
    sql: ${count_notary} ;;
  }
}

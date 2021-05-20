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
    description: "Comment related to the notarial office"
    type: string
    sql: ${TABLE}.Comment ;;
  }

  dimension: company_id {
    description: "Internal identifier of the province of residence of the notarial office within BCN source system"
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
    description: "Flag to indicate whether the notarial office is an MSK"
    type: number
    sql: ${TABLE}.IsMsk ;;
  }

  dimension: language_id {
    description: "Identifier of language of the notarial office (10: French; 20: Dutch)"
    type: number
    sql: ${TABLE}.LanguageId ;;
  }

  dimension: locality_id {
    description: "Internal identifier of the locality of residence of the notarial study within BCN source system"
    hidden: yes
    type: number
    sql: ${TABLE}.LocalityId ;;
  }

  dimension: locality_seq {
    label: "Sequence Number of Sub-locality"
    description: "Sequence number of the sub-locality of residence of the notarial study generated within the BCN source system"
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

  dimension: organization_name {
    label: "Notary Office Name"
    description: "Legal name of the notarial office"
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
    description: "Postal code of residence of the notarial study"
    type: string
    sql: ${TABLE}.PostalCode ;;
  }

  dimension: region_id {
    description: "Internal identifier of the region of residence of the notarial study within BCN source system (1: Brussels; 2: Flemish; 3: Wallonie)"
    hidden: yes
    type: number
    sql: ${TABLE}.RegionId ;;
  }

  dimension: study_id {
    description: "Internal unique reference of the notarial office"
    hidden: yes
    type: number
    sql: ${TABLE}.StudyId ;;
  }

  dimension: study_is_association {
    label: "Notary is Association?"
    description: "Flag to indicate that the study results from an association of two or more notaries"
    type: number
    sql: ${TABLE}.StudyIsAssociation ;;
  }

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
    description: "Number of collaborators (without notaries) currently working in the office"
    type: sum
    sql: ${count_collaborators} ;;
  }

  measure: sum_notaries {
    label: "# of Notaries"
    description: "Number of notaries currently working in the office"
    type: sum
    sql: ${count_notary} ;;
  }
}

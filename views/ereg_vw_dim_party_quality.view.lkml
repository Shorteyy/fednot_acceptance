view: ereg_vw_dim_party_quality {
  label: "Dim Party"
  sql_table_name: `dwh.ereg_vwDimPartyQuality`
    ;;

  parameter: pick_language_quality {
    label: "Party Quality Language Selector"
    type: string
    allowed_value: { value: "NL" }
    allowed_value: { value: "FR" }
  }

  dimension: party_quality_category_label {
    # group_label: "Quality"
    label: "Quality Category"
    label_from_parameter: pick_language_quality
    description: "Categorization of the role of the party within the transaction
 - '0' means no transfer of rights towards or from the concerned party
 - '-' means that the party yields a right towards another party or gives up his right
 - '+' means that the party acquires a right"
    sql:
        {% if pick_language_quality._parameter_value == "'NL'" %}
          IF(${party_quality_category_label_nl} = "NULL",${party_quality_category_label_fr},${party_quality_category_label_nl})
        {% elsif pick_language_quality._parameter_value == "'FR'" %}
          IF(${party_quality_category_label_fr} = "NULL",${party_quality_category_label_nl },${party_quality_category_label_fr})
         {% else %}
          coalesce(${party_quality_category_label_nl},${party_quality_category_label_fr})
        {% endif %};;
  }

  dimension: party_quality_label {
    # group_label: "Quality"
    label: "Quality"
    label_from_parameter: pick_language_quality
    description: "Qualifies the role of the party within the transaction (for legacy data, only qualityCategory was known; a datafix based on the current combinations of the TTUID and the qualityCategory has been applied; if the quality is unique for a pair (TTUID, qualityCategory) then the quality has been provisioned else, due to the uncertainty, the quality has been left blank; only the valid combinations at september 2018 were considered for the datafix ; if uncertainties exist in the past (at the moment of the transaction) we have not taken them into consideration)"
    sql:
        {% if pick_language_quality._parameter_value == "'NL'" %}
          IF(${party_quality_label_nl} = "NULL",${party_quality_label_fr},${party_quality_label_nl})
        {% elsif pick_language_quality._parameter_value == "'FR'" %}
          IF(${party_quality_label_fr} = "NULL",${party_quality_label_nl },${party_quality_label_fr})
         {% else %}
          coalesce(${party_quality_label_nl},${party_quality_label_fr})
        {% endif %};;
  }

  dimension: party_quality_category {
    hidden: yes
    type: string
    sql: ${TABLE}.PartyQualityCategory ;;
  }

  dimension: party_quality_category_label_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.PartyQualityCategoryLabelFR ;;
  }

  dimension: party_quality_category_label_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.PartyQualityCategoryLabelNL ;;
  }

  dimension: party_quality_code {
    # group_label: "Quality"
    label: "Quality Code"
    hidden: yes
    type: string
    sql: ${TABLE}.PartyQualityCode ;;
  }

  dimension: party_quality_label_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.PartyQualityLabelFR ;;
  }

  dimension: party_quality_label_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.PartyQualityLabelNL ;;
  }

  dimension: pk_ereg_party_quality {
    hidden: yes
    type: string
    sql: ${TABLE}.PK_EregPartyQuality ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}

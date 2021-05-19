view: ereg_vw_dim_party_quality {
  label: "Party"
  sql_table_name: `dwh.ereg_vwDimPartyQuality`
    ;;

  parameter: pick_language_quality {
    label: "Party Quality Language Selector"
    type: string
    allowed_value: { value: "NL" }
    allowed_value: { value: "FR" }
  }

  dimension: party_quality_category_label {
    group_label: "Quality"
    group_item_label: "Category"
    label_from_parameter: pick_language_quality
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
    group_label: "Quality"
    group_item_label: "Label"
    label_from_parameter: pick_language_quality
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
    group_label: "Quality"
    group_item_label: "Code"
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

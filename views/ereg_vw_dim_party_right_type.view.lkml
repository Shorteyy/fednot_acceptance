view: ereg_vw_dim_party_right_type {
  label: "Dim Party"
  sql_table_name: `dwh.ereg_vwDimPartyRightType`
    ;;

  parameter: pick_language_right_type {
    label: "Party Right Type Language Selector"
    type: string
    allowed_value: { value: "NL" }
    allowed_value: { value: "FR" }
  }

  dimension: party_right_type_label {
    # group_label: "Right Type"
    label: "Right Type"
    label_from_parameter: pick_language_right_type
    description: "Type of right that links a given receiving party to a given good (real estate);
As the receiving right type binds a given receiving party to a given good, one can fall in transactions where :
 - the party yields the rights of the good; then the party will get a receiving right type value: 'DUMMY' - the party is linked to a given good without any right transfer; the party will get a receiving right type 'DUMMY (T1)' or 'DUMMY (T2)' depending on the TransactioTypeFamily (cfr. Transaction Type)
Moreover, if the notary decides that the right is too complex to be categorized in the system, then the receiving right will get the type value: 'COMPLEX'"
    sql:
        {% if pick_language_right_type._parameter_value == "'NL'" %}
          IF(${party_right_type_label_nl} = "NULL",${party_right_type_label_fr},${party_right_type_label_nl})
        {% elsif pick_language_right_type._parameter_value == "'FR'" %}
          IF(${party_right_type_label_fr} = "NULL",${party_right_type_label_nl },${party_right_type_label_fr})
         {% else %}
          coalesce(${party_right_type_label_nl},${party_right_type_label_fr})
        {% endif %};;
  }

  dimension: party_right_type_code {
    group_label: "Right Type"
    label: "Code"
    hidden: yes
    type: string
    sql: ${TABLE}.PartyRightTypeCode ;;
  }

  dimension: party_right_type_label_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.PartyRightTypeLabelFR ;;
  }

  dimension: party_right_type_label_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.PartyRightTypeLabelNL ;;
  }

  dimension: pk_ereg_party_right_type {
    hidden: yes
    type: string
    sql: ${TABLE}.PK_EregPartyRightType ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}

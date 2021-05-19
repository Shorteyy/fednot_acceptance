view: ereg_vw_dim_party {
  label: "Party"
  sql_table_name: `dwh.ereg_vwDimParty`
    ;;

  parameter: pick_language_party {
    label: "Party Language Selector"
    type: string
    allowed_value: { value: "NL" }
    allowed_value: { value: "FR" }
  }

  dimension: party_source_label {
    # group_label: "Party"
    group_item_label: "Source"
    label_from_parameter: pick_language_party
    sql:
        {% if pick_language_party._parameter_value == "'NL'" %}
          IF(${party_source_label_nl} = "NULL",${party_source_label_fr},${party_source_label_nl})
        {% elsif pick_language_party._parameter_value == "'FR'" %}
          IF(${party_source_label_fr} = "NULL",${party_source_label_nl },${party_source_label_fr})
         {% else %}
          coalesce(${party_source_label_nl},${party_source_label_fr})
        {% endif %};;
  }

  dimension: party_type_label {
    # group_label: "Party"
    group_item_label: "Type"
    label_from_parameter: pick_language_party
    sql:
        {% if pick_language_party._parameter_value == "'NL'" %}
          IF(${party_type_label_nl} = "NULL",${party_type_label_fr},${party_type_label_nl})
        {% elsif pick_language_party._parameter_value == "'FR'" %}
          IF(${party_type_label_fr} = "NULL",${party_type_label_nl },${party_type_label_fr})
         {% else %}
          coalesce(${party_type_label_nl},${party_type_label_fr})
        {% endif %};;
  }

  dimension: moral_party_bcenumber {
    # group_label: "Party"
    group_item_label: "BCE Number"
    type: string
    sql: ${TABLE}.MoralPartyBCENumber ;;
  }

  dimension: party_age {
   # group_label: "Party"
    group_item_label: "Age"
    type: string
    sql: ${TABLE}.PartyAge ;;
  }

  dimension: party_birth_year {
    # group_label: "Party"
    group_item_label: "Year of Birth"
    type: string
    sql: ${TABLE}.PartyBirthYear ;;
  }

  dimension: party_city {
    # group_label: "Party"
    group_item_label: "City"
    type: string
    sql: ${TABLE}.PartyCity ;;
  }

  dimension: party_country_code {
    # group_label: "Party"
    group_item_label: "Country Code"
    type: string
    sql: ${TABLE}.PartyCountryCode ;;
  }

  dimension: party_legal_form_label {
    # group_label: "Party"
    group_item_label: "Legal Form"
    type: string
    sql: ${TABLE}.PartyLegalFormLabel ;;
  }

  dimension: party_legal_form_label_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.PartyLegalFormLabelFR ;;
  }

  dimension: party_legal_form_label_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.PartyLegalFormLabelNL ;;
  }

  dimension: party_postal_code {
    # group_label: "Party"
    group_item_label: "Postal Code"
    type: string
    sql: ${TABLE}.PartyPostalCode ;;
  }

  dimension: party_sending_reference {
    # group_label: "Party"
    group_item_label: "Sending Reference"
    type: string
    sql: ${TABLE}.PartySendingReference ;;
  }

  dimension: party_source {
    hidden: yes
    group_label: "Party"
    group_item_label: "Source"
    type: string
    sql: ${TABLE}.PartySource ;;
  }

  dimension: party_source_label_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.PartySourceLabelFR ;;
  }

  dimension: party_source_label_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.PartySourceLabelNL ;;
  }

  dimension: party_street {
    # group_label: "Party"
    group_item_label: "Street"
    type: string
    sql: ${TABLE}.PartyStreet ;;
  }

  dimension: party_type {
    hidden: yes
    # group_label: "Party"
    group_item_label: "Type"
    type: string
    sql: ${TABLE}.PartyType ;;
  }

  dimension: party_type_label_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.PartyTypeLabelFR ;;
  }

  dimension: party_type_label_nl {
    hidden:  yes
    type: string
    sql: ${TABLE}.PartyTypeLabelNL ;;
  }

  dimension: pk_ereg_party {
    hidden: yes
    type: string
    sql: ${TABLE}.PK_EregParty ;;
  }

  dimension: sending_party_id {
    # group_label: "Party"
    group_item_label: "Sending ID"
    type: string
    sql: ${TABLE}.SendingPartyId ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}

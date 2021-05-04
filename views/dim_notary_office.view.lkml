view: dim_notary_office {
  label: "Notary Office"
  sql_table_name: `dwh.dim_notaryOffice`
    ;;

  # parameter: pick_language {
  #   label: "Geography Language Selector"
  #   type: string
  #   allowed_value: { value: "NL" }
  #   allowed_value: { value: "FR" }
  # }

  dimension: address {
    type: string
    # hidden: yes
    sql: ${TABLE}.address ;;
  }

  dimension: address_fr {
    type: string
    hidden: yes
    sql: ${TABLE}.addressFr ;;
  }

  dimension: address_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.addressNl ;;
  }

  # dimension: address_description {
  #   label: "Address"
  #   label_from_parameter: pick_language
  #   sql:
  #       {% if pick_language._parameter_value == "'NL'" %}
  #         IF(${address_nl} = "NA",${address_fr},${address_nl})
  #       {% elsif pick_language._parameter_value == "'FR'" %}
  #         IF(${address_fr} = "NA",${address_nl},${address_fr})
  #       {% else %}
  #         ${address}
  #       {% endif %};;
  # }

  dimension: dim_notary_office_sk {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.dim_notaryOffice_sk ;;
  }

  dimension: h_notary_office_bk {
    hidden: yes
    type: number
    sql: ${TABLE}.h_notaryOffice_bk ;;
  }

  # dimension: m_model_run_id {
  #   type: string
  #   sql: ${TABLE}.m_model_run_id ;;
  # }

  dimension: municipality {
    type: string
    sql: ${TABLE}.municipality ;;
  }

  dimension: municipality_fr {
    hidden:  yes
    type: string
    sql: ${TABLE}.municipalityFr ;;
  }

  dimension: municipality_nl {
    hidden:  yes
    type: string
    sql: ${TABLE}.municipalityNl ;;
  }

  # dimension: municipality_description {
  #   label: "Municipality"
  #   label_from_parameter: pick_language
  #   sql:
  #       {% if pick_language._parameter_value == "'NL'" %}
  #         IF(${municipality_nl} ="NA",${municipality_fr},${municipality_nl})
  #       {% elsif pick_language._parameter_value == "'FR'" %}
  #         IF(${municipality_fr} ="NA",${municipality_nl},${municipality_fr})
  #       {% else %}
  #         ${municipality}
  #       {% endif %};;
  # }

  dimension: notary_office_name {
    type: string
    sql: ${TABLE}.notaryOfficeName ;;
  }

  dimension: postal_code {
    type: number
    sql: ${TABLE}.postalCode ;;
  }

  dimension: row_current {
    hidden: yes
    type: number
    sql: ${TABLE}.row_current ;;
  }

  # dimension_group: row_end_dt {
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
  #   sql: ${TABLE}.row_end_dt ;;
  # }

  # dimension_group: row_start_dt {
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
  #   sql: ${TABLE}.row_start_dt ;;
  # }

  # dimension_group: row_start_dt_orig {
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
  #   sql: ${TABLE}.row_start_dt_orig ;;
  # }

  measure: count {
    type: count
    hidden: yes
    drill_fields: []
  }
}

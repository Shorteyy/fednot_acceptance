view: ereg_vw_dim_sp25 {
  label: "Dim SP25"
  sql_table_name: `dwh.ereg_vwDimSP25`
    ;;

  parameter: pick_language {
    label: "SP25 Language Selector"
    type: string
    allowed_value: { value: "NL" }
    allowed_value: { value: "FR" }
  }

  dimension: sp25 {
    label: "SP25"
    label_from_parameter: pick_language
    description: "The categorization of the workflow used to process the transaction at FodFin side"
    sql:
        {% if pick_language._parameter_value == "'NL'" %}
          IF(${sp25_label_nl} = "NULL",${sp25_label_fr},${sp25_label_nl})
        {% elsif pick_language._parameter_value == "'FR'" %}
          IF(${sp25_label_fr} = "NULL",${sp25_label_nl},${sp25_label_fr})
         {% else %}
          coalesce(${sp25_label_nl},${sp25_label_fr})
        {% endif %};;
  }

  dimension: pk_ereg_sp25 {
    hidden: yes
    type: string
    sql: ${TABLE}.PK_EregSP25 ;;
  }

  dimension: sp25_code {
    hidden: yes
    type: string
    sql: ${TABLE}.SP25Code ;;
  }

  dimension: sp25_label_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.SP25LabelFR ;;
  }

  dimension: sp25_label_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.SP25LabelNL ;;
  }

  measure: count {
    hidden:  yes
    type: count
    drill_fields: []
  }
}

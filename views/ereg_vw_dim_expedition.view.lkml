view: ereg_vw_dim_expedition {
  label: "Dimensions"
  sql_table_name: `dwh.ereg_vwDimExpedition`
    ;;

  parameter: pick_language {
    group_label: "Expedition"
    label: "Expedition Language Selector"
    type: string
    allowed_value: { value: "NL" }
    allowed_value: { value: "FR" }
  }

  dimension: expedition_change_mode_code {
    group_label: "Expedition"
    description: "Trigger that caused the change of the expedition status (By user himself, through the feedback, through the sending answer)"
    hidden: yes
    type: string
    sql: ${TABLE}.ExpeditionChangeModeCode ;;
  }

  dimension: expedition_change_mode_label_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.ExpeditionChangeModeLabelFR ;;
  }

  dimension: expedition_change_mode_label_nl {
    hidden:  yes
    type: string
    sql: ${TABLE}.ExpeditionChangeModeLabelNL ;;
  }

  dimension: expedition_change_mode {
       group_label: "Expedition"
       label_from_parameter: pick_language
      description: "Trigger that caused the change of the expedition status (By user himself, through the feedback, through the sending answer)"
    sql:
        {% if pick_language._parameter_value == "'NL'" %}
          IF(${expedition_change_mode_label_nl} = "NULL",${expedition_change_mode_label_fr},${expedition_change_mode_label_nl})
        {% elsif pick_language._parameter_value == "'FR'" %}
          IF(${expedition_change_mode_label_fr} = "NULL",${expedition_change_mode_label_nl },${expedition_change_mode_label_fr})
         {% else %}
          coalesce(${expedition_change_mode_label_nl},${expedition_change_mode_label_fr})
        {% endif %};;
  }

  dimension: expedition_id {
    group_label: "Expedition"
    description: "Technical identifier of the Expedition generated by Landing Zone process (BI)"
    hidden: yes
    type: string
    sql: ${TABLE}.ExpeditionId ;;
  }

  dimension: expedition_reference {
    group_label: "Expedition"
    description: "Internal unique reference of the Expedition"
    type: string
    sql: ${TABLE}.ExpeditionReference ;;
  }

  dimension: expedition_status_code {
    group_label: "Expedition"
    description: "Status of the expedition (in preparation, pending feedback,…)"
    hidden: yes
    type: string
    sql: ${TABLE}.ExpeditionStatusCode ;;
  }

  dimension: expedition_status_label_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.ExpeditionStatusLabelFR ;;
  }

  dimension: expedition_status_label_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.ExpeditionStatusLabelNL ;;
  }

  dimension: expedition_status {
    group_label: "Expedition"
    label_from_parameter: pick_language
    description: "Status of the expedition (in preparation, pending feedback,…)"
    sql:
    {% if pick_language._parameter_value == "'NL'" %}
    IF(${expedition_status_label_nl} = "NULL",${expedition_status_label_fr},${expedition_status_label_nl})
    {% elsif pick_language._parameter_value == "'FR'" %}
    IF(${expedition_status_label_fr} = "NULL",${expedition_status_label_nl},${expedition_status_label_fr})
    {% else %}
    coalesce(${expedition_status_label_nl},${expedition_status_label_fr})
    {% endif %};;
  }

  dimension: pk_ereg_expedition {
     hidden:  yes
     type: string
     sql: ${TABLE}.PK_EregExpedition ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}

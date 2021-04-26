view: dim_province {
  label: "Province"
  sql_table_name: `dwh.dim_province`
    ;;

  parameter: pick_language {
    type: string
    allowed_value: { value: "NL" }
    allowed_value: { value: "FR" }
  }

  dimension: country_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.countryNl ;;
  }

  dimension: country_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.countryFr ;;
  }

  dimension: country_description {
    label: "Country"
    label_from_parameter: pick_language
    sql:
        {% if pick_language._parameter_value == "'NL'" %}
          ${country_nl}
        {% elsif pick_language._parameter_value == "'FR'" %}
          ${country_fr}
         {% else %}
           ${country_nl}
        {% endif %};;
  }

  dimension: country_lat {
    hidden: yes
    type: number
    sql: ${TABLE}.countryLat ;;
  }

  dimension: country_lon {
    hidden:  yes
    type: number
    sql: ${TABLE}.countryLon ;;
  }

  dimension: dim_province_sk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.dim_province_sk ;;
  }

  dimension: h_province_bk {
    type: string
    sql: ${TABLE}.h_province_bk ;;
  }

   dimension: province_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.provinceFr ;;
  }

  dimension: province_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.provinceNl ;;
  }

  dimension: province_description {
    label: "Province"
    label_from_parameter: pick_language
    sql:
        {% if pick_language._parameter_value == "'NL'" %}
          ${province_nl}
        {% elsif pick_language._parameter_value == "'FR'" %}
          ${province_fr}
         {% else %}
           ${province_nl}
        {% endif %};;
  }

  dimension: province_lat {
    hidden: yes
    type: number
    sql: ${TABLE}.provinceLat ;;
  }

  dimension: province_lon {
    hidden: yes
    type: number
    sql: ${TABLE}.provinceLon ;;
  }

  dimension: province_rbr {
    type: string
    sql: ${TABLE}.provinceRbr ;;
  }

  dimension: region_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.regionNl ;;
  }

  dimension: region_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.regionFr ;;
  }

  dimension: region_description {
    label: "Region"
    label_from_parameter: pick_language
    sql:
        {% if pick_language._parameter_value == "'NL'" %}
          ${region_nl}
        {% elsif pick_language._parameter_value == "'FR'" %}
          ${region_fr}
         {% else %}
           ${region_nl}
        {% endif %};;
  }

  dimension: region_id {
    hidden: yes
    type: number
    sql: ${TABLE}.regionId ;;
  }

  dimension: region_lat {
    hidden: yes
    type: number
    sql: ${TABLE}.regionLat ;;
  }

  dimension: region_lon {
    hidden: yes
    type: number
    sql: ${TABLE}.regionLon ;;
  }

  dimension: region_rbr {
    type: string
    sql: ${TABLE}.regionRbr ;;
  }

  dimension_group: row_end_dt {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.row_end_dt ;;
  }

  dimension: row_is_current_flag {
    type: number
    hidden: yes
    sql: ${TABLE}.row_is_current_flag ;;
  }

  dimension_group: row_start_dt {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.row_start_dt ;;
  }

  dimension: m_model_run_id {
    type: string
    hidden: yes
    sql: ${TABLE}.m_model_run_id ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [m_model_run.m_model_run_id, m_model_run.m_model_name]
  }
}

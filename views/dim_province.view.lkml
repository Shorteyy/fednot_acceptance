include: "/views/global_parameters.view.lkml"
view: dim_province {
  extends: [global_parameters]
  label: "Geography"
  sql_table_name: `dwh.dim_province`
    ;;

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

  dimension: country_name {
    label: "Country Name"
    map_layer_name: countries
    drill_fields: [region_name, province_name]
    label_from_parameter: language_picker
    sql:
        {% if language_picker._parameter_value == "'NL'" %}
          ${country_nl}
        {% elsif language_picker._parameter_value == "'FR'" %}
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

  dimension: country_location {
    type: location
    sql_latitude: ${TABLE}.country_lat ;;
    sql_longitude: ${TABLE}.country_lon ;;
  }

  dimension: dim_province_sk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.dim_province_sk ;;
  }

  dimension: h_province_bk {
    hidden: yes
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

  dimension: province_name {
    label: "Province Name"
    label_from_parameter: language_picker
    sql:
        {% if language_picker._parameter_value == "'NL'" %}
          ${province_nl}
        {% elsif language_picker._parameter_value == "'FR'" %}
          ${province_fr}
         {% else %}
           ${province_nl}
        {% endif %};;
  }

  # dimension: province_area {
  #   label: "Province Area"
  #   type: string
  #   map_layer_name: province_location_belgium
  #   sql: concat("Provincie " || trim(${TABLE}.provinceNl)) ;;
  # }

  dimension: province {
    label: "Province"
    type: string
    map_layer_name: province_location_belgium_ereg
    sql: ${nis_code_province} ;;
    html: {{ province_name._linked_value }} ;;
  }

  dimension: region {
    label: "Region"
    type: string
    drill_fields: [province]
    map_layer_name: region_location_belgium_ereg
    sql: ${nis_code_region} ;;
    html: {{region_name._linked_value}} ;;
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

  dimension: province_location {
    type: location
    sql_latitude: ${TABLE}.province_lat ;;
    sql_longitude: ${TABLE}.province_lon ;;
  }

  dimension: province_rbr {
    hidden: yes
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

  dimension: nis_code_province {
    hidden: yes
    type: string
    sql: CASE WHEN ${TABLE}.provnis = "4000" THEN "04000" ELSE ${TABLE}.provnis END;;
    # sql: CASE
    #   WHEN LEFT(${TABLE}.provnis,2) = "21" THEN "04000"
    #   WHEN LEFT(${TABLE}.provnis,2) in ("23","24") THEN "20001"
    #   WHEN LEFT(${TABLE}.provnis,2) = "25" THEN "20002"
    #   ELSE CONCAT(LEFT(${TABLE}.provnis,1),"0000") END ;;
  }

  dimension: nis_code_region {
    hidden: yes
    type: string
    sql: CONCAT("0" || ${TABLE}.regnis);;
    # sql: CASE
    #   WHEN LEFT(${TABLE}.regnis,2) = "21" THEN "04000"
    #   WHEN LEFT(${TABLE}.regnis,2) in ("11","12","13","23","24","31","32","33","34","35","36","37","38","41","42","43","44","45","46","71","72","73") THEN "02000"
    #   ELSE "03000" END ;;
  }

  dimension: region_name {
    label: "Region Name"
    label_from_parameter: language_picker
    sql:
        {% if language_picker._parameter_value == "'NL'" %}
          ${region_nl}
        {% elsif language_picker._parameter_value == "'FR'" %}
          ${region_fr}
         {% else %}
           ${region_nl}
        {% endif %};;
  }

  # dimension: region_area {
  #   type: string
  #   label: "Region Area"
  #   drill_fields: [province_area]
  #   map_layer_name: region_location_belgium
  #   sql: CASE
  #         WHEN ${TABLE}.regionNl = "Vlaanderen" THEN "Vlaams Gewest"
  #         WHEN ${TABLE}.regionNl = "Wallonië" THEN "Waals Gewest"
  #         ELSE "Brussels Hoofdstedelijk Gewest"
  #         END ;;
  # }

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

  dimension: region_location {
    type: location
    sql_latitude: ${TABLE}.region_lat ;;
    sql_longitude: ${TABLE}.region_lon ;;
  }

  dimension: region_rbr {
    hidden: yes
    type: string
    sql: ${TABLE}.regionRbr ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: []
  }
}

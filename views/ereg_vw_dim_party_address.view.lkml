view: ereg_vw_dim_party_address {
  label: "Dim Party"
  sql_table_name: `dwh.ereg_vwDimPartyAddress`
    ;;

  dimension: country_name {
    group_label: "Address"
    group_item_label: "Country"
    type: string
    sql: ${TABLE}.CountryName ;;
  }

  dimension: district_id {
    hidden: yes
    type: string
    sql: ${TABLE}.districtId ;;
  }

  dimension: district_name {
    group_label: "Address"
    group_item_label: "District"
    type: string
    sql: ${TABLE}.DistrictName ;;
  }

  dimension: district_name_de {
    hidden: yes
    type: string
    sql: ${TABLE}.DistrictNameDE ;;
  }

  dimension: district_name_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.DistrictNameFR ;;
  }

  dimension: district_name_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.DistrictNameNL ;;
  }

  dimension: district_name_tableau {
    hidden: yes
    type: string
    sql: ${TABLE}.DistrictName_Tableau ;;
  }

  dimension: is_streets_belgian_coast {
    group_label: "Address"
    group_item_label: "Street Belgian Coast?"
    type: string
    sql: ${TABLE}.isStreetsBelgianCoast ;;
  }

  dimension: is_zip_belgian_coast {
    group_label: "Address"
    group_item_label: "Zip Belgian Coast?"
    type: string
    sql: ${TABLE}.isZipBelgianCoast ;;
  }

  dimension: is_zip_frontalier {
    group_label: "Address"
    group_item_label: "Zip Frontalier?"
    type: string
    sql: ${TABLE}.isZipFrontalier ;;
  }

  dimension: is_zip_town {
    group_label: "Address"
    group_item_label: "Zip Town?"
    type: string
    sql: ${TABLE}.isZipTown ;;
  }

  dimension: locality_id {
    hidden: yes
    type: string
    sql: ${TABLE}.localityId ;;
  }

  dimension: locality_name {
    group_label: "Address"
    group_item_label: "Locality"
    type: string
    sql: ${TABLE}.LocalityName ;;
  }

  dimension: locality_name_de {
    hidden: yes
    type: string
    sql: ${TABLE}.LocalityNameDE ;;
  }

  dimension: locality_name_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.LocalityNameFR ;;
  }

  dimension: locality_name_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.LocalityNameNL ;;
  }

  dimension: main_locality_name {
    group_label: "Address"
    group_item_label: "Main Locality"
    type: string
    sql: ${TABLE}.MainLocalityName ;;
  }

  dimension: matching_level {
    group_label: "Address"
    group_item_label: "Matching Level"
    type: string
    sql: ${TABLE}.MatchingLevel ;;
  }

  dimension: municipality_id {
    hidden: yes
    type: string
    sql: ${TABLE}.municipalityId ;;
  }

  dimension: municipality_name {
    group_label: "Address"
    group_item_label: "Municipality"
    type: string
    sql: ${TABLE}.MunicipalityName ;;
  }

  dimension: municipality_name_de {
    hidden: yes
    type: string
    sql: ${TABLE}.MunicipalityNameDE ;;
  }

  dimension: municipality_name_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.MunicipalityNameFR ;;
  }

  dimension: municipality_name_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.MunicipalityNameNL ;;
  }

  dimension: nis_code_municipality {
    # hidden: yes
    type: string
    sql: ${TABLE}.NisCode ;;
  }

  dimension: nis_code_arrondissement {
    # hidden: yes
    type: string
    sql: CONCAT(LEFT(${TABLE}.NisCode,2),"000") ;;
  }

  dimension: nis_code_province {
    # hidden: yes
    type: string
    sql: CASE
           WHEN ${TABLE}.NisCode = "'20001'" THEN ${TABLE}.NisCode
           WHEN ${TABLE}.NisCode = "'20002'" THEN ${TABLE}.NisCode
           ELSE CONCAT(LEFT(${TABLE}.NisCode,1),"0000") END ;;
  }

  dimension: pk_address {
    primary_key: yes
    hidden:  yes
    type: string
    sql: ${TABLE}.PK_Address ;;
  }

  dimension: province_id {
    hidden: yes
    type: string
    sql: ${TABLE}.provinceId ;;
  }

  dimension: province_name {
    group_label: "Address"
    group_item_label: "Province"
    type: string
    sql: ${TABLE}.ProvinceName ;;
  }

  dimension: province_name_de {
    hidden: yes
    type: string
    sql: ${TABLE}.ProvinceNameDE ;;
  }

  dimension: province_name_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.ProvinceNameFR ;;
  }

  dimension: province_name_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.ProvinceNameNL ;;
  }

  dimension: province_area {
    group_label: "Address"
    group_item_label: "Province Area"
    type: string
    map_layer_name: province_location_belgium
    sql: concat("Provincie " || trim(${TABLE}.ProvinceNameNL)) ;;
  }

  dimension: region_id {
    hidden: yes
    type: string
    sql: ${TABLE}.regionId ;;
  }

  dimension: region_name {
    group_label: "Address"
    group_item_label: "Region"
    type: string
    sql: ${TABLE}.RegionName ;;
  }

  dimension: region_name_de {
    hidden: yes
    type: string
    sql: ${TABLE}.RegionNameDE ;;
  }

  dimension: region_name_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.RegionNameFR ;;
  }

  dimension: region_name_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.RegionNameNL ;;
  }

  dimension: region_area {
    group_label: "Address"
    group_item_label: "Region Area"
    type: string
    label: "Region Area"
    drill_fields: [province_area]
    # link: {label: "Show as Geographical Visualization"
    #   url: "{% assign vis_config = '{
    #       vis={\"map_plot_mode\":\"points\",\"heatmap_gridlines\":false,\"heatmap_gridlines_empty\":false,\"heatmap_opacity\":0.4,\"show_region_field\":true,\"draw_map_labels_above_data\":true,\"map_tile_provider\":\"outdoors\",\"map_position\":\"fit_data\",\"map_scale_indicator\":\"metric\",\"map_pannable\":true,\"map_zoomable\":true,\"map_marker_type\":\"circle\",\"map_marker_icon_name\":\"default\",\"map_marker_radius_mode\":\"proportional_value\",\"map_marker_units\":\"meters\",\"map_marker_proportional_scale_type\":\"linear\",\"map_marker_color_mode\":\"fixed\",\"show_view_names\":false,\"show_legend\":true,\"quantize_map_value_colors\":false,\"reverse_map_value_colors\":false,\"map_latitude\":50.161064818858684,\"map_longitude\":4.630737304687501,\"map_zoom\":8,\"type\":\"looker_map\",\"defaults_version\":1}
    #     }' %}
    #   {{ link }}&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=5000"
    # }
    map_layer_name: region_location_belgium
    sql: CASE
          WHEN ${TABLE}.RegionNameNL = "VLAAMS GEWEST" THEN "Vlaams Gewest"
          WHEN ${TABLE}.RegionNameNL = "WAALS GEWEST" THEN "Waals Gewest"
          ELSE "Brussels Hoofdstedelijk Gewest"
          END ;;
  }

  dimension: street_code {
    hidden: yes
    type: string
    sql: ${TABLE}.StreetCode ;;
  }

  dimension: street_id {
    hidden: yes
    type: string
    sql: ${TABLE}.streetId ;;
  }

  dimension: street_name {
    group_label: "Address"
    group_item_label: "Street"
    type: string
    sql: ${TABLE}.StreetName ;;
  }

  dimension: street_name_de {
    hidden: yes
    type: string
    sql: ${TABLE}.StreetNameDE ;;
  }

  dimension: street_name_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.StreetNameFR ;;
  }

  dimension: street_name_nl {
    hidden:  yes
    type: string
    sql: ${TABLE}.StreetNameNL ;;
  }

  dimension: zip_code {
    group_label: "Address"
    group_item_label: "Zip Code"
    type: zipcode
    sql: ${TABLE}.ZipCode ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      street_name,
      country_name,
      locality_name,
      province_name,
      region_name,
      municipality_name,
      district_name,
      main_locality_name
    ]
  }
}

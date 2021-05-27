view: ereg_vw_dim_study_address {
  label: "Dim Notary Office"
  sql_table_name: `dwh.ereg_vwDimStudyAddress`
    ;;

  dimension: country_name {
    group_label: "Address"
    type: string
    sql: ${TABLE}.CountryName ;;
  }

  dimension: district_id {
    hidden: yes
    group_label: "Address"
    type: string
    sql: ${TABLE}.districtId ;;
  }

  dimension: district_name {
    group_label: "Address"
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

  dimension: is_streets_belgian_coast {
    group_label: "Address"
    type: string
    sql: ${TABLE}.isStreetsBelgianCoast ;;
  }

  dimension: is_zip_belgian_coast {
    group_label: "Address"
    type: string
    sql: ${TABLE}.isZipBelgianCoast ;;
  }

  dimension: is_zip_frontalier {
    group_label: "Address"
    type: string
    sql: ${TABLE}.isZipFrontalier ;;
  }

  dimension: is_zip_town {
    group_label: "Address"
    type: string
    sql: ${TABLE}.isZipTown ;;
  }

  dimension: locality_id {
    hidden: yes
    group_label: "Address"
    type: string
    sql: ${TABLE}.localityId ;;
  }

  dimension: locality_name {
    group_label: "Address"
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
    type: string
    sql: ${TABLE}.MainLocalityName ;;
  }

  dimension: matching_level {
    group_label: "Address"
    type: string
    sql: ${TABLE}.MatchingLevel ;;
  }

  dimension: municipality_id {
    hidden: yes
    group_label: "Address"
    type: string
    sql: ${TABLE}.municipalityId ;;
  }

  dimension: municipality_name {
    group_label: "Address"
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

  dimension: nis_code {
    hidden: yes
    type: string
    sql: ${TABLE}.NisCode ;;
  }

  dimension: nis_code_municipality {
    group_label: "Geography"
    hidden: yes
    type: string
    sql: ${TABLE}.NisCode ;;
  }

  dimension: nis_code_district {
    group_label: "Geography"
    hidden: yes
    type: string
    sql: CONCAT(LEFT(${TABLE}.NisCode,2),"000") ;;
  }

  dimension: nis_code_province {
    group_label: "Geography"
    hidden: yes
    type: string
    sql: CASE
           WHEN LEFT(${TABLE}.NisCode,2) = "21" THEN "04000"
           WHEN LEFT(${TABLE}.NisCode,2) in ("23","24") THEN "20001"
           WHEN LEFT(${TABLE}.NisCode,2) = "25" THEN "20002"
           ELSE CONCAT(LEFT(${TABLE}.NisCode,1),"0000") END ;;
  }

  dimension: nis_code_region {
    group_label: "Geography"
    hidden: yes
    type: string
    sql: CASE
           WHEN LEFT(${TABLE}.NisCode,2) = "21" THEN "04000"
           WHEN LEFT(${TABLE}.NisCode,2) in ("11","12","13","23","24","31","32","33","34","35","36","37","38","41","42","43","44","45","46","71","72","73") THEN "02000"
           ELSE "03000" END ;;
  }

  dimension: pk_address {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.PK_Address ;;
  }

  dimension: province_id {
    hidden: yes
    group_label: "Address"
    type: string
    sql: ${TABLE}.provinceId ;;
  }

  dimension: province_name {
    group_label: "Address"
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

  dimension: municipality {
    group_label: "Address"
    label: "Municipality"
    type: string
    map_layer_name: municipality_location_belgium_ereg
    sql: ${nis_code_municipality} ;;
    html: {{ municipality_name._linked_value}} ;;
  }

  dimension: district {
    group_label: "Address"
    label: "District"
    type: string
    drill_fields: [municipality]
    map_layer_name: district_location_belgium_ereg
    sql: ${nis_code_district} ;;
    html: {{district_name._linked_value}} ;;
  }

  dimension: province {
    group_label: "Address"
    label: "Province"
    type: string
    drill_fields: [district, municipality]
    map_layer_name: province_location_belgium_ereg
    sql: ${nis_code_province} ;;
    html: {{ province_name._linked_value }} ;;
  }

  dimension: region {
    group_label: "Address"
    label: "Region"
    type: string
    drill_fields: [province, district, municipality]
    map_layer_name: region_location_belgium_ereg
    sql: ${nis_code_region} ;;
    html: {{region_name._linked_value}} ;;
  }


  dimension: region_id {
    hidden: yes
    group_label: "Address"
    type: string
    sql: ${TABLE}.regionId ;;
  }

  dimension: region_name {
    group_label: "Address"
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

  dimension: street_code {
    group_label: "Address"
    type: string
    sql: ${TABLE}.StreetCode ;;
  }

  dimension: street_id {
    hidden: yes
    group_label: "Address"
    type: string
    sql: ${TABLE}.streetId ;;
  }

  dimension: street_name {
    group_label: "Address"
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
    hidden: yes
    type: string
    sql: ${TABLE}.StreetNameNL ;;
  }

  dimension: zip_code {
    group_label: "Address"
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

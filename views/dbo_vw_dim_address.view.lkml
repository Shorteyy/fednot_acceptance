view: dim_address {
  label: "Dim Geography"
  sql_table_name: `dwh.dbo_vwDimAddress`
    ;;

  dimension: country_name {
    # group_label: "Address"
    label: "Country"
    type: string
    sql: ${TABLE}.CountryName ;;
  }

  dimension: district_id {
    hidden: yes
    type: string
    sql: ${TABLE}.districtId ;;
  }

  dimension: district_name {
    # group_label: "Address"
    label: "District"
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
    # group_label: "Address"
    label: "Street Belgian Coast?"
    type: string
    sql: ${TABLE}.isStreetsBelgianCoast ;;
  }

  dimension: is_zip_belgian_coast {
    # group_label: "Address"
    label: "Zip Belgian Coast?"
    type: string
    sql: ${TABLE}.isZipBelgianCoast ;;
  }

  dimension: is_zip_frontalier {
    # group_label: "Address"
    label: "Zip Frontalier?"
    type: string
    sql: ${TABLE}.isZipFrontalier ;;
  }

  dimension: is_zip_town {
    # group_label: "Address"
    label: "Zip Town?"
    type: string
    sql: ${TABLE}.isZipTown ;;
  }

  dimension: locality_id {
    hidden: yes
    type: string
    sql: ${TABLE}.localityId ;;
  }

  dimension: locality_name {
    # group_label: "Address"
    label: "Locality"
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
    # group_label: "Address"
    label: "Main Locality"
    type: string
    sql: ${TABLE}.MainLocalityName ;;
  }

  dimension: matching_level {
    description: "The geo dimension (lowest level : Street); is a stack of 5 dimensions within one table;
    the different dimensions can be distinguished thanks to the 'matchingLevel' attribute (see field
    description below); i.e. in order to link various systems data to address referential, {streetCode -
      NISCode and Postal Code} have been used; the levels result from a process searching for correspondance
    between systems and address data by using all combinations of these 3 fields; if no match found, then
    a combination of 2 fields taken among the 3 is performed and so on until match found. The more the
    level, the less the precision of the address found:
    - matchinglevel 1: Street
    - matchinglevel 2: Postal code AND NIS code
    - matchinglevel 3: Locality (Postal code)
    - matchinglevel 4: Municipality (NIS code)
    - matchinglevel 5: Region"
    # group_label: "Address"
    label: "Matching Level"
    type: string
    sql: ${TABLE}.MatchingLevel ;;
  }

  dimension: municipality_id {
    hidden: yes
    type: string
    sql: ${TABLE}.municipalityId ;;
  }

  dimension: municipality_name {
    # group_label: "Address"
    label: "Municipality"
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
    label: "Province"
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
    label: "Province Area"
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
    label: "Region"
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

  # dimension: region_name_tableau {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.RegionName_Tableau ;;
  # }

  dimension: region_area {
    label: "Region Area"
    type: string
    drill_fields: [province_area]
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
    # group_label: "Address"
    label: "Street"
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
    # group_label: "Address"
    label: "Zip Code"
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

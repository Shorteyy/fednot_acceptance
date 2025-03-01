view: dim_address {
  label: "Dimensions"
  sql_table_name: `dwh.dbo_vwDimAddress`
    ;;

  dimension: country_name {
    group_label: "Geography"
    label: "Country"
    description: "Name of country"
    type: string
    sql: ${TABLE}.CountryName ;;
  }

  dimension: district_id {
    group_label: "Geography"
    description: "Address Service internal identifier of the district deducted from NIS or postal code (0 for level 5)"
    hidden: yes
    type: string
    sql: ${TABLE}.districtId ;;
  }

  dimension: district_name {
    group_label: "Geography"
    label: "District Name"
    description: "Name of the district in language of the region deducted from NIS or postal code ('Unknown' for level 5)"
    type: string
    sql: ${TABLE}.DistrictName ;;
  }

  dimension: district_name_de {
    group_label: "Geography"
    hidden: yes
    type: string
    sql: ${TABLE}.DistrictNameDE ;;
  }

  dimension: district_name_fr {
    group_label: "Geography"
    hidden: yes
    type: string
    sql: ${TABLE}.DistrictNameFR ;;
  }

  dimension: district_name_nl {
    group_label: "Geography"
    hidden: yes
    type: string
    sql: ${TABLE}.DistrictNameNL ;;
  }

  dimension: is_streets_belgian_coast {
    group_label: "Geography"
    label: "Street Belgian Coast?"
    description: "Flag to indicate that the street located on the belgian dike (sea sight; 0 for other levels than 1)"
    type: string
    sql: ${TABLE}.isStreetsBelgianCoast ;;
  }

  dimension: is_zip_belgian_coast {
    group_label: "Geography"
    label: "Zip Belgian Coast?"
    description: "Flag to indicate that the postal code is from a locality located on the belgian coast  (0 for level 5; random / irrelevant for level 4)"
    type: string
    sql: ${TABLE}.isZipBelgianCoast ;;
  }

  dimension: is_zip_frontalier {
    group_label: "Geography"
    label: "Zip Frontalier?"
    description: "Flag to indicate that the postal code is from a locality located on the belgian border (0 for level 5; random / irrelevant for level 4)"
    type: string
    sql: ${TABLE}.isZipFrontalier ;;
  }

  dimension: is_zip_town {
    group_label: "Geography"
    label: "Zip Town?"
    description: "Flag to indicate that the postal code is from a locality is part of an urban area (0 for level 5; random / irrelevant for level 4)"
    type: string
    sql: ${TABLE}.isZipTown ;;
  }

  dimension: locality_id {
    group_label: "Geography"
    description: "Address Service internal identifier of the locality deducted from postal code (0 for level 5; random / irrelevant for level 4)"
    hidden: yes
    type: string
    sql: ${TABLE}.localityId ;;
  }

  dimension: locality_name {
    group_label: "Geography"
    label: "Locality"
    description: "Name of the locality in the language of the region deducted from postal code ('Unknown' level 5; random / irrelevant for level 4)"
    type: string
    sql: ${TABLE}.LocalityName ;;
  }

  dimension: locality_name_de {
    group_label: "Geography"
    hidden: yes
    type: string
    sql: ${TABLE}.LocalityNameDE ;;
  }

  dimension: locality_name_fr {
    group_label: "Geography"
    hidden: yes
    type: string
    sql: ${TABLE}.LocalityNameFR ;;
  }

  dimension: locality_name_nl {
    group_label: "Geography"
    hidden: yes
    type: string
    sql: ${TABLE}.LocalityNameNL ;;
  }

  dimension: main_locality_name {
    group_label: "Geography"
    label: "Main Locality"
    type: string
    sql: ${TABLE}.MainLocalityName ;;
  }

  dimension: matching_level {
    group_label: "Geography"
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
    group_label: "Geography"
    description: "Address Service internal identifier of the municipality deducted from NIS or postal code (0 for level 5)"
    hidden: yes
    type: string
    sql: ${TABLE}.municipalityId ;;
  }

  dimension: municipality_name {
    group_label: "Geography"
    description: "Name of the municipality in the language of the region deducted from NIS or postal code ('Unknown' for level 5)"
    label: "Municipality Name"
    type: string
    sql: ${TABLE}.MunicipalityName ;;
  }

  dimension: municipality_name_de {
    group_label: "Geography"
    hidden: yes
    type: string
    sql: ${TABLE}.MunicipalityNameDE ;;
  }

  dimension: municipality_name_fr {
    group_label: "Geography"
    hidden: yes
    type: string
    sql: ${TABLE}.MunicipalityNameFR ;;
  }

  dimension: municipality_name_nl {
    group_label: "Geography"
    hidden: yes
    type: string
    sql: ${TABLE}.MunicipalityNameNL ;;
  }

  dimension: nis_code {
    group_label: "Geography"
    description: "5-digits NIS Code of the municipality (0 for levels 3 and 5)"
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
    group_label: "Geography"
    primary_key: yes
    hidden:  yes
    type: string
    sql: ${TABLE}.PK_Address ;;
  }

  dimension: province_id {
    group_label: "Geography"
    description: "Address Service internal identifier of the province deducted from NIS or postal code (0 for level 5)"
    hidden: yes
    type: string
    sql: ${TABLE}.provinceId ;;
  }

  dimension: province_name {
    group_label: "Geography"
    label: "Province Name"
    description: "Name of the province in language of the region deducted from NIS or postal code ('Unknown' for level 5)"
    type: string
    sql: ${TABLE}.ProvinceName ;;
  }

  dimension: province_name_de {
    group_label: "Geography"
    hidden: yes
    type: string
    sql: ${TABLE}.ProvinceNameDE ;;
  }

  dimension: province_name_fr {
    group_label: "Geography"
    hidden: yes
    type: string
    sql: ${TABLE}.ProvinceNameFR ;;
  }

  dimension: province_name_nl {
    group_label: "Geography"
    hidden: yes
    type: string
    sql: ${TABLE}.ProvinceNameNL ;;
  }

  dimension: region_id {
    group_label: "Geography"
    description: "Address Service internal identifier of the region deducted from NIS or postal code for levels 1 to 4; level 5 being dedicated to region level"
    hidden: yes
    type: string
    sql: ${TABLE}.regionId ;;
  }

  dimension: region_name {
    group_label: "Geography"
    label: "Region Name"
    description: "Name of the region in language of the region deducted from NIS or postal code for levels 1 to 4; level 5 being dedicated to region level (UPPERCASE)"
    type: string
    sql: ${TABLE}.RegionName ;;
  }

  dimension: region_name_de {
    group_label: "Geography"
    hidden: yes
    type: string
    sql: ${TABLE}.RegionNameDE ;;
  }

  dimension: region_name_fr {
    group_label: "Geography"
    hidden: yes
    type: string
    sql: ${TABLE}.RegionNameFR ;;
  }

  dimension: region_name_nl {
    group_label: "Geography"
    hidden: yes
    type: string
    sql: ${TABLE}.RegionNameNL ;;
  }

  dimension: municipality {
    group_label: "Geography"
    label: "Municipality"
    type: string
    map_layer_name: municipality_location_belgium_ereg
    sql: ${nis_code_municipality} ;;
    html: {{ municipality_name._linked_value}} ;;
  }

  dimension: district {
    group_label: "Geography"
    label: "District"
    type: string
    drill_fields: [municipality]
    map_layer_name: district_location_belgium_ereg
    sql: ${nis_code_district} ;;
    html: {{district_name._linked_value}} ;;
  }

  dimension: province {
    group_label: "Geography"
    label: "Province"
    type: string
    drill_fields: [district, municipality]
    map_layer_name: province_location_belgium_ereg
    sql: ${nis_code_province} ;;
    html: {{ province_name._linked_value }} ;;
  }

  dimension: region {
    group_label: "Geography"
    label: "Region"
    type: string
    drill_fields: [province, district, municipality]
    map_layer_name: region_location_belgium_ereg
    sql: ${nis_code_region} ;;
    html: {{region_name._linked_value}} ;;
  }

  dimension: street_code {
    group_label: "Geography"
    description: "4-digits street code of the street (0 for other levels than 1)"
    hidden: yes
    type: string
    sql: ${TABLE}.StreetCode ;;
  }

  dimension: street_id {
    group_label: "Geography"
    description: "Address Service internal identifier of the street (only level 1)"
    hidden: yes
    type: string
    sql: ${TABLE}.streetId ;;
  }

  dimension: street_name {
    group_label: "Geography"
    label: "Street"
    description: "Name of the street in the language of the region (only level 1; 'Unknown' for other levels)"
    type: string
    sql: ${TABLE}.StreetName ;;
  }

  dimension: street_name_de {
    group_label: "Geography"
    hidden: yes
    type: string
    sql: ${TABLE}.StreetNameDE ;;
  }

  dimension: street_name_fr {
    group_label: "Geography"
    hidden: yes
    type: string
    sql: ${TABLE}.StreetNameFR ;;
  }

  dimension: street_name_nl {
    group_label: "Geography"
    hidden:  yes
    type: string
    sql: ${TABLE}.StreetNameNL ;;
  }

  dimension: zip_code {
    group_label: "Geography"
    label: "Zip Code"
    description: "4-digits Postal Code of the geolocation (0 for levels 4 and 5)"
    type: zipcode
    sql: ${TABLE}.ZipCode ;;
  }

  measure: count {
    group_label: "Geography"
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

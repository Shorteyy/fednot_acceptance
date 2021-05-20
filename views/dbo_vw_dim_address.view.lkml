view: dim_address {
  label: "Dim Geography"
  sql_table_name: `dwh.dbo_vwDimAddress`
    ;;

  dimension: country_name {
    # group_label: "Address"
    label: "Country"
    description: "Name of country"
    type: string
    sql: ${TABLE}.CountryName ;;
  }

  dimension: district_id {
    description: "Address Service internal identifier of the district deducted from NIS or postal code (0 for level 5)"
    hidden: yes
    type: string
    sql: ${TABLE}.districtId ;;
  }

  dimension: district_name {
    # group_label: "Address"
    label: "District"
    description: "Name of the district in language of the region deducted from NIS or postal code ('Unknown' for level 5)"
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
    description: "Flag to indicate that the street located on the belgian dike (sea sight; 0 for other levels than 1)"
    type: string
    sql: ${TABLE}.isStreetsBelgianCoast ;;
  }

  dimension: is_zip_belgian_coast {
    # group_label: "Address"
    label: "Zip Belgian Coast?"
    description: "Flag to indicate that the postal code is from a locality located on the belgian coast  (0 for level 5; random / irrelevant for level 4)"
    type: string
    sql: ${TABLE}.isZipBelgianCoast ;;
  }

  dimension: is_zip_frontalier {
    # group_label: "Address"
    label: "Zip Frontalier?"
    description: "Flag to indicate that the postal code is from a locality located on the belgian border (0 for level 5; random / irrelevant for level 4)"
    type: string
    sql: ${TABLE}.isZipFrontalier ;;
  }

  dimension: is_zip_town {
    # group_label: "Address"
    label: "Zip Town?"
    description: "Flag to indicate that the postal code is from a locality is part of an urban area (0 for level 5; random / irrelevant for level 4)"
    type: string
    sql: ${TABLE}.isZipTown ;;
  }

  dimension: locality_id {
    description: "Address Service internal identifier of the locality deducted from postal code (0 for level 5; random / irrelevant for level 4)"
    hidden: yes
    type: string
    sql: ${TABLE}.localityId ;;
  }

  dimension: locality_name {
    # group_label: "Address"
    label: "Locality"
    description: "Name of the locality in the language of the region deducted from postal code ('Unknown' level 5; random / irrelevant for level 4)"
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
    description: "Address Service internal identifier of the municipality deducted from NIS or postal code (0 for level 5)"
    hidden: yes
    type: string
    sql: ${TABLE}.municipalityId ;;
  }

  dimension: municipality_name {
    description: "Name of the municipality in the language of the region deducted from NIS or postal code ('Unknown' for level 5)"
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
    description: "5-digits NIS Code of the municipality (0 for levels 3 and 5)"
    type: string
    sql: ${TABLE}.NisCode ;;
  }

  dimension: nis_code_municipality {
    hidden: yes
    type: string
    sql: ${TABLE}.NisCode ;;
  }

  dimension: nis_code_arrondissement {
    hidden: yes
    type: string
    sql: CONCAT(LEFT(${TABLE}.NisCode,2),"000") ;;
  }

  dimension: nis_code_province {
    # hidden: yes
    type: string
    sql: CASE
           WHEN LEFT(${TABLE}.NisCode,2) = "21" THEN ${nis_code_region}
           WHEN ${TABLE}.NisCode = "20001" THEN ${TABLE}.NisCode
           WHEN ${TABLE}.NisCode = "20002" THEN ${TABLE}.NisCode
           ELSE CONCAT(LEFT(${TABLE}.NisCode,1),"0000") END ;;
  }

  dimension: nis_code_region {
    hidden: yes
    type: string
    sql: CASE
           WHEN LEFT(${TABLE}.NisCode,2) = "21" THEN "04000"
           WHEN LEFT(${TABLE}.NisCode,2) in ("11","12","13","23","24","31","32","33","34","35","36","37","38","41","42","43","44","45","46","71","72","73") THEN "02000"
           ELSE "03000" END ;;
  }

  dimension: pk_address {
    primary_key: yes
    hidden:  yes
    type: string
    sql: ${TABLE}.PK_Address ;;
  }

  dimension: province_id {
    description: "Address Service internal identifier of the province deducted from NIS or postal code (0 for level 5)"
    hidden: yes
    type: string
    sql: ${TABLE}.provinceId ;;
  }

  dimension: province_name {
    label: "Province"
    description: "Name of the province in language of the region deducted from NIS or postal code ('Unknown' for level 5)"
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
    description: "Address Service internal identifier of the region deducted from NIS or postal code for levels 1 to 4; level 5 being dedicated to region level"
    hidden: yes
    type: string
    sql: ${TABLE}.regionId ;;
  }

  dimension: region_name {
    label: "Region"
    description: "Name of the region in language of the region deducted from NIS or postal code for levels 1 to 4; level 5 being dedicated to region level (UPPERCASE)"
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

  # dimension: region_area {
  #   label: "Region Area"
  #   type: string
  #   drill_fields: [province_area]
  #   map_layer_name: region_location_belgium
  #   sql: CASE
  #         WHEN ${TABLE}.RegionNameNL = "VLAAMS GEWEST" THEN "Vlaams Gewest"
  #         WHEN ${TABLE}.RegionNameNL = "WAALS GEWEST" THEN "Waals Gewest"
  #         ELSE "Brussels Hoofdstedelijk Gewest"
  #         END ;;
  # }

  dimension: municipality_area {
    label: "Municipality Area"
    type: string
    map_layer_name: municipality_location_belgium
    sql: ${nis_code_municipality} ;;
  }

  dimension: arrondissement_area {
    label: "Arrondissement Area"
    type: string
    map_layer_name: arrondissement_location_belgium
    sql: ${nis_code_arrondissement} ;;
  }

  dimension: region_area {
    label: "Region Area"
    type: string
    drill_fields: [province_area]
    map_layer_name: region_location_belgium_ereg
    sql: ${nis_code_region} ;;
  }

  dimension: street_code {
    description: "4-digits street code of the street (0 for other levels than 1)"
    hidden: yes
    type: string
    sql: ${TABLE}.StreetCode ;;
  }

  dimension: street_id {
    description: "Address Service internal identifier of the street (only level 1)"
    hidden: yes
    type: string
    sql: ${TABLE}.streetId ;;
  }

  dimension: street_name {
    # group_label: "Address"
    label: "Street"
    description: "Name of the street in the language of the region (only level 1; 'Unknown' for other levels)"
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
    description: "4-digits Postal Code of the geolocation (0 for levels 4 and 5)"
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

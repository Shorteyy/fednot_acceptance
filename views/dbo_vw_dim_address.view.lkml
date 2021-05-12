view: dim_address {
  sql_table_name: `dwh.dbo_vwDimAddress`
    ;;

  # dimension_group: _date1 {
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
  #   sql: ${TABLE}._date1 ;;
  # }

  # dimension_group: _date2 {
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
  #   sql: ${TABLE}._date2 ;;
  # }

  # dimension: _run_id {
  #   type: string
  #   sql: ${TABLE}._run_id ;;
  # }

  dimension: country_name {
    type: string
    sql: ${TABLE}.CountryName ;;
  }

  dimension: district_id {
    type: number
    sql: ${TABLE}.districtId ;;
  }

  dimension: district_name {
    type: string
    sql: ${TABLE}.DistrictName ;;
  }

  dimension: district_name_de {
    type: string
    sql: ${TABLE}.DistrictNameDE ;;
  }

  dimension: district_name_fr {
    type: string
    sql: ${TABLE}.DistrictNameFR ;;
  }

  dimension: district_name_nl {
    type: string
    sql: ${TABLE}.DistrictNameNL ;;
  }

  dimension: district_name_tableau {
    type: string
    sql: ${TABLE}.DistrictName_Tableau ;;
  }

  dimension: is_streets_belgian_coast {
    type: number
    sql: ${TABLE}.isStreetsBelgianCoast ;;
  }

  dimension: is_zip_belgian_coast {
    type: number
    sql: ${TABLE}.isZipBelgianCoast ;;
  }

  dimension: is_zip_frontalier {
    type: number
    sql: ${TABLE}.isZipFrontalier ;;
  }

  dimension: is_zip_town {
    type: number
    sql: ${TABLE}.isZipTown ;;
  }

  dimension: locality_id {
    type: number
    sql: ${TABLE}.localityId ;;
  }

  dimension: locality_name {
    type: string
    sql: ${TABLE}.LocalityName ;;
  }

  dimension: locality_name_de {
    type: string
    sql: ${TABLE}.LocalityNameDE ;;
  }

  dimension: locality_name_fr {
    type: string
    sql: ${TABLE}.LocalityNameFR ;;
  }

  dimension: locality_name_nl {
    type: string
    sql: ${TABLE}.LocalityNameNL ;;
  }

  # dimension_group: m_job_datetime {
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
  #   sql: ${TABLE}.m_job_datetime ;;
  # }

  # dimension: m_job_exec_id {
  #   type: string
  #   sql: ${TABLE}.m_job_exec_id ;;
  # }

  # dimension: m_model_exec_id {
  #   type: string
  #   sql: ${TABLE}.m_model_exec_id ;;
  # }

  dimension: main_locality_name {
    type: string
    sql: ${TABLE}.MainLocalityName ;;
  }

  dimension: matching_level {
    type: number
    sql: ${TABLE}.MatchingLevel ;;
  }

  dimension: municipality_id {
    type: number
    sql: ${TABLE}.municipalityId ;;
  }

  dimension: municipality_name {
    type: string
    sql: ${TABLE}.MunicipalityName ;;
  }

  dimension: municipality_name_de {
    type: string
    sql: ${TABLE}.MunicipalityNameDE ;;
  }

  dimension: municipality_name_fr {
    type: string
    sql: ${TABLE}.MunicipalityNameFR ;;
  }

  dimension: municipality_name_nl {
    type: string
    sql: ${TABLE}.MunicipalityNameNL ;;
  }

  dimension: nis_code {
    type: string
    sql: ${TABLE}.NisCode ;;
  }

  dimension: pk_address {
    primary_key: yes
    type: number
    sql: ${TABLE}.PK_Address ;;
  }

  dimension: province_id {
    type: number
    sql: ${TABLE}.provinceId ;;
  }

  dimension: province_name {
    type: string
    sql: ${TABLE}.ProvinceName ;;
  }

  dimension: province_name_de {
    type: string
    sql: ${TABLE}.ProvinceNameDE ;;
  }

  dimension: province_name_fr {
    type: string
    sql: ${TABLE}.ProvinceNameFR ;;
  }

  dimension: province_name_nl {
    type: string
    sql: ${TABLE}.ProvinceNameNL ;;
  }

  dimension: region_id {
    type: number
    sql: ${TABLE}.regionId ;;
  }

  dimension: region_name {
    type: string
    sql: ${TABLE}.RegionName ;;
  }

  dimension: region_name_de {
    type: string
    sql: ${TABLE}.RegionNameDE ;;
  }

  dimension: region_name_fr {
    type: string
    sql: ${TABLE}.RegionNameFR ;;
  }

  dimension: region_name_nl {
    type: string
    sql: ${TABLE}.RegionNameNL ;;
  }

  dimension: region_name_tableau {
    type: string
    sql: ${TABLE}.RegionName_Tableau ;;
  }

  dimension: street_code {
    type: string
    sql: ${TABLE}.StreetCode ;;
  }

  dimension: street_id {
    type: number
    sql: ${TABLE}.streetId ;;
  }

  dimension: street_name {
    type: string
    sql: ${TABLE}.StreetName ;;
  }

  dimension: street_name_de {
    type: string
    sql: ${TABLE}.StreetNameDE ;;
  }

  dimension: street_name_fr {
    type: string
    sql: ${TABLE}.StreetNameFR ;;
  }

  dimension: street_name_nl {
    type: string
    sql: ${TABLE}.StreetNameNL ;;
  }

  # dimension_group: sys_insert_update {
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
  #   sql: ${TABLE}.Sys_InsertUpdateDate ;;
  # }

  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.ZipCode ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      street_name,
      region_name,
      municipality_name,
      main_locality_name,
      country_name,
      locality_name,
      province_name,
      district_name
    ]
  }
}

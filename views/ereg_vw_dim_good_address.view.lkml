view: ereg_vw_dim_good_address {
  label: "Good Address"
  sql_table_name: `dwh.ereg_vwDimGoodAddress`
    ;;

  dimension: country_name {
    type: string
    sql: ${TABLE}.CountryName ;;
  }

  dimension: district_id {
    type: string
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
    type: string
    sql: ${TABLE}.isStreetsBelgianCoast ;;
  }

  dimension: is_zip_belgian_coast {
    type: string
    sql: ${TABLE}.isZipBelgianCoast ;;
  }

  dimension: is_zip_frontalier {
    type: string
    sql: ${TABLE}.isZipFrontalier ;;
  }

  dimension: is_zip_town {
    type: string
    sql: ${TABLE}.isZipTown ;;
  }

  dimension: locality_id {
    type: string
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

  dimension_group: m_job_datetime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.m_job_datetime ;;
  }

  dimension: m_job_run_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.m_job_run_id ;;
  }

  dimension: m_model_run_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.m_model_run_id ;;
  }

  dimension: main_locality_name {
    type: string
    sql: ${TABLE}.MainLocalityName ;;
  }

  dimension: matching_level {
    type: string
    sql: ${TABLE}.MatchingLevel ;;
  }

  dimension: municipality_id {
    type: string
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
    type: string
    sql: ${TABLE}.PK_Address ;;
  }

  dimension: province_id {
    type: string
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
    type: string
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
    type: string
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

  dimension: sys_insert_update_date {
    type: string
    sql: ${TABLE}.Sys_InsertUpdateDate ;;
  }

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
      country_name,
      locality_name,
      province_name,
      region_name,
      municipality_name,
      district_name,
      main_locality_name,
      m_job_run.m_job_run_id,
      m_job_run.m_job_name,
      m_model_run.m_model_run_id,
      m_model_run.m_model_name
    ]
  }
}

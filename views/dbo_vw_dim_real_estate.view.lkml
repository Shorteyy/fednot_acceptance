view: dim_real_estate {
  sql_table_name: `dwh.dbo_vwDimRealEstate`
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

  dimension: _run_id {
    type: string
    sql: ${TABLE}._run_id ;;
  }

  dimension: acquisition_date_and_mode {
    type: string
    sql: ${TABLE}.AcquisitionDateAndMode ;;
  }

  dimension: construction_surface_allowed {
    type: number
    sql: ${TABLE}.ConstructionSurfaceAllowed ;;
  }

  dimension: construction_year {
    type: number
    sql: ${TABLE}.ConstructionYear ;;
  }

  dimension: construction_year_range {
    type: string
    sql: ${TABLE}.ConstructionYearRange ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }

  dimension: estimated_value {
    type: number
    sql: ${TABLE}.EstimatedValue ;;
  }

  dimension: land_income {
    type: number
    sql: ${TABLE}.LandIncome ;;
  }

  dimension: living_surface_area {
    type: number
    sql: ${TABLE}.LivingSurfaceArea ;;
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

  dimension: mortgage_status {
    type: string
    sql: ${TABLE}.MortgageStatus ;;
  }

  dimension: nature {
    type: string
    sql: ${TABLE}.Nature ;;
  }

  dimension: nbr_facades {
    type: number
    sql: ${TABLE}.NbrFacades ;;
  }

  dimension: nbr_rooms {
    type: number
    sql: ${TABLE}.NbrRooms ;;
  }

  dimension: new_building {
    type: yesno
    sql: ${TABLE}.NewBuilding ;;
  }

  dimension: pk_real_estate {
    type: number
    sql: ${TABLE}.PK_RealEstate ;;
  }

  dimension: real_estate_id {
    type: number
    sql: ${TABLE}.RealEstate_id ;;
  }

  dimension: real_estate_sub_type {
    type: string
    sql: ${TABLE}.RealEstateSubType ;;
  }

  dimension: reference_cadaster {
    type: string
    sql: ${TABLE}.ReferenceCadaster ;;
  }

  dimension: selling_price {
    type: number
    sql: ${TABLE}.SellingPrice ;;
  }

  dimension: sequence_number {
    type: string
    sql: ${TABLE}.SequenceNumber ;;
  }

  dimension: showroom_surface_area {
    type: number
    sql: ${TABLE}.ShowroomSurfaceArea ;;
  }

  dimension: superficie {
    type: string
    sql: ${TABLE}.Superficie ;;
  }

  dimension: superficie_unit {
    type: string
    sql: ${TABLE}.SuperficieUnit ;;
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

  dimension: vatalienation {
    type: yesno
    sql: ${TABLE}.VATAlienation ;;
  }

  dimension: vgpstatus {
    type: string
    sql: ${TABLE}.VGPStatus ;;
  }

  dimension: working_surface_area {
    type: number
    sql: ${TABLE}.WorkingSurfaceArea ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

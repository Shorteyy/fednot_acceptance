view: fact_comparison_point {
  sql_table_name: `dwh.dbo_vwFactComparisonPoint`
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

  dimension: fk_address {
    type: number
    sql: ${TABLE}.FK_Address ;;
  }

  dimension: fk_comparison_point {
    type: number
    sql: ${TABLE}.FK_ComparisonPoint ;;
  }

  dimension: fk_comparison_point_status {
    type: number
    sql: ${TABLE}.FK_ComparisonPointStatus ;;
  }

  dimension: fk_date_encoding {
    type: number
    sql: ${TABLE}.FK_Date_Encoding ;;
  }

  dimension: fk_heating_type {
    type: number
    sql: ${TABLE}.FK_HeatingType ;;
  }

  dimension: fk_notice_one {
    type: number
    sql: ${TABLE}.FK_NoticeOne ;;
  }

  dimension: fk_pebtype {
    type: number
    sql: ${TABLE}.FK_PEBType ;;
  }

  dimension: fk_property_category {
    type: number
    sql: ${TABLE}.FK_PropertyCategory ;;
  }

  dimension: fk_property_type {
    type: number
    sql: ${TABLE}.FK_PropertyType ;;
  }

  dimension: fk_selling_type {
    type: number
    sql: ${TABLE}.FK_SellingType ;;
  }

  dimension: fk_source_system {
    type: number
    sql: ${TABLE}.FK_SourceSystem ;;
  }

  dimension: fk_statistical_sector {
    type: number
    sql: ${TABLE}.FK_StatisticalSector ;;
  }

  dimension: fk_study {
    type: number
    sql: ${TABLE}.FK_Study ;;
  }

  dimension: land_income {
    type: number
    sql: ${TABLE}.landIncome ;;
  }

  dimension: living_surface_area {
    type: number
    sql: ${TABLE}.livingSurfaceArea ;;
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

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: price_sqm {
    type: number
    sql: ${TABLE}.price_Sqm ;;
  }

  dimension: showroom_surface {
    type: number
    sql: ${TABLE}.showroomSurface ;;
  }

  dimension: surface_area {
    type: number
    sql: ${TABLE}.surfaceArea ;;
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

  dimension: working_surface {
    type: number
    sql: ${TABLE}.workingSurface ;;
  }

  dimension: yearly_rent {
    type: number
    sql: ${TABLE}.yearlyRent ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

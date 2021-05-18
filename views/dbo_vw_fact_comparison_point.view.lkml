view: fact_comparison_point {
  sql_table_name: `dwh.dbo_vwFactComparisonPoint`
    ;;

  dimension: fact_comparison_point_compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${TABLE}.FK_Address, ${TABLE}.FK_ComparisonPoint,${TABLE}.FK_ComparisonPointStatus,${TABLE}.FK_DateEncodig,${TABLE}.FK_HeatingType, ${TABLE}.FK_NoticeOne,${TABLE}.FK_PEBType,${TABLE}.FK_PropertyCategory,${TABLE}.FK_PropertyType, ${TABLE}.FK_SellingType, ${TABLE}.FK_SourceSystem , ${TABLE}.FK_StatisticalSector, ${TABLE}.FK_Study ) ;;
  }

  dimension: fk_address {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_Address ;;
  }

  dimension: fk_comparison_point {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_ComparisonPoint ;;
  }

  dimension: fk_comparison_point_status {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_ComparisonPointStatus ;;
  }

  dimension: fk_date_encoding {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_Date_Encoding ;;
  }

  dimension: fk_heating_type {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_HeatingType ;;
  }

  dimension: fk_notice_one {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_NoticeOne ;;
  }

  dimension: fk_pebtype {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_PEBType ;;
  }

  dimension: fk_property_category {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_PropertyCategory ;;
  }

  dimension: fk_property_type {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_PropertyType ;;
  }

  dimension: fk_selling_type {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_SellingType ;;
  }

  dimension: fk_source_system {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_SourceSystem ;;
  }

  dimension: fk_statistical_sector {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_StatisticalSector ;;
  }

  dimension: fk_study {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_Study ;;
  }

  dimension: land_income {
    hidden: yes
    type: number
    sql: ${TABLE}.landIncome ;;
  }

  dimension: living_surface_area {
    hidden: yes
    type: number
    sql: ${TABLE}.livingSurfaceArea ;;
  }

  dimension: price {
    hidden: yes
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: price_sqm {
    hidden: yes
    type: number
    sql: ${TABLE}.price_Sqm ;;
  }

  dimension: showroom_surface {
    hidden: yes
    type: number
    sql: ${TABLE}.showroomSurface ;;
  }

  dimension: surface_area {
    hidden: yes
    type: number
    sql: ${TABLE}.surfaceArea ;;
  }

  dimension: working_surface {
    hidden: yes
    type: number
    sql: ${TABLE}.workingSurface ;;
  }

  dimension: yearly_rent {
    hidden: yes
    type: number
    sql: ${TABLE}.yearlyRent ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }

  measure: sum_yearly_rent {
    label: "Yearly Rent"
    type: sum
    sql: ${yearly_rent} ;;
    value_format:"€#,##0.00;-€#,##0.00"
    drill_fields: []
  }

  measure: sum_price {
    label: "Price"
    type: sum
    sql: ${price} ;;
    value_format:"€#,##0.00;-€#,##0.00"
    drill_fields: []
  }

  measure: sum_land_income {
    label: "Land Income"
    type: sum
    sql: ${land_income} ;;
    value_format:"€#,##0.00;-€#,##0.00"
    drill_fields: []
  }

  measure: sum_surface_area {
    label: "Surface Area"
    type: sum
    sql: ${surface_area} ;;
    drill_fields: []
  }

  measure: sum_living_surface {
    label: "Living Surface Area"
    type: sum
    sql: ${living_surface_area} ;;
    drill_fields: []
  }

  measure: sum_showroom_surface {
    label: "Showroom Surface Area"
    type: sum
    sql: ${showroom_surface} ;;
    drill_fields: []
  }

  measure: sum_working_surface {
    label: "Working Surface Area"
    type: sum
    sql: ${working_surface} ;;
    drill_fields: []
  }

  measure: avg_price_sqm {
    label: "Average Price Sqm"
    type:  average
    sql: ${price_sqm} ;;
    value_format:"€#,##0.00;-€#,##0.00"
  }

  measure: median_price_sqm {
    label: "Median Price Sqm"
    type:  median
    sql: ${price_sqm} ;;
    value_format:"€#,##0.00;-€#,##0.00"
  }

  measure: avg_price {
    label: "Average Price"
    type:  average
    sql: ${price} ;;
    value_format:"€#,##0.00;-€#,##0.00"
  }

  measure: median_price {
    label: "Median Price"
    type:  median
    sql: ${price} ;;
    value_format:"€#,##0.00;-€#,##0.00"
  }

}

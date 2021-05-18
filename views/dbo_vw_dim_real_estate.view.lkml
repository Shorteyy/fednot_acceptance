view: dim_real_estate {
  sql_table_name: `dwh.dbo_vwDimRealEstate`
    ;;

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
    hidden: yes
    type: number
    sql: ${TABLE}.EstimatedValue ;;
  }

  dimension: land_income {
    hidden: yes
    type: number
    sql: ${TABLE}.LandIncome ;;
  }

  dimension: living_surface_area {
    hidden: yes
    type: number
    sql: ${TABLE}.LivingSurfaceArea ;;
  }

  dimension: mortgage_status {
    type: string
    sql: ${TABLE}.MortgageStatus ;;
  }

  dimension: nature {
    type: string
    sql: ${TABLE}.Nature ;;
  }

  dimension: nbr_facades {
    hidden: yes
    type: number
    sql: ${TABLE}.NbrFacades ;;
  }

  dimension: nbr_rooms {
    hidden: yes
    type: number
    sql: ${TABLE}.NbrRooms ;;
  }

  dimension: new_building {
    type: yesno
    sql: ${TABLE}.NewBuilding ;;
  }

  dimension: pk_real_estate {
    hidden:  yes
    primary_key: yes
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
    hidden: yes
    type: number
    sql: ${TABLE}.SellingPrice ;;
  }

  dimension: sequence_number {
    type: string
    sql: ${TABLE}.SequenceNumber ;;
  }

  dimension: showroom_surface_area {
    hidden: yes
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

  dimension: vatalienation {
    type: yesno
    sql: ${TABLE}.VATAlienation ;;
  }

  dimension: vgpstatus {
    type: string
    sql: ${TABLE}.VGPStatus ;;
  }

  dimension: working_surface_area {
    hidden: yes
    type: number
    sql: ${TABLE}.WorkingSurfaceArea ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }

measure: sum_estimated_value {
  label: "Estimated Value"
  type: sum
  sql: ${estimated_value} ;;
  value_format:"€#,##0.00;-€#,##0.00"
  drill_fields: []
}

  measure: sum_land_income {
    label: "Land Income"
    type: sum
    sql: ${land_income};;
    value_format:"€#,##0.00;-€#,##0.00"
    drill_fields: []
  }

measure: sum_selling_price {
  label: "Selling Price"
  type: sum
  sql: ${selling_price} ;;
  value_format:"€#,##0.00;-€#,##0.00"
  drill_fields: []
}

  measure: sum_facades {
    label: "# of Facades"
    type: sum
    sql: ${nbr_facades} ;;
    drill_fields: []
  }

  measure: sum_rooms {
    label: "# of Rooms"
    type: sum
    sql: ${nbr_rooms} ;;
    drill_fields: []
  }

  measure: sum_living_surface {
    label: "Living Surface Area"
    type: sum
    sql: ${living_surface_area};;
    drill_fields: []
  }

  measure: sum_showroom_surface {
    label: "Showroom Surface Area"
    type: sum
    sql: ${showroom_surface_area};;
    drill_fields: []
  }

  measure: sum_working_surface {
    label: "Working Surface Area"
    type: sum
    sql: ${working_surface_area};;
    drill_fields: []
  }

}

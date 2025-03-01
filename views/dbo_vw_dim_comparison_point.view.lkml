view: dim_comparison_point {
  sql_table_name: `dwh.dbo_vwDimComparisonPoint`
    ;;

  # dimension: application_source {
  #   type: string
  #   sql: ${TABLE}.applicationSource ;;
  # }

  # dimension: asf_id {
  #   type: string
  #   sql: ${TABLE}.asfId ;;
  # }

  # dimension: comparison_point_id {
  #   type: number
  #   sql: ${TABLE}.ComparisonPointID ;;
  # }

  # dimension: construction_surface_allowed {
  #   type: number
  #   sql: ${TABLE}.constructionSurfaceAllowed ;;
  # }

  # dimension: construction_year {
  #   type: number
  #   sql: ${TABLE}.constructionYear ;;
  # }

  # dimension: construction_year_range {
  #   type: string
  #   sql: ${TABLE}.constructionYearRange ;;
  # }

  # dimension: flag_keep_business_rule {
  #   type: number
  #   sql: ${TABLE}.flagKeepBusinessRule ;;
  # }

  # dimension: flag_keep_business_rule_surface {
  #   type: number
  #   sql: ${TABLE}.flagKeepBusinessRuleSurface ;;
  # }

  # dimension: flag_keep_manual {
  #   type: number
  #   sql: ${TABLE}.flagKeepManual ;;
  # }

  # dimension: flag_keep_manual_surface {
  #   type: number
  #   sql: ${TABLE}.flagKeepManualSurface ;;
  # }

  # dimension: flag_keep_outlier_strict_price {
  #   type: number
  #   sql: ${TABLE}.flagKeepOutlierStrict_price ;;
  # }

  # dimension: flag_keep_outlier_strict_price_surface {
  #   type: number
  #   sql: ${TABLE}.flagKeepOutlierStrict_priceSurface ;;
  # }

  dimension: flag_keep_rule_ratios_price {
    type: number
    sql: ${TABLE}.flagKeepRuleRatios_price ;;
  }

  # dimension: flag_keep_rule_ratios_price_surface {
  #   type: number
  #   sql: ${TABLE}.flagKeepRuleRatios_priceSurface ;;
  # }

  # dimension: floor_of_property {
  #   type: number
  #   sql: ${TABLE}.floorOfProperty ;;
  # }

  # dimension: has_armored_door {
  #   type: yesno
  #   sql: ${TABLE}.hasArmoredDoor ;;
  # }

  # dimension: has_attic {
  #   type: yesno
  #   sql: ${TABLE}.hasAttic ;;
  # }

  # dimension: has_cellar {
  #   type: yesno
  #   sql: ${TABLE}.hasCellar ;;
  # }

  # dimension: has_central_heating {
  #   type: yesno
  #   sql: ${TABLE}.hasCentralHeating ;;
  # }

  # dimension: has_double_glazing {
  #   type: yesno
  #   sql: ${TABLE}.hasDoubleGlazing ;;
  # }

  # dimension: has_garage {
  #   type: yesno
  #   sql: ${TABLE}.hasGarage ;;
  # }

  # dimension: has_garden {
  #   type: yesno
  #   sql: ${TABLE}.hasGarden ;;
  # }

  # dimension: has_gas_water_electricity {
  #   type: yesno
  #   sql: ${TABLE}.hasGasWaterElectricity ;;
  # }

  # dimension: has_lift {
  #   type: yesno
  #   sql: ${TABLE}.hasLift ;;
  # }

  # dimension: has_terrace {
  #   type: yesno
  #   sql: ${TABLE}.hasTerrace ;;
  # }

  # dimension: is_compulsory_construction {
  #   type: yesno
  #   sql: ${TABLE}.isCompulsoryConstruction ;;
  # }

  # dimension: is_cooking_possible {
  #   type: yesno
  #   sql: ${TABLE}.isCookingPossible ;;
  # }

  # dimension: is_electricity_link_possible {
  #   type: yesno
  #   sql: ${TABLE}.isElectricityLinkPossible ;;
  # }

  # dimension: is_new_construction {
  #   type: yesno
  #   sql: ${TABLE}.isNewConstruction ;;
  # }

  # dimension: is_part_of_commercial_center {
  #   type: yesno
  #   sql: ${TABLE}.isPartOfCommercialCenter ;;
  # }

  # dimension: is_planning_permit_granted {
  #   type: yesno
  #   sql: ${TABLE}.isPlanningPermitGranted ;;
  # }

  # dimension: is_revenue_house {
  #   type: yesno
  #   sql: ${TABLE}.isRevenueHouse ;;
  # }

  # dimension: is_sewer_link_possible {
  #   type: yesno
  #   sql: ${TABLE}.isSewerLinkPossible ;;
  # }

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

  # dimension: migration_real_estate_id {
  #   type: number
  #   sql: ${TABLE}.migrationRealEstateId ;;
  # }

  dimension: number_of_facades {
    hidden: yes
    type: number
    sql: ${TABLE}.numberOfFacades ;;
  }

  dimension: number_of_floors {
    hidden: yes
    type: number
    sql: ${TABLE}.numberOfFloors ;;
  }

  dimension: number_of_rooms {
    hidden: yes
    type: number
    sql: ${TABLE}.numberOfRooms ;;
  }

  dimension: number_of_water_rooms {
    hidden: yes
    type: number
    sql: ${TABLE}.numberOfWaterRooms ;;
  }

  # dimension: object_version {
  #   type: number
  #   sql: ${TABLE}.objectVersion ;;
  # }

  dimension: pk_comparison_point {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.PK_ComparisonPoint ;;
  }

  dimension: price {
    hidden: yes
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: score_keep_rule_ratios_price {
    type: number
    sql: ${TABLE}.scoreKeepRuleRatios_price ;;
  }

  dimension: score_keep_rule_ratios_price_surface {
    type: number
    sql: ${TABLE}.scoreKeepRuleRatios_priceSurface ;;
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

  dimension: vgp_city {
    type: string
    sql: ${TABLE}.VGP_city ;;
  }

  dimension: vgp_city_de {
    hidden: yes
    type: string
    sql: ${TABLE}.VGP_cityDe ;;
  }

  dimension: vgp_city_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.VGP_cityFr ;;
  }

  dimension: vgp_city_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.VGP_cityNl ;;
  }

  dimension: vgp_nis_code {
    hidden: yes
    type: number
    sql: ${TABLE}.VGP_nisCode ;;
  }

  dimension: vgp_postal_code {
    type: number
    sql: ${TABLE}.VGP_postalCode ;;
  }

  dimension: vgp_street {
    type: string
    sql: ${TABLE}.VGP_street ;;
  }

  dimension: vgp_street_code {
    type: string
    sql: ${TABLE}.VGP_streetCode ;;
  }

  dimension: vgp_street_de {
    hidden: yes
    type: string
    sql: ${TABLE}.VGP_streetDe ;;
  }

  dimension: vgp_street_fr {
    hidden: yes
    type: string
    sql: ${TABLE}.VGP_streetFr ;;
  }

  dimension: vgp_street_nl {
    hidden: yes
    type: string
    sql: ${TABLE}.VGP_streetNl ;;
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

  # measure: sum_facades {
  #   label: "# of Facades"
  #   type: sum
  #   sql: ${number_of_facades} ;;
  #   drill_fields: []
  # }

  measure: sum_rooms {
    label: "# of Rooms"
    type: sum
    sql: ${number_of_rooms} ;;
    drill_fields: []
  }

  # measure: sum_floors {
  #   label: "# of Floors"
  #   type: sum
  #   sql: ${number_of_floors} ;;
  #   drill_fields: []
  # }

  # measure: sum_water_rooms {
  #   label: "# of Water Rooms"
  #   type: sum
  #   sql: ${number_of_water_rooms} ;;
  #   drill_fields: []
  # }
}

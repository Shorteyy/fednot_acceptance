view: ereg_vw_dim_good {
  label: "Good"
  sql_table_name: `dwh.ereg_vwDimGood`
    ;;

  dimension: asset_number_exponent_letter {
    type: string
    sql: ${TABLE}.AssetNumberExponentLetter ;;
  }

  dimension: asset_number_exponent_numeral {
    type: string
    sql: ${TABLE}.AssetNumberExponentNumeral ;;
  }

  dimension: asset_number_number_bis {
    type: string
    sql: ${TABLE}.AssetNumberNumberBis ;;
  }

  dimension: asset_number_partition {
    type: string
    sql: ${TABLE}.AssetNumberPartition ;;
  }

  dimension: asset_number_radical {
    type: string
    sql: ${TABLE}.AssetNumberRadical ;;
  }

  dimension: asset_number_section {
    type: string
    sql: ${TABLE}.AssetNumberSection ;;
  }

  dimension: good_details {
    type: string
    sql: ${TABLE}.GoodDetails ;;
  }

  dimension: good_nature {
    type: string
    sql: ${TABLE}.GoodNature ;;
  }

  dimension: good_nature_description {
    type: string
    sql: ${TABLE}.GoodNatureDescription ;;
  }

  dimension: good_surface {
    type: string
    sql: ${TABLE}.GoodSurface ;;
  }

  dimension: is_good_with_easement {
    type: string
    sql: ${TABLE}.IsGoodWithEasement ;;
  }

  dimension: land_register_division_number {
    type: string
    sql: ${TABLE}.LandRegisterDivisionNumber ;;
  }

  dimension: land_register_division_number_label {
    type: string
    sql: ${TABLE}.LandRegisterDivisionNumberLabel ;;
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

  # dimension: m_job_run_id {
  #   type: string
  #   # hidden: yes
  #   sql: ${TABLE}.m_job_run_id ;;
  # }

  # dimension: m_model_run_id {
  #   type: string
  #   # hidden: yes
  #   sql: ${TABLE}.m_model_run_id ;;
  # }

  dimension: pk_ereg_good {
    hidden: yes
    type: string
    sql: ${TABLE}.PK_EregGood ;;
  }

  dimension: plan_reference_coupled_plan {
    type: string
    sql: ${TABLE}.PlanReferenceCoupledPlan ;;
  }

  dimension: plan_reference_division {
    type: string
    sql: ${TABLE}.PlanReferenceDivision ;;
  }

  dimension: plan_reference_number {
    type: string
    sql: ${TABLE}.PlanReferenceNumber ;;
  }

  dimension: sending_transaction_good_id {
    type: string
    sql: ${TABLE}.SendingTransactionGoodId ;;
  }

  # dimension: sys_insert_update_date {
  #   type: string
  #   sql: ${TABLE}.Sys_InsertUpdateDate ;;
  # }

  dimension: unique_good_identifier {
    type: string
    sql: ${TABLE}.UniqueGoodIdentifier ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}

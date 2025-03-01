view: fact_real_estate_notice {
  label: "Measures"
  sql_table_name: `dwh.dbo_vwFactRealEstateNotice` ;;

  dimension: fact_real_estate_notice_compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${TABLE}.FK_Address, ${TABLE}.FK_Date_FirstEnotRequest,${TABLE}.FK_Date_FirstRecievedFunctionACK,${TABLE}.FK_NoticeOne,${TABLE}.FK_PropertyType,${TABLE}.FK_RealEstate, ${TABLE}.FK_SellingType, ${TABLE}.FK_SourceSystem , ${TABLE}.FK_Study, ${TABLE}.FK_TransactionType ) ;;
  }

  dimension: fk_address {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_Address ;;
  }

  dimension: fk_date_first_enot_request {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_Date_FirstEnotRequest ;;
  }

  dimension: fk_date_first_received_function_ack {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_Date_FirstReceivedFunctionACK ;;
  }

  dimension: fk_notice_one {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_NoticeOne ;;
  }

  dimension: fk_property_type {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_PropertyType ;;
  }

  dimension: fk_real_estate {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_RealEstate ;;
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

  dimension: fk_study {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_Study ;;
  }

  dimension: fk_transaction_type {
    hidden: yes
    type: number
    sql: ${TABLE}.FK_TransactionType ;;
  }

  dimension: nb_enot_non_additive {
    hidden: yes
    type: number
    sql: ${TABLE}.Nb_Enot_Non_Additive ;;
  }

  dimension: is_ytd {
    type: yesno
    label: "Compare YTD"
    sql: EXTRACT(MONTH from ${fk_date_first_enot_request}) < EXTRACT(MONTH from CURRENT_TIMESTAMP) ;;
  }

  measure: count_real_estate {
    label: "# Real Estate"
    type: count_distinct
    sql: ${fk_real_estate} ;;
    drill_fields: []
  }

  measure: count_notices {
    label: "# Notices"
    type: count_distinct
    sql: ${nb_enot_non_additive} ;;
    drill_fields: []
  }

  measure: real_estate_ytd {
    label: "# Real Estate YTD"
    type: count_distinct
    filters: {
      field: is_ytd
      value: "yes"
    }
    sql: ${fk_real_estate} ;;
  }

  measure: notices_ytd {
    label: "# Notices YTD"
    type: count_distinct
    filters: {
      field: is_ytd
      value: "yes"
    }
    sql: ${nb_enot_non_additive} ;;
  }

  measure: percent_of_total_notices {
    label: "% of Total Notices"
    type: percent_of_total
    value_format: "0.00\%"
    sql: ${count_notices} ;;
  }

  measure: percent_of_total_real_estate {
    label: "% of Total Real Estate"
    type: percent_of_total
    value_format: "0.00\%"
    sql: ${count_real_estate} ;;
  }
}

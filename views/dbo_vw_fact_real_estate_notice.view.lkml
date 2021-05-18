view: fact_real_estate_notice {
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
    type: number
    sql: ${TABLE}.Nb_Enot_Non_Additive ;;
  }

  dimension: is_ytd {
    type: yesno
    label: "Compare YTD"
    sql: EXTRACT(MONTH from ${fk_date_first_enot_request}) < EXTRACT(MONTH from CURRENT_TIMESTAMP) ;;
  }

  measure: count_real_estate {
    label: "# of Real Estate"
    type: count_distinct
    sql: ${fk_real_estate} ;;
    drill_fields: []
  }
}

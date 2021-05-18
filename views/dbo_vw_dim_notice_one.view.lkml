view: dim_notice_one {
  sql_table_name: `dwh.dbo_vwDimNoticeOne`
    ;;

  dimension: creation {
    hidden: yes
    type: date
    sql: ${TABLE}.CreationDate ;;
  }

  dimension: demand_id {
    type: number
    sql: ${TABLE}.Demand_id ;;
  }

  dimension: demand_language {
    type: string
    sql: ${TABLE}.DemandLanguage ;;
  }

  dimension: demand_origin_type {
    type: string
    sql: ${TABLE}.DemandOriginType ;;
  }

  dimension: demand_status_type {
    type: string
    sql: ${TABLE}.DemandStatusType ;;
  }

  dimension: is_outlier {
    type: number
    sql: ${TABLE}.isOutlier ;;
  }

  dimension: nb_enot {
    type: number
    sql: ${TABLE}.Nb_Enot ;;
  }

  dimension: notice_one_id {
    type: number
    sql: ${TABLE}.NoticeOne_id ;;
  }

  dimension: notice_one_social_and_fiscal {
    type: number
    sql: ${TABLE}.NoticeOneSocialAndFiscal ;;
  }

  dimension: pk_notice_one {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.PK_NoticeOne ;;
  }

  dimension: replaced_procedure_number {
    type: number
    sql: ${TABLE}.ReplacedProcedureNumber ;;
  }

  dimension: short_request {
    type: string
    sql: ${TABLE}.ShortRequest ;;
  }

  dimension: transaction_type {
    type: number
    sql: ${TABLE}.TransactionType ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}

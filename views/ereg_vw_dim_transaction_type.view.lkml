view: ereg_vw_dim_transaction_type {
  sql_table_name: `dwh.ereg_vwDimTransactionType`
    ;;

  dimension: category_code {
    type: string
    sql: ${TABLE}.CategoryCode ;;
  }

  dimension: category_label_fr {
    type: string
    sql: ${TABLE}.CategoryLabelFR ;;
  }

  dimension: category_label_nl {
    type: string
    sql: ${TABLE}.CategoryLabelNL ;;
  }

  dimension: is_good_mandatory {
    type: string
    sql: ${TABLE}.IsGoodMandatory ;;
  }

  dimension: is_vlabel_concerned {
    type: string
    sql: ${TABLE}.IsVlabelConcerned ;;
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

  dimension: party_implication_description {
    type: string
    sql: ${TABLE}.PartyImplicationDescription ;;
  }

  dimension: pk_ereg_transaction_type {
    type: string
    sql: ${TABLE}.PK_EregTransactionType ;;
  }

  dimension: sub_category_code {
    type: string
    sql: ${TABLE}.SubCategoryCode ;;
  }

  dimension: sub_category_label_fr {
    type: string
    sql: ${TABLE}.SubCategoryLabelFR ;;
  }

  dimension: sub_category_label_nl {
    type: string
    sql: ${TABLE}.SubCategoryLabelNL ;;
  }

  dimension: sys_insert_update_date {
    type: string
    sql: ${TABLE}.Sys_InsertUpdateDate ;;
  }

  dimension: transaction_type_code {
    type: string
    sql: ${TABLE}.TransactionTypeCode ;;
  }

  dimension: transaction_type_family {
    type: string
    sql: ${TABLE}.TransactionTypeFamily ;;
  }

  dimension: transaction_type_family_label_fr {
    type: string
    sql: ${TABLE}.TransactionTypeFamilyLabelFR ;;
  }

  dimension: transaction_type_family_label_nl {
    type: string
    sql: ${TABLE}.TransactionTypeFamilyLabelNL ;;
  }

  measure: count {
    type: count
    drill_fields: [m_job_run.m_job_run_id, m_job_run.m_job_name, m_model_run.m_model_run_id, m_model_run.m_model_name]
  }
}

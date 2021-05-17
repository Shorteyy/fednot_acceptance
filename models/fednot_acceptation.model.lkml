connection: "fednot-acc-datalake"

# include all the views
include: "/views/**/*.view"

datagroup: fednot_acceptation_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: fednot_acceptation_default_datagroup

map_layer: province_location_belgium {
  file: "/maps/belgium.json"
  property_key: "prov_nl"
}

map_layer: region_location_belgium {
  file: "/maps/belgium.json"
  property_key: "reg_nl"
}

# map_layer: region_location_belgium_ereg {
#   file: "/maps/belgium.json"
#   property_key: "reg_nis"
# }

# map_layer: province_location_belgium_ereg {
#   file: "/maps/belgium.json"
#   property_key: "prov_nis"
# }

explore: fact_prestation {
  label: "Prestation"
  join: dim_notary_office {
    sql_on: ${fact_prestation.dim_notary_office_sk} = ${dim_notary_office.dim_notary_office_sk} ;;
    relationship: many_to_one
    type: left_outer
  }
  join: dim_application {
    sql_on: ${fact_prestation.dim_application_sk} = ${dim_application.dim_application_sk} ;;
    relationship: many_to_one
    type: left_outer
  }
  join: dim_province {
    sql_on: ${fact_prestation.dim_province_sk} = ${dim_province.dim_province_sk} ;;
    relationship: many_to_one
    type: left_outer
  }
  join: prestation {
    from:  dim_date
    view_label: "Date Hierarchy"
    sql_on: ${fact_prestation.dim_days_sk} = ${prestation.date} ;;
    relationship:  many_to_one
    type: left_outer
  }
}

explore: ereg_vw_fact_transaction {
  view_name: ereg_vw_fact_transaction
  label: "eRegistration"
#   access_filter: {
#   field: province.region
#   user_attribute: region
#  }
  join: ereg_vw_dim_good {
    sql_on: ${ereg_vw_fact_transaction.fk_ereg_good} = ${ereg_vw_dim_good.pk_ereg_good} ;;
    relationship:  many_to_one
    type: left_outer
  }
  join: ereg_vw_dim_good_address {
    sql_on: ${ereg_vw_fact_transaction.fk_ereg_good_address} = ${ereg_vw_dim_good_address.pk_address} ;;
    relationship:  many_to_one
    type: left_outer
  }
  join:  ereg_vw_dim_party {
    sql_on:  ${ereg_vw_fact_transaction.fk_ereg_party} = ${ereg_vw_dim_party.pk_ereg_party};;
  relationship:  many_to_one
  type: left_outer
  }
  join:  ereg_vw_dim_party_address {
    sql_on: ${ereg_vw_fact_transaction.fk_ereg_party_address} = ${ereg_vw_dim_party_address.pk_address} ;;
  relationship:  many_to_one
  type: left_outer
  }
  join:  ereg_vw_dim_transaction {
    sql_on: ${ereg_vw_fact_transaction.fk_ereg_transaction} = ${ereg_vw_dim_transaction.pk_ereg_transaction} ;;
  relationship:  many_to_one
  type: left_outer
  }
  join:  ereg_vw_dim_transaction_type {
    sql_on: ${ereg_vw_fact_transaction.fk_ereg_transaction_type} = ${ereg_vw_dim_transaction_type.pk_ereg_transaction_type} ;;
  relationship:  many_to_one
  type: left_outer
  }
  join: deed {
    view_label: "Date Hierarchy"
    from: dim_date
    sql_on: ${ereg_vw_fact_transaction.fk_date_deed} = ${deed.pk_date} ;;
  relationship: many_to_one
  type: left_outer
  }
  join: First_Fednot_Sending {
    view_label: "Date Hierarchy"
    from: dim_date
    sql_on: ${ereg_vw_fact_transaction.fk_date_first_fed_not_sending} = ${First_Fednot_Sending.pk_date} ;;
    relationship: many_to_one
    type: left_outer
  }
}

explore: ereg_vw_fact_transaction_f {
  extends: [ereg_vw_fact_transaction]
  label: "eRegistration (Finance)"
  join:  ereg_vw_dim_study {
    sql_on: ${ereg_vw_fact_transaction.fk_study} = ${ereg_vw_dim_study.pk_study};;
    relationship:  many_to_one
    type: left_outer
  }
  join:  ereg_vw_dim_study_address {
    sql_on: ${ereg_vw_fact_transaction.fk_study_address} = ${ereg_vw_dim_study_address.pk_address};;
    relationship:  many_to_one
    type: left_outer
  }
  join: ereg_vw_dim_deed_edossier {
    sql_on: ${ereg_vw_fact_transaction.fk_ereg_deed_edossier} = ${ereg_vw_dim_deed_edossier.pk_ereg_deed_edossier} ;;
    relationship: many_to_one
    type: left_outer
  }
  join: ereg_vw_dim_expedition {
    sql_on: ${ereg_vw_fact_transaction.fk_ereg_expedition} = ${ereg_vw_dim_expedition.pk_ereg_expedition} ;;
    relationship: many_to_one
    type: left_outer
  }
  join:  ereg_vw_dim_party_quality {
    sql_on: ${ereg_vw_fact_transaction.fk_ereg_party_quality} = ${ereg_vw_dim_party_quality.pk_ereg_party_quality};;
    relationship:  many_to_one
    type: left_outer
  }
  join:  ereg_vw_dim_party_right_type {
    sql_on: ${ereg_vw_fact_transaction.fk_ereg_party_right_type} =${ereg_vw_dim_party_right_type.pk_ereg_party_right_type} ;;
    relationship:  many_to_one
    type: left_outer
  }
  join:  ereg_vw_dim_sending_answer {
    sql_on: ${ereg_vw_fact_transaction.fk_ereg_sending_answer}  = ${ereg_vw_dim_sending_answer.pk_ereg_sending_answer} ;;
    relationship:  many_to_one
    type: left_outer
  }
  join:  ereg_vw_dim_sp25 {
    sql_on: ${ereg_vw_fact_transaction.fk_ereg_sp25} = ${ereg_vw_dim_sp25.pk_ereg_sp25};;
    relationship:  many_to_one
    type: left_outer
  }
  join: Expedition_Signed {
    view_label: "Date Hierarchy"
    from: dim_date
    sql_on: ${ereg_vw_fact_transaction.fk_date_expedition_signed} = ${Expedition_Signed.pk_date} ;;
    relationship: many_to_one
    type: left_outer
  }
  join: Deed_Registered_AA {
    view_label: "Date Hierarchy"
    from: dim_date
    sql_on: ${ereg_vw_fact_transaction.fk_date_deed_registered_aa} = ${Deed_Registered_AA.pk_date} ;;
    relationship: many_to_one
    type: left_outer
  }
  join: eDossier_Creation {
    view_label: "Date Hierarchy"
    from: dim_date
    sql_on: ${ereg_vw_fact_transaction.fk_date_edossier_creation} = ${eDossier_Creation.pk_date} ;;
    relationship: many_to_one
    type: left_outer
  }
  join: Fednot_Received_Answer {
    view_label: "Date Hierarchy"
    from: dim_date
    sql_on: ${ereg_vw_fact_transaction.fk_date_fed_not_received_answer} = ${Fednot_Received_Answer.pk_date} ;;
    relationship: many_to_one
    type: left_outer
  }
  join: Fednot_Sending {
    view_label: "Date Hierarchy"
    from: dim_date
    sql_on: ${ereg_vw_fact_transaction.fk_date_fed_not_sending} = ${Fednot_Sending.pk_date} ;;
    relationship: many_to_one
    type: left_outer
  }
  join: Request {
    view_label: "Date Hierarchy"
    from: dim_date
    sql_on: ${ereg_vw_fact_transaction.fk_date_request} = ${Request.pk_date} ;;
    relationship: many_to_one
    type: left_outer
  }
}

explore: fact_comparison_point {
  label: "Real Estate Pricing"
  join: dim_address {
  sql_on: ${fact_comparison_point.fk_address} = ${dim_address.pk_address} ;;
  relationship: many_to_one
  type:  left_outer
  }
  join: dim_heating_type {
  sql_on: ${fact_comparison_point.fk_heating_type} = ${dim_heating_type.pk_heating_type} ;;
  relationship: many_to_one
  type: left_outer
  }
  join: dim_comparison_point {
  sql_on: ${fact_comparison_point.fk_comparison_point} = ${dim_comparison_point.pk_comparison_point} ;;
  relationship:  many_to_one
  type:  left_outer
  }
  join: dim_notice_one {
    sql_on: ${fact_comparison_point.fk_notice_one} =${dim_notice_one.pk_notice_one} ;;
    relationship: many_to_one
    type: left_outer
  }
  join: dim_pebtype {
    sql_on: ${fact_comparison_point.fk_pebtype} =${dim_pebtype.pk_pebtype} ;;
    relationship: many_to_one
    type: left_outer
  }
  join: dim_property_type {
    sql_on: ${fact_comparison_point.fk_property_type} =${dim_property_type.pk_property_type};;
    relationship: many_to_one
    type: left_outer
  }
  join: dim_selling_type {
    sql_on: ${fact_comparison_point.fk_selling_type} =${dim_selling_type.pk_selling_type};;
    relationship: many_to_one
    type: left_outer
  }
  join: dim_source_system {
    sql_on: ${fact_comparison_point.fk_source_system} =${dim_source_system.pk_source_system};;
    relationship: many_to_one
    type: left_outer
  }
  join: ereg_vw_dim_study {
    sql_on: ${fact_comparison_point.fk_study} =${ereg_vw_dim_study.pk_study};;
    relationship: many_to_one
    type: left_outer
  }
  join: encoding {
    view_label: "Date Hierarchy"
    from: dim_date
    sql_on: ${fact_comparison_point.fk_date_encoding} = ${encoding.pk_date} ;;
    relationship: many_to_one
    type: left_outer
  }
}

explore: fact_real_estate_notice {
    sql_always_where: ${ereg_vw_dim_transaction_type.pk_ereg_transaction_type} = 3;;
    label: "Real Estate Activity"
    join: dim_address {
    sql_on: ${fact_real_estate_notice.fk_address} =${dim_address.pk_address};;
    relationship: many_to_one
    type:  left_outer
  }
  join: dim_notice_one {
    sql_on: ${fact_real_estate_notice.fk_address} = ${dim_address.pk_address};;
    relationship: many_to_one
    type: left_outer
  }
  join: dim_property_type {
    sql_on: ${fact_real_estate_notice.fk_property_type} =${dim_property_type.pk_property_type};;
    relationship: many_to_one
    type: left_outer
  }
  join: dim_real_estate {
    sql_on: ${fact_real_estate_notice.fk_real_estate} =${dim_real_estate.pk_real_estate};;
    relationship: many_to_one
    type: left_outer
  }
  join: dim_selling_type {
    sql_on: ${fact_real_estate_notice.fk_selling_type} = ${dim_selling_type.pk_selling_type} ;;
    relationship: many_to_one
    type: left_outer
  }
  join: dim_source_system {
    sql_on: ${fact_real_estate_notice.fk_source_system} =${dim_source_system.pk_source_system};;
    relationship: many_to_one
    type: left_outer
  }
  join: ereg_vw_dim_study {
    sql_on: ${fact_real_estate_notice.fk_study} =${ereg_vw_dim_study.pk_study};;
    relationship:  many_to_one
    type: left_outer
  }
  join: ereg_vw_dim_transaction_type {
    sql_on: ${fact_real_estate_notice.fk_transaction_type} =${ereg_vw_dim_transaction_type.pk_ereg_transaction_type};;
    relationship: many_to_one
    type: left_outer
  }
  join: first_sending_notary {
    view_label: "Date Hierarchy"
    from: dim_date
    sql_on: ${fact_real_estate_notice.fk_date_first_enot_request} = ${first_sending_notary.pk_date} ;;
    relationship: many_to_one
    type: left_outer
  }
  # join: first_received_function_ack {
  #   view_label: "Date Hierarchy"
  #   from: dim_date
  #   sql_on: ${fact_real_estate_notice.fk_date_first_received_function_ack} = ${first_received_function_ack.pk_date} ;;
  #   relationship: many_to_one
  #   type: left_outer
  # }
}

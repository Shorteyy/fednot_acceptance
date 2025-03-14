connection: "fednot-acc-datalake"

# include all the views
include: "/views/**/*.view"

datagroup: fednot_acceptation_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: fednot_acceptation_default_datagroup

map_layer: region_location_belgium_ereg {
  file: "/maps/belgium.json"
  property_key: "reg_nis"
  property_label_key: "reg_nl"
}

map_layer: municipality_location_belgium_ereg {
  file: "/maps/belgium.json"
  property_key: "nis"
  property_label_key: "name_nl"
}

map_layer: district_location_belgium_ereg {
  file: "/maps/belgium.json"
  property_key: "arr_nis"
  property_label_key: "arr_nl"
}

map_layer: province_location_belgium_ereg {
  file: "/maps/belgium.json"
  property_key: "prov_nis"
  property_label_key: "prov_nl"
}

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
    view_label: "Dimensions"
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
  join: deed_date {
    view_label: "Dimensions"
    from: dim_date
    sql_on: ${ereg_vw_fact_transaction.fk_date_deed} = ${deed_date.pk_date} ;;
  relationship: many_to_one
  type: left_outer
  }
  join: First_Fednot_Sending_date {
    view_label: "Dimensions"
    from: dim_date
    sql_on: ${ereg_vw_fact_transaction.fk_date_first_fed_not_sending} = ${First_Fednot_Sending_date.pk_date} ;;
    relationship: many_to_one
    type: left_outer
  }
}

explore: ereg_vw_fact_transaction_f {
  extends: [ereg_vw_fact_transaction]
  label: "eRegistration (Study)"
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
    view_label: "Dimensions"
    from: dim_date
    sql_on: ${ereg_vw_fact_transaction.fk_date_expedition_signed} = ${Expedition_Signed.pk_date} ;;
    relationship: many_to_one
    type: left_outer
  }
  join: Deed_Registered_AA {
    view_label: "Dimensions"
    from: dim_date
    sql_on: ${ereg_vw_fact_transaction.fk_date_deed_registered_aa} = ${Deed_Registered_AA.pk_date} ;;
    relationship: many_to_one
    type: left_outer
  }
  join: eDossier_Creation_date {
    view_label: "Dimensions"
    from: dim_date
    sql_on: ${ereg_vw_fact_transaction.fk_date_edossier_creation} = ${eDossier_Creation_date.pk_date} ;;
    relationship: many_to_one
    type: left_outer
  }
  join: Fednot_Received_Answer_date {
    view_label: "Dimensions"
    from: dim_date
    sql_on: ${ereg_vw_fact_transaction.fk_date_fed_not_received_answer} = ${Fednot_Received_Answer_date.pk_date} ;;
    relationship: many_to_one
    type: left_outer
  }
  join: Fednot_Sending_date {
    view_label: "Dimensions"
    from: dim_date
    sql_on: ${ereg_vw_fact_transaction.fk_date_fed_not_sending} = ${Fednot_Sending_date.pk_date} ;;
    relationship: many_to_one
    type: left_outer
  }
  join: Request_date {
    view_label: "Dimensions"
    from: dim_date
    sql_on: ${ereg_vw_fact_transaction.fk_date_request} = ${Request_date.pk_date} ;;
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
  fields: []
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
    fields: []
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
  join: encoding_date {
    view_label: "Dimensions"
    from: dim_date
    sql_on: ${fact_comparison_point.fk_date_encoding} = ${encoding_date.pk_date} ;;
    relationship: many_to_one
    type: left_outer
  }
}

explore: fact_real_estate_notice {
  description: "Used to measure real estate activity and distribution by type of real estate in Belgium. For this purpose,
  ASF data pertaining to the social and fiscal procedure for alienation is used."
    sql_always_where: ${fact_real_estate_notice.fk_transaction_type} = 3 and ${fk_date_first_enot_request} > 20161231;;
    label: "Real Estate Activity"
    join: dim_address {
    sql_on: ${fact_real_estate_notice.fk_address} =${dim_address.pk_address};;
    relationship: many_to_one
    type:  left_outer
  }
  join: dim_notice_one {
    sql_on: ${fact_real_estate_notice.fk_notice_one} = ${dim_notice_one.pk_notice_one};;
    relationship: many_to_one
    type: left_outer
    fields: []
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
    fields: []
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
    fields: []
  }
  join: ereg_vw_dim_study {
    sql_on: ${fact_real_estate_notice.fk_study} =${ereg_vw_dim_study.pk_study};;
    relationship:  many_to_one
    type: left_outer
    fields: []
  }
  join: first_sending_notary {
    view_label: "Dimensions"
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
  # join: notice_one_creation {
  #   view_label: "Date Hierarchy"
  #   from: dim_date
  #   sql_on: ${dim_notice_one.creation} = ${notice_one_creation.pk_date} ;;
  #   relationship: many_to_one
  #   type: left_outer
  # }
}

explore: fact_izimi_events {
  label: "Izimi Events"
  join: dim_izimi_category {
    sql_on: ${fact_izimi_events.dim_document_owner_sk} = ${dim_izimi_category.dim_izimi_category_sk} ;;
    relationship: many_to_one
    type:  left_outer
  }
  join: dim_izimi_event_types {
    sql_on: ${fact_izimi_events.dim_izimievent_type_sk} = ${dim_izimi_event_types.dim_izimievent_type_sk} ;;
    relationship: many_to_one
    type:  left_outer
  }
  join: dim_izimi_users {
    sql_on: ${fact_izimi_events.dim_izimiuser_sk} = ${dim_izimi_users.dim_izimiuser_sk} ;;
    relationship: many_to_one
    type:  left_outer
  }
  join: dim_izimi_vault {
    sql_on: ${fact_izimi_events.dim_izimi_vault_sk} = ${dim_izimi_vault.dim_izimi_vault_sk} ;;
    relationship: many_to_one
    type:  left_outer
  }
  join: dim_izimi_document_owner {
    view_label: "Dimensions"
    from: dim_izimi_users
    sql_on: ${fact_izimi_events.dim_document_owner_sk} = ${dim_izimi_document_owner.dim_izimiuser_sk} ;;
    relationship: many_to_one
    type:  left_outer
  }
  join: event_date {
    from:  dim_date
    view_label: "Dimensions"
    sql_on: ${fact_izimi_events.dim_days_sk} = ${event_date.date} ;;
    relationship:  many_to_one
    type: left_outer
  }
}

explore: fact_izimi_items {
  label: "Izimi Documents"
  join: dim_izimi_items {
    sql_on: ${fact_izimi_items.dim_izimi_item_sk} = ${dim_izimi_items.dim_izimiitem_sk} ;;
    relationship: many_to_one
    type:  left_outer
  }
  join: dim_izimi_category_group {
  sql_on: ${fact_izimi_items.dim_izimi_category_group_sk} = ${dim_izimi_category_group.dim_izimi_category_group_sk} ;;
  relationship: many_to_one
  type:  left_outer
  }
  join: dim_izimi_vault {
  sql_on: ${fact_izimi_items.dim_izimi_vault_sk} = ${dim_izimi_vault.dim_izimi_vault_sk} ;;
  relationship: many_to_one
  type:  left_outer
  }
  join: document_date {
    from:  dim_date
    view_label: "Dimensions"
    sql_on: ${fact_izimi_items.dim_days_sk} = ${document_date.date} ;;
    relationship:  many_to_one
    type: left_outer
  }
}

explore: fact_izimi_vaults {
  label: "Izimi Vaults"
  join: dim_izimi_vault {
    sql_on: ${fact_izimi_vaults.dim_izimivault_sk} = ${dim_izimi_vault.dim_izimi_vault_sk} ;;
    relationship: many_to_one
    type:  left_outer
  }
  join: dim_izimi_users {
    sql_on: ${fact_izimi_vaults.dim_izimiuser_sk} = ${dim_izimi_users.dim_izimiuser_sk} ;;
    relationship: many_to_one
    type:  left_outer
  }
  join: vault_creation_date {
      from:  dim_date
      view_label: "Dimensions"
      sql_on: ${fact_izimi_vaults.dim_days_sk} = ${vault_creation_date.date} ;;
      relationship:  many_to_one
      type: left_outer
    }
  join: registered_date {
    from:  dim_date
    view_label: "Dimensions"
    sql_on: ${fact_izimi_vaults.registered} = ${registered_date.date} ;;
    relationship:  many_to_one
    type: left_outer
  }
}

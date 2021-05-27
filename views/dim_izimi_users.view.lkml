view: dim_izimi_users {
  label: "Dimensions"
  sql_table_name: `dwh.dim_izimiUsers`
    ;;
  drill_fields: [id]

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: access_level {
    group_label: "{% assign groupname = _view._name | replace: \"dim_izimi_\" , \"\" | replace: \"_\", \" \" | capitalize %} {{groupname}}"
    type: string
    sql: ${TABLE}.accessLevel ;;
  }

  dimension: birthyear {
    group_label: "{% assign groupname = _view._name | replace: \"dim_izimi_\" , \"\" | replace: \"_\", \" \" | capitalize %} {{groupname}}"
    type: string
    sql: ${TABLE}.birthyear ;;
  }

  dimension: deactivation_code {
    group_label: "{% assign groupname = _view._name | replace: \"dim_izimi_\" , \"\" | replace: \"_\", \" \" | capitalize %} {{groupname}}"
    type: string
    sql: ${TABLE}.deactivationCode ;;
  }

  dimension_group: deceased_notification {
    group_label: "{% assign groupname = _view._name | replace: \"dim_izimi_\" , \"\" | replace: \"_\", \" \" | capitalize %} {{groupname}}"
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
    sql: ${TABLE}.deceasedNotificationDate ;;
  }

  dimension: dim_izimiuser_sk {
    hidden: yes
    type: string
    sql: ${TABLE}.dim_izimiuser_sk ;;
  }

  dimension: fednot_id {
    group_label: "{% assign groupname = _view._name | replace: \"dim_izimi_\" , \"\" | replace: \"_\", \" \" | capitalize %} {{groupname}}"
    type: string
    sql: ${TABLE}.fednotId ;;
  }

  dimension: gender {
    group_label: "{% assign groupname = _view._name | replace: \"dim_izimi_\" , \"\" | replace: \"_\", \" \" | capitalize %} {{groupname}}"
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: h_izimi_user_bk {
    group_label: "{% assign groupname = _view._name | replace: \"dim_izimi_\" , \"\" | replace: \"_\", \" \" | capitalize %} {{groupname}}"
    label: "User"
    type: string
    sql: ${TABLE}.h_izimi_user_bk ;;
  }

  dimension: locality_name {
    group_label: "{% assign groupname = _view._name | replace: \"dim_izimi_\" , \"\" | replace: \"_\", \" \" | capitalize %} {{groupname}}"
    type: string
    sql: ${TABLE}.localityName ;;
  }

  dimension: niscode {
    group_label: "{% assign groupname = _view._name | replace: \"dim_izimi_\" , \"\" | replace: \"_\", \" \" | capitalize %} {{groupname}}"
    hidden: yes
    type: number
    sql: ${TABLE}.NISCode ;;
  }

  dimension: postal_code {
    group_label: "{% assign groupname = _view._name | replace: \"dim_izimi_\" , \"\" | replace: \"_\", \" \" | capitalize %} {{groupname}}"
    type: string
    sql: ${TABLE}.postalCode ;;
  }

  dimension: preferred_notary_id {
    group_label: "{% assign groupname = _view._name | replace: \"dim_izimi_\" , \"\" | replace: \"_\", \" \" | capitalize %} {{groupname}}"
    type: string
    sql: ${TABLE}.preferredNotaryId ;;
  }

  dimension: public_user_id {
    group_label: "{% assign groupname = _view._name | replace: \"dim_izimi_\" , \"\" | replace: \"_\", \" \" | capitalize %} {{groupname}}"
    type: string
    sql: ${TABLE}.publicUserId ;;
  }

  dimension: push_notifications_enabled {
    group_label: "{% assign groupname = _view._name | replace: \"dim_izimi_\" , \"\" | replace: \"_\", \" \" | capitalize %} {{groupname}}"
    type: yesno
    sql: ${TABLE}.pushNotificationsEnabled ;;
  }

  dimension_group: registered {
    group_label: "{% assign groupname = _view._name | replace: \"dim_izimi_\" , \"\" | replace: \"_\", \" \" | capitalize %} {{groupname}}"
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
    sql: ${TABLE}.registeredOn ;;
  }

  dimension: role {
    group_label: "{% assign groupname = _view._name | replace: \"dim_izimi_\" , \"\" | replace: \"_\", \" \" | capitalize %} {{groupname}}"
    type: string
    sql: ${TABLE}.role ;;
  }

  dimension: trust_builder_id {
    group_label: "{% assign groupname = _view._name | replace: \"dim_izimi_\" , \"\" | replace: \"_\", \" \" | capitalize %} {{groupname}}"
    type: string
    sql: ${TABLE}.trustBuilderId ;;
  }

  dimension: username {
    group_label: "{% assign groupname = _view._name | replace: \"dim_izimi_\" , \"\" | replace: \"_\", \" \" | capitalize %} {{groupname}}"
    label: "User Name"
    type: string
    sql: ${TABLE}.username ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [id, locality_name, username]
  }
}

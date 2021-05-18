view: global_parameters {
  extension: required

  # Period Selector

  # parameter: timeframe_picker {
  #   view_label: "Parameters"
  #   label: "{% assign groupname = _field._name | replace: \"dim\" , \" \" | replace: \"_\" , \" \" | replace: \".language picker\", \" \" | capitalize %} {{groupname}}Period Granularity"
  #   type: unquoted
  #   allowed_value: { value: "Month" }
  #   allowed_value: { value: "Quarter" }
  #   allowed_value: { value: "Year" }
  #   default_value: "Month"
  # }

  # Language Selector

  parameter: language_picker {
    view_label: "Language Selectors"
    label: "{% assign groupname = _field._name | replace: \"dim\" , \"\" | replace: \"_\" , \" \" | replace: \".language picker\", \" \" | replace: \" \" \"\" | capitalize %} {{groupname}} Language Selector"
    type: string
    allowed_value: { value: "NL" }
    allowed_value: { value: "FR" }
    allowed_value: { value: "DE" }
    default_value: "NL"
  }

}

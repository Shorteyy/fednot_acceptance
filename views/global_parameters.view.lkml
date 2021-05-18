view: global_parameters {
  extension: required

  # Timeframe

  parameter: timeframe_picker {
    view_label: "-- Parameters"
    label: "Period Granularity"
    type: unquoted
    allowed_value: { value: "Month" }
    allowed_value: { value: "Quarter" }
    allowed_value: { value: "Year" }
    default_value: "Month"
  }

}

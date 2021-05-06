project_name: "fednot_acceptation"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }

# constant: dynamic_date_sql {
#   value: "{% assign dimension_name = _field._name | replace: '_dynamic', '' %}
#     {% if timeframe_picker._parameter_value == 'Month' %} DATE_TRUNC({{ dimension_name }}, MONTH)
#     {% if timeframe_picker._parameter_value == 'Quarter' %} floor((extract_months({{ dimension_name }})-1)/3) + 1
#     {% elsif timeframe_picker._parameter_value == 'Year' %} EXTRACT(YEAR from {{ dimension_name }})
#     {% else %} null
#     {% endif %}"
# }

# constant: dynamic_date_html {
#   value: "{% assign month_size = rendered_value.size | minus: 3 %}
#   {% if timeframe_picker._parameter_value == 'Month' %} {{ rendered_value | slice: 0, month_size }}
#   {% else %} {{ rendered_value }}
#   {% endif %}"
# }

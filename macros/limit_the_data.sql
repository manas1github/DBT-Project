{% macro limit_the_data(column_name,days_you_want=2) -%} 
{% if target.name == 'default' -%}
where {{ column_name }} >= dateadd('day',-{{ days_you_want }},current_timestamp)
{%- endif %}
{%- endmacro %}
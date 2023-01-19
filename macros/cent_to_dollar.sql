{% macro cent_to_dollar(column_name,decimal_place=2) -%}
round( 1.0 * {{ column_name }}/100, {{ decimal_place }})
{%- endmacro %}
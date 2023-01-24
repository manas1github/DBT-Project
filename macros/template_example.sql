{% macro template_example() -%}

{% set query -%}

 select true as bool

{%- endset %}

{% if execute -%} 

{%- set results=run_query(query).columns[0].values()[0] -%}
{{ log('SQL Results ' ~ results, info=True) }}

select {{ results }} as a_real_result from a_real_table

{%- endif %}

{%- endmacro %}
{% macro grant_macro(warehouse, database, role) %}

  {% set all %}

    USE ROLE SECURITYADMIN;
    CREATE ROLE IF NOT EXISTS {{role}};
    GRANT ALL ON WAREHOUSE {{warehouse}} TO ROLE {{role}};
    GRANT OWNERSHIP ON DATABASE {{database}} TO ROLE {{role}};
    GRANT ALL ON DATABASE {{database}} TO ROLE {{role}};
    GRANT OWNERSHIP ON ALL SCHEMAS IN DATABASE {{database}} TO ROLE {{role}};
    GRANT ALL ON ALL SCHEMAS IN DATABASE {{database}} TO ROLE {{role}};
    GRANT OWNERSHIP ON ALL TABLES IN DATABASE {{database}} TO ROLE {{role}};
    GRANT OWNERSHIP ON ALL VIEWS IN DATABASE {{database}} TO ROLE {{role}};
    GRANT ALL ON ALL TABLES IN DATABASE {{database}} TO ROLE {{role}};
    GRANT ALL ON ALL VIEWS IN DATABASE {{database}} TO ROLE {{role}};
    GRANT ALL ON FUTURE SCHEMAS IN DATABASE {{database}} TO ROLE {{role}};
    GRANT ALL ON FUTURE TABLES IN DATABASE {{database}} TO ROLE {{role}};
    GRANT ALL ON FUTURE VIEWS IN DATABASE {{database}} TO ROLE {{role}};
    
  {% endset %}

  {% set readonly %}

    USE ROLE SECURITYADMIN;
    CREATE ROLE IF NOT EXISTS {{role}};
    GRANT USAGE ON WAREHOUSE {{warehouse}} TO ROLE {{role}};
    GRANT USAGE ON DATABASE {{database}} TO ROLE {{role}};
    GRANT USAGE ON ALL SCHEMAS IN DATABASE {{database}} TO ROLE {{role}};
    GRANT SELECT ON ALL TABLES IN DATABASE {{database}} TO ROLE {{role}};
    GRANT SELECT ON ALL VIEWS IN DATABASE {{database}} TO ROLE {{role}};
    GRANT USAGE ON FUTURE SCHEMAS IN DATABASE {{database}} TO ROLE {{role}};
    GRANT SELECT ON FUTURE TABLES IN DATABASE {{database}} TO ROLE {{role}};
    GRANT SELECT ON FUTURE VIEWS IN DATABASE {{database}} TO ROLE {{role}};

  {% endset %}

  {% set selected %}

    USE ROLE SECURITYADMIN;
    CREATE ROLE IF NOT EXISTS {{role}};
    GRANT ALL ON WAREHOUSE {{warehouse}} TO {{role}};
    GRANT OWNERSHIP ON DATABASE {{database}} TO ROLE {{role}};
    GRANT ALL ON DATABASE {{database}} TO ROLE {{role}};
    GRANT OWNERSHIP ON ALL SCHEMAS IN DATABASE {{database}} TO ROLE {{role}};
    GRANT ALL ON ALL SCHEMAS IN DATABASE {{database}} TO ROLE {{role}};
    GRANT OWNERSHIP ON ALL TABLES IN DATABASE {{database}}	TO ROLE {{role}};
    GRANT OWNERSHIP ON ALL VIEWS IN DATABASE {{database}} TO ROLE {{role}};
    GRANT ALL ON ALL TABLES IN DATABASE {{database}} TO ROLE {{role}};
    GRANT ALL ON ALL VIEWS IN DATABASE {{database}} TO ROLE {{role}};
    GRANT ALL ON ALL PROCEDURES IN DATABASE {{database}} TO ROLE {{role}};
    GRANT ALL ON FUTURE TABLES IN DATABASE {{database}} TO ROLE {{role}};
    GRANT ALL ON FUTURE VIEWS IN DATABASE {{database}} TO ROLE {{role}};
    GRANT ALL ON FUTURE SCHEMAS IN DATABASE {{database}} TO ROLE {{role}};

  {% endset %}
 
    {% do run_query(readonly) %}
{{ log("Privilages Granted!", info=True) }}

{% endmacro %}
SHOW TABLES IN DATABASE tasty_bytes_dbt_db;

SHOW VIEWS IN DATABASE tasty_bytes_dbt_db;

SHOW DBT PROJECTS LIKE 'tasty%';

delete from tasty_bytes_dbt_db.raw.order_header
select * from tasty_bytes_dbt_db.raw.order_header
select * from tasty_bytes_dbt_db.raw.order_header_RECOVER

SELECT
    QUERY_ID,
    USER_NAME,
    START_TIME,
    QUERY_TEXT
FROM TABLE(
    INFORMATION_SCHEMA.QUERY_HISTORY()
)
WHERE QUERY_TEXT ILIKE '%DELETE%'
ORDER BY START_TIME DESC;

CREATE TABLE tasty_bytes_dbt_db.raw.order_header_RECOVER AS
SELECT *
FROM tasty_bytes_dbt_db.raw.order_header
BEFORE(STATEMENT => '01c69e26-0304-7ed2-0004-ffd20039d9d6');

drop table tasty_bytes_dbt_db.raw.order_header

ALTER TABLE tasty_bytes_dbt_db.raw.order_header_RECOVER
RENAME TO tasty_bytes_dbt_db.raw.order_header;


ALTER WAREHOUSE tasty_bytes_dbt_wh SET WAREHOUSE_SIZE = SMALL;

select count(*) from tasty_bytes_dbt_db.raw.order_detail

select count(*) from tasty_bytes_dbt_db.dev.raw_pos_order_detail
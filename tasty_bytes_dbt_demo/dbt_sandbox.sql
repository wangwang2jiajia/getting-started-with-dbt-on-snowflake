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


-- If you want to keep this setup, suspend the task to stop scheduled runs:
ALTER TASK IF EXISTS tasty_bytes_dbt_db.dev.run_prepped_data_dbt SUSPEND;

-- If you want to remove this setup, drop the task, warehouse, and databases:
DROP TASK IF EXISTS tasty_bytes_dbt_db.dev.run_prepped_data_dbt;
DROP WAREHOUSE IF EXISTS tasty_bytes_dbt_wh;
DROP DATABASE IF EXISTS tasty_bytes_dbt_db;
DROP DATABASE IF EXISTS tb_101;

USE DATABASE tasty_bytes_dbt_db

SELECT *
FROM INFORMATION_SCHEMA.LOAD_HISTORY
where table_name = 'ORDER_DETAIL'

TRUNCATE TABLE tasty_bytes_dbt_db.raw.order_header;

COPY INTO tasty_bytes_dbt_db.raw.order_header
FROM @tasty_bytes_dbt_db.public.s3load/raw_pos/order_header/
FORCE = TRUE;

--DELETE
--= 删数据
--= 保留Load History

--TRUNCATE
--= 删数据
--= 删除Load History

--DROP
--= 删表
--= 表都没了

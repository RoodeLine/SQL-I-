WITH currency_last_update AS (
  SELECT 
    id, name, MAX(updated) AS updated 
  FROM currency 
  GROUP BY 
    id, name
), 
ccurrency_rate_to_usd AS (
  SELECT
    currency.id, 
    currency.rate_to_usd 
  FROM currency 
    JOIN currency_last_update 
        ON currency.id = currency_last_update.id 
        AND currency.name = currency_last_update.name 
        AND currency.updated = currency_last_update.updated
),
sum_volume AS (
    SELECT user_id, type, currency_id, SUM(money) AS volume
    FROM balance
    GROUP BY user_id, type, currency_id
),
All_Data AS (
  SELECT 
    COALESCE("user".name, 'not defined') AS name, 
    COALESCE("user".lastname, 'not defined') AS lastname, 
    sum_volume.type,
    sum_volume.volume,
    COALESCE(currency_last_update.name, 'not defined') AS currency_name, 
    COALESCE(ccurrency_rate_to_usd.rate_to_usd, 1) AS last_rate_to_usd,
    CAST(sum_volume.volume AS NUMERIC) * COALESCE(ccurrency_rate_to_usd.rate_to_usd,1)
        AS total_volume_in_usd
  FROM sum_volume
    LEFT JOIN "user" 
        ON sum_volume.user_id = "user".id 
    LEFT JOIN currency_last_update 
        ON sum_volume.currency_id = currency_last_update.id 
    LEFT JOIN ccurrency_rate_to_usd
        ON sum_volume.currency_id = ccurrency_rate_to_usd.id
) 
SELECT * FROM All_Data
ORDER BY 
    name DESC, 
    lastname, 
    type;

SET @s = (SELECT IF(
    (SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE table_name = 'Filters'
    AND table_schema = DATABASE()
    AND column_name = 'Enabled'
    ) > 0,
"SELECT 'Column Enabled exists in Filters'",
"ALTER TABLE Filters ADD `Enabled` tinyint(3) unsigned NOT NULL default '1' AFTER `Concurrent`"
));

PREPARE stmt FROM @s;
EXECUTE stmt;

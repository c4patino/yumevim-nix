{
  # SQL snippets
  extraConfigLua = ''
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local fmt = require("luasnip.extras.fmt").fmt

    local sql_snippets = {
      -- Basic queries
      s("select", fmt([[
        SELECT {}
        FROM {}
        WHERE {};
      ]], {
        i(1, "*"),
        i(2, "table_name"),
        i(3, "condition")
      })),

      s("selectall", fmt([[
        SELECT *
        FROM {};
      ]], {
        i(1, "table_name")
      })),

      s("distinct", fmt([[
        SELECT DISTINCT {}
        FROM {};
      ]], {
        i(1, "column"),
        i(2, "table_name")
      })),

      -- Filtering
      s("where", fmt("WHERE {};", {
        i(1, "condition")
      })),

      s("in", fmt("{} IN ({});", {
        i(1, "column"),
        i(2, "value1, value2")
      })),

      s("between", fmt("{} BETWEEN {} AND {}", {
        i(1, "column"),
        i(2, "start"),
        i(3, "end")
      })),

      s("like", fmt("{} LIKE '{}';", {
        i(1, "column"),
        i(2, "%pattern%")
      })),

      s("null", fmt("{} IS NULL", {
        i(1, "column")
      })),

      s("notnull", fmt("{} IS NOT NULL", {
        i(1, "column")
      })),

      -- Joins
      s("join", fmt([[
        SELECT {}
        FROM {} AS {}
        INNER JOIN {} AS {}
            ON {} = {};
      ]], {
        i(1, "*"),
        i(2, "table_a"),
        i(3, "a"),
        i(4, "table_b"),
        i(5, "b"),
        i(6, "a.id"),
        i(7, "b.a_id")
      })),

      s("leftjoin", fmt([[
        SELECT {}
        FROM {} AS {}
        LEFT JOIN {} AS {}
            ON {} = {};
      ]], {
        i(1, "*"),
        i(2, "table_a"),
        i(3, "a"),
        i(4, "table_b"),
        i(5, "b"),
        i(6, "a.id"),
        i(7, "b.a_id")
      })),

      s("rightjoin", fmt([[
        SELECT {}
        FROM {} AS {}
        RIGHT JOIN {} AS {}
            ON {} = {};
      ]], {
        i(1, "*"),
        i(2, "table_a"),
        i(3, "a"),
        i(4, "table_b"),
        i(5, "b"),
        i(6, "a.id"),
        i(7, "b.a_id")
      })),

      s("fulljoin", fmt([[
        SELECT {}
        FROM {} AS {}
        FULL OUTER JOIN {} AS {}
            ON {} = {};
      ]], {
        i(1, "*"),
        i(2, "table_a"),
        i(3, "a"),
        i(4, "table_b"),
        i(5, "b"),
        i(6, "a.id"),
        i(7, "b.a_id")
      })),

      -- Aggregation
      s("groupby", fmt([[
        SELECT {}, COUNT(*) AS {}
        FROM {}
        GROUP BY {};
        ]], {
        i(1, "column"),
        i(2, "count"),
        i(3, "table_name"),
        i(4, "column")
      })),

      s("having", fmt([[
        GROUP BY {}
        HAVING {};
      ]], {
        i(1, "column"),
        i(2, "COUNT(*) > 1")
      })),

      s("orderby", fmt([[
        ORDER BY {} {};
      ]], {
        i(1, "column"),
        i(2, "ASC")
      })),

      s("limit", fmt("LIMIT {};", {
        i(1, "10")
      })),

      s("count", fmt("SELECT COUNT(*) FROM {};", {
        i(1, "table_name")
      })),

      s("sum", fmt("SELECT SUM({}) FROM {};", {
        i(1, "column"),
        i(2, "table_name")
      })),

      s("avg", fmt("SELECT AVG({}) FROM {};", {
        i(1, "column"),
        i(2, "table_name")
      })),

      -- Insert
      s("insert", fmt([[
        INSERT INTO {} ({}, {})
        VALUES ({}, {});
      ]], {
        i(1, "table_name"),
        i(2, "column1"),
        i(3, "column2"),
        i(4, "value1"),
        i(5, "value2")
      })),

      s("insertselect", fmt([[
        INSERT INTO {} ({})
        SELECT {}
        FROM {};
      ]], {
        i(1, "target_table"),
        i(2, "columns"),
        i(3, "columns"),
        i(4, "source_table")
      })),

      -- Update
      s("update", fmt([[
        UPDATE {}
        SET {} = {}
        WHERE {};
      ]], {
        i(1, "table_name"),
        i(2, "column"),
        i(3, "value"),
        i(4, "condition")
      })),

      -- Delete
      s("delete", fmt([[
        DELETE FROM {}
        WHERE {};
      ]], {
        i(1, "table_name"),
        i(2, "condition")
      })),

      -- Table creation
      s("create", fmt([[
        CREATE TABLE {} (
            {} {}
        );
      ]], {
        i(1, "table_name"),
        i(2, "id"),
        i(3, "INTEGER PRIMARY KEY")
      })),

      s("createif", fmt([[
        CREATE TABLE IF NOT EXISTS {} (
            {} {}
        );
      ]], {
        i(1, "table_name"),
        i(2, "id"),
        i(3, "INTEGER PRIMARY KEY")
      })),

      -- Constraints
      s("primarykey", fmt("PRIMARY KEY ({})", {
        i(1, "id")
      })),

      s("foreignkey", fmt("FOREIGN KEY ({}) REFERENCES {}({})", {
        i(1, "column"),
        i(2, "referenced_table"),
        i(3, "id")
      })),

      s("unique", fmt("UNIQUE ({})", {
        i(1, "column")
      })),

      s("check", fmt("CHECK ({})", {
        i(1, "condition")
      })),

      -- Alter table
      s("addcolumn", fmt("ALTER TABLE {} ADD COLUMN {} {};", {
        i(1, "table_name"),
        i(2, "column"),
        i(3, "VARCHAR(255)")
      })),

      s("dropcolumn", fmt("ALTER TABLE {} DROP COLUMN {};", {
        i(1, "table_name"),
        i(2, "column")
      })),

      -- Common table expression
      s("cte", fmt([[
        WITH {} AS (
            SELECT {}
            FROM {}
            WHERE {}
        )
        SELECT *
        FROM {};
      ]], {
        i(1, "cte_name"),
        i(2, "*"),
        i(3, "table_name"),
        i(4, "condition"),
        i(5, "cte_name")
      })),

      -- Subquery
      s("subquery", fmt([[
        SELECT {}
        FROM {}
        WHERE {} IN (
            SELECT {}
            FROM {}
            WHERE {}
        );
      ]], {
        i(1, "*"),
        i(2, "table_name"),
        i(3, "id"),
        i(4, "id"),
        i(5, "other_table"),
        i(6, "condition")
      })),

      -- CASE expression
      s("case", fmt([[
        CASE
            WHEN {} THEN {}
            WHEN {} THEN {}
            ELSE {}
        END
      ]], {
        i(1, "condition1"),
        i(2, "result1"),
        i(3, "condition2"),
        i(4, "result2"),
        i(5, "default_result")
      })),

      -- Transactions
      s("transaction", fmt([[
        BEGIN;

        {}

        COMMIT;
      ]], {
        i(1, "-- SQL statements")
      })),

      s("rollback", t("ROLLBACK;")),

      -- Window functions
      s("rownumber", fmt([[
        ROW_NUMBER() OVER (
            PARTITION BY {}
            ORDER BY {}
        )
      ]], {
        i(1, "partition_column"),
        i(2, "sort_column")
      })),

      s("rank", fmt([[
        RANK() OVER (
            PARTITION BY {}
            ORDER BY {}
        )
      ]], {
        i(1, "partition_column"),
        i(2, "sort_column")
      })),

      s("over", fmt([[
        OVER (
            PARTITION BY {}
            ORDER BY {}
        )
      ]], {
        i(1, "partition_column"),
        i(2, "sort_column")
      })),

      -- Index
      s("index", fmt([[
        CREATE INDEX {}
        ON {} ({});
      ]], {
        i(1, "idx_name"),
        i(2, "table_name"),
        i(3, "column")
      })),

      -- View
      s("view", fmt([[
        CREATE VIEW {} AS
        SELECT {}
        FROM {};
      ]], {
        i(1, "view_name"),
        i(2, "*"),
        i(3, "table_name")
      })),

      -- Comments
      s("comment", fmt("-- {}", {
        i(1, "Comment")
      })),

      -- PostgreSQL upsert
      s("upsert", fmt([[
        INSERT INTO {} ({}, {})
        VALUES ({}, {})
        ON CONFLICT ({})
        DO UPDATE SET
            {} = EXCLUDED.{};
      ]], {
        i(1, "table_name"),
        i(2, "id"),
        i(3, "name"),
        i(4, "1"),
        i(5, "'Example'"),
        i(6, "id"),
        i(7, "name"),
        i(8, "name")
      })),

      -- PostgreSQL returning
      s("returning", fmt("RETURNING {};", {
        i(1, "*")
      })),
    }

    ls.add_snippets("sql", sql_snippets)
  '';
}

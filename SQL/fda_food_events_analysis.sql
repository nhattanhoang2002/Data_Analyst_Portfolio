--------------------------------------------------------------------------------
-- Query 1: Lấy 10 ngành có nhiều báo cáo nhất (không phân biệt loại outcome)
--------------------------------------------------------------------------------
/*
  1) Lấy tên ngành công nghiệp sản phẩm (products_industry_name)
  2) Đếm số lượng báo cáo (report_number) dưới dạng count_reports
  3) Gom nhóm theo products_industry_name (GROUP BY)
  4) Sắp xếp theo số lượng báo cáo giảm dần (ORDER BY ... DESC)
  5) Giới hạn 10 kết quả đầu tiên (LIMIT 10)
  Bảng dữ liệu: bigquery-public-data.fda_food.food_events
*/
SELECT
  products_industry_name,
  COUNT(report_number) AS count_reports
FROM
  `bigquery-public-data.fda_food.food_events`
GROUP BY
  products_industry_name
ORDER BY
  count_reports DESC
LIMIT 10;

--------------------------------------------------------------------------------
-- Query 2: Lấy 10 ngành có nhiều báo cáo nhất, nhưng chỉ tính các báo cáo "Hospitalization"
--------------------------------------------------------------------------------
/*
  1) Vẫn truy vấn từ bảng bigquery-public-data.fda_food.food_events
  2) Sử dụng subquery (truy vấn con) để tìm ra top 10 ngành có nhiều báo cáo nhất (tương tự Query 1)
  3) Chỉ lấy những bản ghi có outcomes chứa "Hospitalization" (AND outcomes LIKE '%Hospitalization%')
  4) Gom nhóm theo ngành (GROUP BY products_industry_name)
  5) Sắp xếp theo số lượng nhập viện (count_hospitalizations) giảm dần
*/
SELECT
  products_industry_name,
  COUNT(report_number) AS count_hospitalizations
FROM
  `bigquery-public-data.fda_food.food_events`
WHERE
  products_industry_name IN (
    SELECT
      products_industry_name
    FROM
      `bigquery-public-data.fda_food.food_events`
    GROUP BY
      products_industry_name
    ORDER BY
      COUNT(report_number) DESC
    LIMIT 10
  )
  AND outcomes LIKE '%Hospitalization%'
GROUP BY
  products_industry_name
ORDER BY
  count_hospitalizations DESC;

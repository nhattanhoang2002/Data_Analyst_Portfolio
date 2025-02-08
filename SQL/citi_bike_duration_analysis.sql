--------------------------------------------------------------------------------
-- Query 1: Lấy trung bình thời gian chuyến đi (tripduration) cho mỗi trạm,
--          và sắp xếp theo thứ tự giảm dần của thời gian trung bình.
--------------------------------------------------------------------------------
/*
  Bảng: bigquery-public-data.new_york_citibike.citibike_trips
  start_station_id  : Mã trạm xuất phát
  tripduration      : Thời gian chuyến đi (tính bằng giây)

  Mục đích:
  - Gom nhóm (GROUP BY) theo start_station_id.
  - Tính trung bình tripduration (AVG(tripduration)) để lấy avg_duration.
  - Sắp xếp (ORDER BY) theo avg_duration DESC (cao đến thấp).
*/
SELECT
    subquery.start_station_id,
    subquery.avg_duration
FROM
    (
        SELECT
            start_station_id,
            AVG(tripduration) AS avg_duration
        FROM bigquery-public-data.new_york_citibike.citibike_trips
        GROUP BY
            start_station_id
    ) AS subquery
ORDER BY
    subquery.avg_duration DESC;


--------------------------------------------------------------------------------
-- Query 2: Tính trung bình thời gian chuyến đi cho mỗi trạm (subquery),
--          rồi lấy chênh lệch (difference_from_avg) giữa chuyến đi cụ thể
--          và giá trị trung bình của trạm đó. Lấy TOP 25 chuyến đi có
--          chênh lệch cao nhất.
--------------------------------------------------------------------------------
/*
  Bảng: bigquery-public-data.new_york_citibike.citibike_trips
  starttime         : Thời gian bắt đầu chuyến đi
  start_station_id  : Mã trạm xuất phát
  tripduration      : Thời gian chuyến đi (giây)

  Mục đích:
  - Lấy chi tiết từng chuyến đi (starttime, start_station_id, tripduration).
  - Subquery tính trung bình tripduration theo start_station_id.
  - Tính chênh lệch giữa tripduration và giá trị trung bình của cùng trạm.
  - Sắp xếp theo chênh lệch giảm dần (difference_from_avg DESC).
  - Giới hạn kết quả 25 bản ghi.
*/
SELECT
  outer_trips.starttime,
  outer_trips.start_station_id,
  outer_trips.tripduration,
  (
    SELECT
      ROUND(AVG(tripduration), 2)
    FROM bigquery-public-data.new_york_citibike.citibike_trips
    WHERE start_station_id = outer_trips.start_station_id
  ) AS avg_duration_for_station,
  ROUND(
    outer_trips.tripduration
    - (
      SELECT
        AVG(tripduration)
      FROM bigquery-public-data.new_york_citibike.citibike_trips
      WHERE start_station_id = outer_trips.start_station_id
    ),
    2
  ) AS difference_from_avg
FROM bigquery-public-data.new_york_citibike.citibike_trips AS outer_trips
ORDER BY
  difference_from_avg DESC
LIMIT 25;

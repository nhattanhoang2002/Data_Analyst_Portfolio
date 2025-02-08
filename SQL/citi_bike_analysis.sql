--------------------------------------------------------------------------------
-- Query 1: Tính trung bình số xe đạp cho mỗi trạm, hiển thị thêm giá trị trung bình toàn cục
--------------------------------------------------------------------------------
/*
  Mục đích:
  - Lấy cột station_id (mã trạm) và num_bikes_available (số xe đạp sẵn có).
  - Tính giá trị trung bình của num_bikes_available (AVG) trên toàn bộ bảng.
  - So sánh mỗi trạm với giá trị trung bình (avg_num_bikes_available).
  Bảng dữ liệu: bigquery-public-data.new_york.citibike_stations
*/
SELECT
    station_id,
    num_bikes_available,
    (
        SELECT AVG(num_bikes_available)
        FROM bigquery-public-data.new_york.citibike_stations
    ) AS avg_num_bikes_available
FROM bigquery-public-data.new_york.citibike_stations;


--------------------------------------------------------------------------------
-- Query 2: Tính số lượng chuyến đi bắt đầu từ mỗi trạm, kèm theo tên trạm
--          và sắp xếp theo thứ tự giảm dần của số lượng chuyến đi
--------------------------------------------------------------------------------
/*
  Mục đích:
  1) Tạo bảng tạm tính số chuyến đi (number_of_rides) theo start_station_id
  2) Kết nối (JOIN) với bảng citibike_stations để lấy tên trạm (name)
  3) Sắp xếp (ORDER BY) giảm dần theo number_of_rides
  Bảng dữ liệu:
    - bigquery-public-data.new_york.citibike_trips   (chứa thông tin chuyến đi)
    - bigquery-public-data.new_york.citibike_stations (chứa thông tin trạm)
*/

-- Truy vấn 2A: (có thể dùng dạng con để JOIN luôn, thay vì tạo bảng tạm)
-- Đếm số chuyến đi bắt đầu từ mỗi trạm (start_station_id)
-- Rồi nối với thông tin trạm để lấy station_id, name, v.v.
SELECT
    station_id,
    name,
    station_num_trips.number_of_rides AS number_of_rides_starting_at_station
FROM
(
    SELECT
        CAST(start_station_id AS STRING) AS start_station_id_str,
        COUNT(*) AS number_of_rides
    FROM bigquery-public-data.new_york.citibike_trips
    GROUP BY
        CAST(start_station_id AS STRING)
) AS station_num_trips
INNER JOIN bigquery-public-data.new_york.citibike_stations
    ON station_num_trips.start_station_id_str = station_id
ORDER BY
    station_num_trips.number_of_rides DESC;


--------------------------------------------------------------------------------
-- Query 3: Lọc danh sách trạm Citi Bike nơi có ít nhất một chuyến đi
--          của người dùng loại "Subscriber"
--------------------------------------------------------------------------------
/*
  Mục đích:
  - Lấy mã trạm (station_id) và tên trạm (name) từ bảng citibike_stations
  - Chỉ những trạm nào xuất hiện trong các chuyến đi của "Subscriber" (usertype = 'Subscriber')
  - Dùng subquery để lấy danh sách start_station_id nơi usertype = 'Subscriber'
  - Bảng dữ liệu:
      + bigquery-public-data.new_york.citibike_stations
      + bigquery-public-data.new_york.citibike_trips
*/
SELECT
    station_id,
    name
FROM
    bigquery-public-data.new_york.citibike_stations
WHERE
    station_id IN
    (
        SELECT
            CAST(start_station_id AS STRING) AS start_station_id_str
        FROM
            bigquery-public-data.new_york.citibike_trips
        WHERE
            usertype = 'Subscriber'
    );

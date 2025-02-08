--------------------------------------------------------------------------------
-- MỤC ĐÍCH:
-- 1. Kết hợp hai bảng 'warehouse' và 'orders' qua cột warehouse_id.
-- 2. Tính số lượng đơn hàng mỗi kho (number_of_orders).
-- 3. Tính tổng số đơn hàng trong toàn bộ hệ thống (total_orders) bằng subquery.
-- 4. Áp dụng CASE để phân loại kho theo % số đơn hàng mà kho đó đã xử lý:
--    - 0-20%
--    - 21-60%
--    - hơn 60%
-- 5. Lọc chỉ những kho có ít nhất 1 đơn hàng (HAVING COUNT(Orders.order_id) > 0).
--------------------------------------------------------------------------------

/*
  BẢNG DỮ LIỆU:
    - `tans-project-440309.warehouse_orders.warehouse` (chứa thông tin kho)
      + Các cột quan trọng:
        warehouse_id   : Mã định danh của kho
        state          : Trạng thái/khu vực của kho
        warehouse_alias: Bí danh (tên rút gọn) của kho
    - `tans-project-440309.warehouse_orders.orders` (chứa thông tin đơn hàng)
      + Các cột quan trọng:
        order_id       : Mã đơn hàng
        warehouse_id   : Kho thực hiện đơn hàng

  CÁC BƯỚC THỰC HIỆN:
    1) SELECT các cột:
       - warehouse_id
       - CONCAT(Warehouse.state, ': ', Warehouse.warehouse_alias) -> để tạo tên kho
       - COUNT(Orders.order_id) là số đơn hàng của mỗi kho
       - Subquery: Lấy COUNT(*) tổng số đơn hàng toàn bộ (AS total_orders)
    2) CASE để phân loại:
       - <= 20%  -> 'Fulfilled 0-20% of Orders'
       - > 20% và <= 60% -> 'Fulfilled 21-60% of Orders'
       - còn lại -> 'Fulfilled more than 60% of Orders'
    3) LEFT JOIN bảng warehouse và orders qua warehouse_id
    4) GROUP BY kho (warehouse_id) và kho_name (CONCAT(...))
    5) HAVING COUNT(Orders.order_id) > 0 để lọc các kho không có đơn hàng
*/

SELECT
  Warehouse.warehouse_id,
  CONCAT(Warehouse.state, ': ', Warehouse.warehouse_alias) AS warehouse_name,
  COUNT(Orders.order_id) AS number_of_orders,
  (
    SELECT COUNT(*) 
    FROM `tans-project-440309.warehouse_orders.orders`
  ) AS total_orders,
  CASE
    WHEN COUNT(Orders.order_id) 
         / (SELECT COUNT(*) FROM `tans-project-440309.warehouse_orders.orders`) <= 0.20
      THEN 'Fulfilled 0-20% of Orders'
    WHEN COUNT(Orders.order_id) 
         / (SELECT COUNT(*) FROM `tans-project-440309.warehouse_orders.orders`) > 0.20
         AND COUNT(Orders.order_id) 
             / (SELECT COUNT(*) FROM `tans-project-440309.warehouse_orders.orders`) <= 0.60
      THEN 'Fulfilled 21-60% of Orders'
    ELSE 'Fulfilled more than 60% of Orders'
  END AS fulfillment_summary
FROM `tans-project-440309.warehouse_orders.warehouse` AS Warehouse
LEFT JOIN `tans-project-440309.warehouse_orders.orders` AS Orders
  ON Orders.warehouse_id = Warehouse.warehouse_id
GROUP BY
  Warehouse.warehouse_id,
  warehouse_name
HAVING
  COUNT(Orders.order_id) > 0;

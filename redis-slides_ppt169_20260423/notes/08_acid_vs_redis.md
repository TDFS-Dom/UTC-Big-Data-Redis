[Chuyển tiếp] So sánh ACID giữa RDBMS và Redis. RDBMS đảm bảo đầy đủ cả 4 tính chất. Redis hỗ trợ một phần — Atomicity qua MULTI/EXEC, Isolation tự nhiên nhờ single-threaded, Durability tùy chọn RDB/AOF. Redis theo mô hình BASE thay vì ACID.
Yếu điểm: ① RDBMS = full ACID ② Redis = partial ACID ③ Redis dùng BASE
Thời lượng: 3 phút
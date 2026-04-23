# 01_trang_bia
Chào mừng các bạn đến với bài giảng về Redis và NoSQL Database. Hôm nay chúng ta sẽ tìm hiểu lý thuyết nền tảng về NoSQL từ Chương 3, sau đó thực hành trực tiếp với Redis.
Yếu điểm: ① Giới thiệu bài giảng ② Mục tiêu buổi học
Thời lượng: 1 phút

---

# 02_muc_luc
[Chuyển tiếp] Trước tiên, hãy xem tổng quan nội dung hôm nay. Bài giảng gồm 4 phần chính: lý thuyết NoSQL cơ bản, lý thuyết nâng cao, cài đặt phần mềm Redis, và demo thực hành.
Yếu điểm: ① 4 phần nội dung ② Thời lượng khoảng 60 phút
Thời lượng: 1 phút

---

# 03_gioi_thieu_nosql
[Chuyển tiếp] Bắt đầu với phần 1 — NoSQL là gì? NoSQL không phải "No SQL" mà là "Not Only SQL". Đây là một lớp CSDL không theo mô hình quan hệ, thiết kế cho dữ liệu lớn và đa dạng. Có 4 loại chính, và Redis thuộc loại Key-Value Store — đơn giản nhất nhưng hiệu quả nhất.
Yếu điểm: ① NoSQL = Not Only SQL ② 4 loại: Key-Value, Column, Document, Graph ③ Redis = Key-Value + CP
Thời lượng: 3 phút

---

# 04_tai_sao_nosql
[Chuyển tiếp] Vậy tại sao cần NoSQL? Hãy xem hạn chế của RDBMS truyền thống bên trái — chỉ xử lý dữ liệu có cấu trúc, mở rộng đắt đỏ, schema cứng nhắc. Bên phải là ưu điểm của NoSQL và đặc biệt là Redis — tốc độ cực nhanh do lưu trên RAM, độ trễ micro giây.
Yếu điểm: ① Hạn chế RDBMS ② Ưu điểm NoSQL ③ Lý do chọn Redis
Thời lượng: 3 phút

---

# 05_cap_theorem
[Chuyển tiếp] Bây giờ đến phần quan trọng — Định lý CAP. Do Eric Brewer đề xuất, định lý nói rằng một hệ phân tán chỉ có thể đạt 2 trong 3 tính chất: Consistency, Availability, và Partition Tolerance. Redis thuộc nhóm CP — ưu tiên nhất quán và chịu lỗi phân vùng.
Yếu điểm: ① C, A, P là gì ② Chỉ đạt 2/3 ③ Redis = CP
Thời lượng: 4 phút

---

# 06_cap_phan_loai
[Chuyển tiếp] Hãy xem cụ thể hơn — database nào thuộc nhóm nào. CA gồm các RDBMS truyền thống. CP có Redis, MongoDB, HBase. AP có Cassandra, DynamoDB — ưu tiên khả dụng. Lưu ý Redis được đánh dấu đỏ ở nhóm CP.
Yếu điểm: ① CA = RDBMS ② CP = Redis, MongoDB ③ AP = Cassandra
Thời lượng: 2 phút

---

# 07_acid
[Chuyển tiếp] Tiếp theo là ACID — 4 tính chất đảm bảo giao dịch tin cậy. Atomicity — tất cả hoặc không. Consistency — luôn nhất quán. Isolation — cô lập giữa các giao dịch. Durability — bền vững sau commit.
Yếu điểm: ① A-C-I-D giải thích ② Ví dụ cho mỗi tính chất
Thời lượng: 3 phút

---

# 08_acid_vs_redis
[Chuyển tiếp] So sánh ACID giữa RDBMS và Redis. RDBMS đảm bảo đầy đủ cả 4 tính chất. Redis hỗ trợ một phần — Atomicity qua MULTI/EXEC, Isolation tự nhiên nhờ single-threaded, Durability tùy chọn RDB/AOF. Redis theo mô hình BASE thay vì ACID.
Yếu điểm: ① RDBMS = full ACID ② Redis = partial ACID ③ Redis dùng BASE
Thời lượng: 3 phút

---

# 09_base
[Chuyển tiếp] Và đây là BASE — mô hình đối lập với ACID. BA = Basically Available — luôn sẵn sàng. S = Soft State — dữ liệu có thể chưa đồng bộ ngay. E = Eventual Consistency — cuối cùng sẽ nhất quán. Mỗi tính chất đều có ví dụ cụ thể với Redis.
Yếu điểm: ① BA, S, E giải thích ② Ví dụ Redis cho mỗi tính chất
Thời lượng: 3 phút

---

# 10_acid_vs_base
[Chuyển tiếp] So sánh trực tiếp ACID và BASE. ACID nhất quán ngay, bi quan, cứng nhắc, mở rộng dọc. BASE eventual consistency, lạc quan, linh hoạt, mở rộng ngang. Mỗi mô hình phù hợp cho các bài toán khác nhau.
Yếu điểm: ① 5 điểm so sánh ② Khi nào dùng ACID vs BASE
Thời lượng: 2 phút

---

# 11_nosql_vs_rdbms
[Chuyển tiếp] Bảng so sánh chi tiết NoSQL vs RDBMS theo 7 tiêu chí. Đây là kiến thức nền tảng quan trọng — hãy ghi nhớ sự khác biệt về cấu trúc, transaction, và khả năng mở rộng.
Yếu điểm: ① 7 tiêu chí so sánh ② Điểm mạnh mỗi bên
Thời lượng: 2 phút

---

# 12_cac_loai_nosql
[Chuyển tiếp] 4 loại NoSQL — Key-Value (Redis), Column-Store (Cassandra), Document (MongoDB), Graph (Neo4J). Mỗi loại phù hợp cho bài toán khác nhau. Redis là Key-Value — đơn giản nhất, nhanh nhất, đa dụng nhất.
Yếu điểm: ① 4 loại NoSQL ② Redis = Key-Value Store ③ Ứng dụng mỗi loại
Thời lượng: 3 phút

---

# 13_redis_vs_rdbms
[Chuyển tiếp] Khi nào dùng Redis, khi nào dùng RDBMS? Redis phù hợp cho cache, session, real-time, ranking. RDBMS phù hợp cho giao dịch tài chính, dữ liệu quan hệ phức tạp, kiểm toán.
Yếu điểm: ① 6 trường hợp dùng Redis ② 5 trường hợp dùng RDBMS
Thời lượng: 2 phút

---

# 14_cai_dat_docker
[Chuyển tiếp] Sang phần 3 — Cài đặt Redis. Cách đơn giản nhất là dùng Docker. 3 bước: cài Docker Desktop, pull và run Redis container, kết nối bằng redis-cli. Khi thấy PONG là thành công.
Yếu điểm: ① 3 bước cài đặt ② docker run command ③ PING → PONG
Thời lượng: 3 phút

---

# 15_cai_dat_nen_tang
[Chuyển tiếp] Ngoài Docker, các bạn có thể cài trực tiếp trên WSL2, macOS bằng Homebrew, hoặc Linux bằng apt. Lệnh đều đơn giản.
Yếu điểm: ① WSL2 cho Windows ② Homebrew cho macOS ③ apt cho Linux
Thời lượng: 2 phút

---

# 16_gui_tools
[Chuyển tiếp] Để làm việc dễ dàng hơn, dùng GUI tools. RedisInsight là công cụ chính thức miễn phí. Bên phải là cấu hình redis.conf — port, mật khẩu, giới hạn RAM, persistence.
Yếu điểm: ① RedisInsight ② redis.conf cấu hình quan trọng
Thời lượng: 2 phút

---

# 17_kieu_du_lieu
[Chuyển tiếp] Bây giờ sang phần demo! Redis hỗ trợ 5 kiểu dữ liệu chính: String, Hash, List, Set, và Sorted Set. Mỗi kiểu phù hợp cho bài toán khác nhau.
Yếu điểm: ① 5 kiểu dữ liệu ② Ứng dụng mỗi kiểu ③ Lệnh chính
Thời lượng: 2 phút

---

# 18_demo_string
[Chuyển tiếp] Demo String — kiểu cơ bản nhất. SET/GET để lưu và đọc. EX để đặt thời gian hết hạn. INCR/DECRBY để tăng giảm số. MSET/MGET để thao tác nhiều key cùng lúc.
Yếu điểm: ① SET/GET cơ bản ② TTL hết hạn ③ INCR đếm ④ MSET/MGET
Thời lượng: 3 phút

---

# 19_demo_hash
[Chuyển tiếp] Demo Hash — lưu trữ object tương tự row trong RDBMS. HSET tạo nhiều field cùng lúc. HGETALL lấy tất cả. HINCRBY tăng giá trị số trong field. Rất hữu ích cho user profile, product info.
Yếu điểm: ① HSET/HGET/HGETALL ② So sánh với RDBMS row ③ HINCRBY
Thời lượng: 3 phút

---

# 20_demo_list
[Chuyển tiếp] Demo List — danh sách có thứ tự. LPUSH thêm đầu, RPUSH thêm cuối. LPOP/RPOP lấy và xóa. Ứng dụng quan trọng nhất là Message Queue — Producer RPUSH, Consumer LPOP.
Yếu điểm: ① LPUSH/RPUSH ② LPOP/RPOP ③ Message Queue FIFO
Thời lượng: 3 phút

---

# 21_demo_set_zset
[Chuyển tiếp] Set không trùng lặp — dùng cho tags, unique visitors. Phép toán SINTER (giao), SUNION (hợp), SDIFF (hiệu). Sorted Set thêm điểm số — hoàn hảo cho leaderboard, bảng xếp hạng.
Yếu điểm: ① Set và phép toán tập hợp ② Sorted Set cho ranking ③ ZREVRANGE top N
Thời lượng: 3 phút

---

# 22_pubsub_transaction
[Chuyển tiếp] Pub/Sub — messaging real-time giữa publisher và subscriber. Transaction MULTI/EXEC — nhóm lệnh thực thi atomic, giống chuyển tiền từ A sang B.
Yếu điểm: ① Pub/Sub messaging ② MULTI/EXEC transaction ③ Atomic execution
Thời lượng: 3 phút

---

# 23_use_cases
[Chuyển tiếp] 3 ứng dụng thực tế phổ biến nhất. Session Store — lưu session với TTL. Rate Limiting — giới hạn request bằng INCR + EXPIRE. Cache Query — giảm tải database bằng cache.
Yếu điểm: ① Session Store ② Rate Limiting ③ Cache Query
Thời lượng: 3 phút

---

# 24_tong_ket_lenh
[Chuyển tiếp] Bảng tổng kết tất cả lệnh Redis quan trọng — 9 nhóm, hơn 40 lệnh. Đây là tài liệu tham khảo nhanh khi làm việc với Redis.
Yếu điểm: ① 9 nhóm lệnh ② Lệnh chính mỗi nhóm ③ Chức năng
Thời lượng: 2 phút

---

# 25_ket_thuc
[Chuyển tiếp] Cuối cùng là câu hỏi ôn tập. 7 câu hỏi bao phủ toàn bộ nội dung hôm nay. Cảm ơn các bạn đã tham gia buổi học!
Yếu điểm: ① 7 câu hỏi ôn tập ② Q&A
Thời lượng: 2 phút

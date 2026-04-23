# REDIS - Tổng Hợp Nội Dung

---

# PHẦN 1: LÝ THUYẾT 3.1 - 3.4

---

## 3.1 Giới thiệu NoSQL (Introduction to NoSQL)

### NoSQL là gì?
- NoSQL (Not Only SQL) là một lớp các hệ quản trị CSDL **không theo mô hình quan hệ** (non-relational)
- Được thiết kế để lưu trữ và truy xuất dữ liệu bán cấu trúc (semi-structured) và phi cấu trúc (unstructured)
- Hỗ trợ **khả năng mở rộng ngang** (horizontal scalability), **schema linh hoạt**, **độ tin cậy cao** và **chịu lỗi tốt**

### Các loại NoSQL Database:
| Loại | Mô tả | Ví dụ |
|------|-------|-------|
| Key-Value Store | Lưu trữ cặp key-value đơn giản | **Redis**, Riak, DynamoDB, Memcached |
| Column-Store | Lưu trữ theo cột thay vì hàng | Cassandra, HBase |
| Document Database | Lưu trữ document (JSON/XML) | MongoDB, CouchDB |
| Graph Database | Lưu trữ node và relationship | Neo4J, InfiniteGraph |

### Redis thuộc loại nào?
- **Redis = Key-Value Store Database**
- Redis thuộc nhóm **CP** trong CAP Theorem (Consistency + Partition Tolerance)

---

## 3.2 Tại sao cần NoSQL? (Why NoSQL)

### Hạn chế của RDBMS truyền thống:
- Chỉ hỗ trợ dữ liệu **có cấu trúc** (structured data) với bảng, cột cố định
- Khó khăn khi xử lý dữ liệu **phi cấu trúc** và **bán cấu trúc**
- **Mở rộng dọc** (vertical scaling) đắt đỏ và có giới hạn
- Không phù hợp với dữ liệu lớn, đa dạng của thời đại Big Data

### Ưu điểm của NoSQL:
- Hỗ trợ dữ liệu **có cấu trúc, bán cấu trúc, phi cấu trúc**
- **Mở rộng ngang** trên phần cứng rẻ tiền (commodity hardware)
- **Schemaless** - không cần định nghĩa schema trước
- Dễ dàng tích hợp dữ liệu từ nhiều nguồn khác nhau
- Phù hợp với ứng dụng Big Data và real-time

### Tại sao chọn Redis?
- **Tốc độ cực nhanh**: Lưu trữ toàn bộ dữ liệu trên RAM (in-memory)
- **Độ trễ thấp**: Đọc/ghi dữ liệu trong micro giây
- **Đa dụng**: Caching, session store, message broker, real-time analytics
- Hỗ trợ nhiều kiểu dữ liệu phong phú (String, Hash, List, Set, Sorted Set...)

---

## 3.3 Định lý CAP (CAP Theorem)

### CAP Theorem là gì?
Do Eric Brewer đề xuất, CAP là viết tắt của 3 tính chất:

### C - Consistency (Tính nhất quán)
- Mọi thao tác đọc đều trả về kết quả giống nhau trên tất cả các node
- Ví dụ: 3 user đọc cùng 1 dữ liệu trên 3 node khác nhau -> kết quả giống nhau

### A - Availability (Tính khả dụng)
- Mọi yêu cầu đọc/ghi đều nhận được phản hồi (thành công hoặc thất bại)
- Hệ thống luôn sẵn sàng phục vụ dù có node bị lỗi

### P - Partition Tolerance (Chịu lỗi phân vùng)
- Hệ thống vẫn hoạt động khi mạng bị chia cắt (network partition)
- Các node không thể giao tiếp với nhau nhưng vẫn phục vụ client

### Quy tắc: Chỉ có thể đạt 2 trong 3 tính chất

```
        Consistency
          /    \
        CA      CP
        /        \
Availability --- Partition Tolerance
        \        /
         AP
```

| Loại | Mô tả | Ví dụ |
|------|-------|-------|
| **CA** | Consistency + Availability | RDBMS (MySQL, PostgreSQL) |
| **CP** | Consistency + Partition Tolerance | **Redis**, HBase, MongoDB, BigTable |
| **AP** | Availability + Partition Tolerance | Cassandra, DynamoDB, Riak, CouchDB |

### Redis trong CAP Theorem:
- Redis thuộc nhóm **CP (Consistency + Partition Tolerance)**
- Ưu tiên **tính nhất quán** của dữ liệu
- Chấp nhận hy sinh một phần **tính khả dụng** khi có network partition

---

## 3.4 ACID Properties

### ACID là gì?
ACID là tập hợp các tính chất đảm bảo độ tin cậy của giao dịch (transaction) trong CSDL:

### A - Atomicity (Tính nguyên tử)
- Giao dịch là một đơn vị nguyên tử: **tất cả thực hiện hoặc không thực hiện gì cả**
- Không có trạng thái trung gian
- Nếu giao dịch thất bại, hệ thống rollback về trạng thái trước đó

### C - Consistency (Tính nhất quán)
- CSDL luôn ở trạng thái nhất quán trước và sau giao dịch
- Ví dụ: cập nhật cột float bằng giá trị varchar -> bị từ chối

### I - Isolation (Tính cô lập)
- Các giao dịch đồng thời không ảnh hưởng lẫn nhau
- 2 user cập nhật cùng 1 bản ghi -> làm việc độc lập, không ghi đè

### D - Durability (Tính bền vững)
- Khi giao dịch thành công, dữ liệu được lưu vĩnh viễn
- Dù hệ thống crash, dữ liệu vẫn được bảo toàn (ghi vào disk)

### So sánh ACID giữa RDBMS và Redis:
| Tính chất | RDBMS | Redis |
|-----------|-------|-------|
| Atomicity | Đầy đủ | Hỗ trợ qua MULTI/EXEC (transaction) |
| Consistency | Đầy đủ | Tùy cấu hình (RDB/AOF persistence) |
| Isolation | Đầy đủ | Đơn luồng (single-threaded) -> tự nhiên cô lập |
| Durability | Đầy đủ | Tùy chọn: RDB snapshot, AOF log |

**Lưu ý**: Redis là NoSQL nên **không đảm bảo đầy đủ ACID** như RDBMS. Thay vào đó, Redis theo mô hình **BASE** (phần 3.5).

### Câu hỏi ôn tập phần 3.1-3.4:
1. NoSQL database là gì? Kể tên 4 loại NoSQL database.
2. Redis thuộc loại NoSQL nào?
3. Trình bày 3 tính chất của định lý CAP. Redis thuộc nhóm nào?
4. So sánh ACID giữa RDBMS và Redis.
5. Tại sao NoSQL phù hợp với Big Data hơn RDBMS?

---
---

# PHẦN 2: LÝ THUYẾT 3.5 - 3.8

---

## 3.5 BASE Properties

### BASE là gì?
BASE là mô hình thiết kế CSDL dựa trên định lý CAP, đối lập với ACID. Các NoSQL database (bao gồm Redis) tuân theo BASE.

### B.A - Basically Available (Cơ bản khả dụng)
- Hệ thống **luôn sẵn sàng** phục vụ dù có lỗi xảy ra
- Dữ liệu có thể **không nhất quán** tạm thời nhưng hệ thống vẫn hoạt động
- Redis: Khi master node bị lỗi, Redis Sentinel tự động chuyển sang replica

### S - Soft State (Trạng thái mềm)
- Dữ liệu có thể **thay đổi theo thời gian** mà không cần tác động từ bên ngoài
- Các node có thể chưa đồng bộ dữ liệu ngay lập tức
- Ví dụ: User đọc dữ liệu từ node B trước khi node A đồng bộ xong -> nhận dữ liệu cũ (stale data)
- Redis: Khi dùng Redis Cluster, có thể có độ trễ nhỏ khi đồng bộ giữa các node

### E - Eventual Consistency (Nhất quán cuối cùng)
- Dữ liệu **sẽ nhất quán** sau một khoảng thời gian
- Không đảm bảo nhất quán ngay lập tức nhưng đảm bảo **cuối cùng sẽ nhất quán**
- Redis: Replication là **asynchronous** -> replica có thể chưa có dữ liệu mới nhất

### So sánh ACID vs BASE:
| ACID (RDBMS) | BASE (NoSQL/Redis) |
|---|---|
| Consistency ngay lập tức | Eventual consistency |
| Ưu tiên tính đúng đắn | Ưu tiên tính khả dụng |
| Bi quan (pessimistic) | Lạc quan (optimistic) |
| Phức tạp, cứng nhắc | Đơn giản, linh hoạt |
| Mở rộng dọc (vertical) | Mở rộng ngang (horizontal) |

---

## 3.6 Schemaless Databases (CSDL không có schema)

### Schema là gì?
- Schema là cấu trúc định nghĩa trước: tên bảng, tên cột, kiểu dữ liệu
- RDBMS **bắt buộc** phải có schema trước khi lưu dữ liệu

### Schemaless là gì?
- **Không cần định nghĩa cấu trúc trước** khi lưu dữ liệu
- Mỗi bản ghi có thể có các trường (field) khác nhau
- Dễ dàng thay đổi cấu trúc dữ liệu mà không cần ALTER TABLE

### Redis là Schemaless:
- Redis lưu dữ liệu dạng **key-value** -> không có schema
- Mỗi key có thể chứa **bất kỳ kiểu dữ liệu nào**: String, Hash, List, Set, Sorted Set
- Không cần định nghĩa trước cấu trúc
- Thêm/xóa trường bất kỳ lúc nào

### Ví dụ so sánh:

**RDBMS (có schema):**
```sql
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);
-- Mỗi bản ghi PHẢI có đúng 3 cột: id, name, age
```

**Redis (schemaless):**
```
SET student:1 "John"
HSET student:2 name "Mary" age 22 major "IT"
HSET student:3 name "Tom" gpa 3.5
-- Mỗi key có thể có các trường KHÁC NHAU
```

---

## 3.7 NoSQL (Not Only SQL)

### 3.7.1 NoSQL vs RDBMS

| Tiêu chí | RDBMS | NoSQL (Redis) |
|----------|-------|---------------|
| Cấu trúc dữ liệu | Rigid schema (bảng, cột) | Flexible (key-value, document...) |
| ETL | Bắt buộc | Không bắt buộc |
| Lưu trữ | Hàng và cột | Key-Value, Document, Column, Graph |
| Transaction | ACID | BASE |
| Mở rộng | Vertical (máy mạnh hơn) | Horizontal (thêm máy rẻ tiền) |
| Ngôn ngữ truy vấn | SQL | Các lệnh riêng (Redis commands) |
| Trạng thái | Mature (ổn định) | Incubation (phát triển nhanh) |

### 3.7.2 Đặc điểm của NoSQL
- **Schemaless**: Không cần định nghĩa schema trước
- **Horizontal scalability**: Mở rộng bằng cách thêm node (sharding + replication)
- **Distributed computing**: Dữ liệu phân tán trên nhiều node
- **Lower cost**: Chạy trên phần cứng rẻ tiền
- **Non-relational**: Không có quan hệ giữa các bảng
- **Xử lý dữ liệu lớn**: Hàng tỷ bản ghi, PB dữ liệu

### 3.7.3 Các loại NoSQL - Redis là Key-Value Store

#### 1. Key-Value Store Database (Redis thuộc loại này)
- **Đơn giản nhất** và **hiệu quả nhất**
- Dữ liệu gồm 2 phần: **Key** (khóa) và **Value** (giá trị)
- Tương tự **Hash Table** trong lập trình
- Truy xuất dữ liệu qua key (như index)
- **Không có foreign key, không có join**
- Ứng dụng: Cache, session store, shopping cart, game leaderboard

```
Key          ->  Value
-----------      ----------
employee:id  ->  334332
employee:name -> Joe
employee:salary -> $3000
employee:dob -> 10-10-1985
```

**Các Key-Value Store phổ biến:** Redis, Amazon DynamoDB, Riak, Memcached, Berkeley DB

#### 2. Column-Store Database
- Lưu dữ liệu theo **cột** thay vì hàng
- Phù hợp cho OLAP (phân tích)
- Ví dụ: Cassandra, HBase

#### 3. Document Database
- Lưu dữ liệu dạng **document** (JSON, XML, YAML)
- Truy vấn linh hoạt bằng nhiều key
- Ví dụ: MongoDB, CouchDB

#### 4. Graph Database
- Lưu **node** (thực thể) và **edge** (quan hệ)
- Phù hợp cho mạng xã hội, recommendation
- Ví dụ: Neo4J, InfiniteGraph

### 3.7.4 CRUD Operations trong NoSQL
- **C**reate: Tạo dữ liệu mới
- **R**ead: Đọc dữ liệu
- **U**pdate: Cập nhật dữ liệu
- **D**elete: Xóa dữ liệu

---

## 3.8 Chuyển đổi từ RDBMS sang NoSQL

### Tại sao cần chuyển đổi?
Hạn chế của RDBMS truyền thống:
- Schema phải biết trước và cố định
- Cấu trúc cứng nhắc (mỗi bản ghi phải giống nhau)
- Mở rộng đắt đỏ
- Schema cố định khó thích ứng với ứng dụng thay đổi nhanh
- Thay đổi schema tốn kém

### Ưu điểm của NoSQL (Redis) khi chuyển đổi:
- **Open-source** và **distributed** (phân tán)
- **High scalability** (khả năng mở rộng cao)
- Xử lý dữ liệu **có cấu trúc, bán cấu trúc, phi cấu trúc**
- **Flexible schema** (schema linh hoạt)
- **Không có quan hệ phức tạp** (no complex relationships)

### Khi nào nên dùng Redis thay vì RDBMS?
| Nên dùng Redis | Nên dùng RDBMS |
|---|---|
| Caching dữ liệu | Giao dịch tài chính (ACID) |
| Session management | Dữ liệu có quan hệ phức tạp |
| Real-time analytics | Báo cáo phức tạp với JOIN |
| Message queue/Pub-Sub | Dữ liệu cần schema chắc chắn |
| Leaderboard/Ranking | Kiểm toán và audit trail |
| Rate limiting | Dữ liệu cần nhất quán tuyệt đối |

### Câu hỏi ôn tập phần 3.5-3.8:
1. Trình bày 3 tính chất của BASE. So sánh ACID và BASE.
2. Schemaless database là gì? Redis có phải schemaless không?
3. So sánh RDBMS và NoSQL theo 5 tiêu chí.
4. Kể tên 4 loại NoSQL database và cho ví dụ.
5. Khi nào nên dùng Redis thay vì RDBMS? Cho 3 ví dụ cụ thể.

---
---

# PHẦN 3: CÀI ĐẶT PHẦN MỀM

---

## Giới thiệu Redis

- **Redis** = **RE**mote **DI**ctionary **S**erver
- Là hệ thống lưu trữ dữ liệu **in-memory** (trên RAM)
- Open-source, hiệu năng cao
- Hỗ trợ nhiều kiểu dữ liệu: String, Hash, List, Set, Sorted Set, Stream...
- Được dùng làm: **Cache**, **Database**, **Message Broker**

---

## Cài đặt Redis trên Windows

### Cách 1: Sử dụng Docker (Khuyến nghị)

**Bước 1**: Cài đặt Docker Desktop
- Tải từ: https://www.docker.com/products/docker-desktop/
- Cài đặt và khởi động Docker Desktop

**Bước 2**: Pull và chạy Redis container
```bash
# Pull Redis image
docker pull redis

# Chạy Redis container
docker run --name my-redis -p 6379:6379 -d redis

# Kiểm tra container đang chạy
docker ps
```

**Bước 3**: Kết nối vào Redis CLI
```bash
# Vào Redis CLI trong container
docker exec -it my-redis redis-cli

# Test kết nối
127.0.0.1:6379> PING
PONG
```

### Cách 2: Sử dụng WSL2 (Windows Subsystem for Linux)

**Bước 1**: Bật WSL2
```powershell
# Mở PowerShell với quyền Admin
wsl --install
# Khởi động lại máy tính
```

**Bước 2**: Cài Redis trong WSL
```bash
sudo apt update
sudo apt install redis-server -y
sudo service redis-server start
sudo service redis-server status
```

**Bước 3**: Kết nối
```bash
redis-cli
127.0.0.1:6379> PING
PONG
```

---

## Cài đặt Redis trên macOS

```bash
brew install redis
brew services start redis
redis-cli
127.0.0.1:6379> PING
PONG
```

---

## Cài đặt Redis trên Linux (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install redis-server -y
sudo systemctl start redis-server
sudo systemctl enable redis-server
redis-cli
127.0.0.1:6379> PING
PONG
```

---

## Cài đặt Redis GUI Tools

### RedisInsight (Khuyến nghị - Miễn phí)
- Tải từ: https://redis.io/insight/
- Công cụ chính thức của Redis
- Giao diện trực quan, hỗ trợ tất cả kiểu dữ liệu

**Cấu hình kết nối:** Host: `localhost`, Port: `6379`

### Another Redis Desktop Manager
- Tải từ: https://github.com/qishibo/AnotherRedisDesktopManager
- Miễn phí, hỗ trợ Windows, macOS, Linux

---

## Kiểm tra cài đặt thành công

```bash
redis-cli

127.0.0.1:6379> PING
PONG

127.0.0.1:6379> SET hello "world"
OK

127.0.0.1:6379> GET hello
"world"

127.0.0.1:6379> INFO server
# Hiển thị thông tin server Redis
```

---

## Cấu hình cơ bản Redis

File cấu hình: `redis.conf`

```conf
port 6379                      # Port mặc định
bind 127.0.0.1                 # Chỉ cho phép kết nối từ localhost
requirepass yourpassword       # Mật khẩu
maxmemory 256mb                # Giới hạn RAM
maxmemory-policy allkeys-lru   # Chính sách khi hết memory

# Persistence - RDB Snapshot
save 900 1      # Save sau 900 giây nếu có ít nhất 1 thay đổi
save 300 10     # Save sau 300 giây nếu có ít nhất 10 thay đổi
save 60 10000   # Save sau 60 giây nếu có ít nhất 10000 thay đổi

# Persistence - AOF (Append Only File)
appendonly yes
appendfsync everysec
```

---

## Các vấn đề thường gặp

| Vấn đề | Giải pháp |
|--------|-----------|
| `Connection refused` | Kiểm tra Redis đã khởi động chưa: `redis-server` |
| `DENIED Redis is loading` | Đợi Redis load xong dữ liệu từ disk |
| `OOM command not allowed` | Tăng `maxmemory` hoặc xóa dữ liệu cũ |
| Port 6379 bị chiếm | Đổi port trong `redis.conf` hoặc tắt process khác |
| Không kết nối từ xa | Sửa `bind 0.0.0.0` và `protected-mode no` trong config |

---
---

# PHẦN 4: DEMO HƯỚNG DẪN

---

## Kiểu dữ liệu trong Redis

| Kiểu | Mô tả | Ví dụ sử dụng |
|------|-------|--------------|
| **String** | Chuỗi, số, binary | Cache, counter, session |
| **Hash** | Tập hợp field-value (như object) | User profile, product info |
| **List** | Danh sách có thứ tự (linked list) | Message queue, timeline |
| **Set** | Tập hợp không trùng lặp, không thứ tự | Tags, unique visitors |
| **Sorted Set** | Tập hợp không trùng lặp, có điểm số | Leaderboard, ranking |

---

## Demo 1: String Commands

### SET và GET - Lệnh cơ bản nhất
```redis
SET name "Nguyen Van A"
OK

GET name
"Nguyen Van A"

# Lưu với thời gian hết hạn (10 giây)
SET session:user1 "token_abc123" EX 10

TTL session:user1
(integer) 8

# Đợi 10 giây rồi thử lại
GET session:user1
(nil)   # Đã hết hạn
```

### INCR / DECR - Tăng / Giảm giá trị số
```redis
SET page:views 0
INCR page:views       # 1
INCR page:views       # 2
INCR page:views       # 3

GET page:views
"3"

INCRBY page:views 10  # (integer) 13
DECRBY page:views 5   # (integer) 8
```

### MSET / MGET - Set/Get nhiều key cùng lúc
```redis
MSET user:1:name "John" user:1:age "25" user:1:city "Hanoi"

MGET user:1:name user:1:age user:1:city
1) "John"
2) "25"
3) "Hanoi"
```

---

## Demo 2: Hash Commands

### HSET / HGET - Lưu trữ object
```redis
# Tạo thông tin sinh viên (tương tự 1 row trong RDBMS)
HSET student:101 name "Tran Van B" age 22 major "CNTT" gpa 3.5

HGET student:101 name
"Tran Van B"

HGETALL student:101
1) "name"
2) "Tran Van B"
3) "age"
4) "22"
5) "major"
6) "CNTT"
7) "gpa"
8) "3.5"

HSET student:101 gpa 3.7      # Cập nhật
HDEL student:101 major         # Xóa 1 trường
```

### Ví dụ thực tế: Lưu thông tin sản phẩm
```redis
HSET product:1001 name "Laptop Dell XPS 15" price 35000000 stock 50 category "Laptop"

HGET product:1001 price
"35000000"

HINCRBY product:1001 stock 20
(integer) 70
```

---

## Demo 3: List Commands

### LPUSH / RPUSH / LRANGE - Danh sách
```redis
LPUSH tasks "Task 3"
LPUSH tasks "Task 2"
LPUSH tasks "Task 1"

LRANGE tasks 0 -1
1) "Task 1"
2) "Task 2"
3) "Task 3"

RPUSH tasks "Task 4"

LPOP tasks     # "Task 1" (lấy và xóa đầu)
RPOP tasks     # "Task 4" (lấy và xóa cuối)
LLEN tasks     # (integer) 2
```

### Ví dụ thực tế: Message Queue
```redis
# Producer đẩy message vào queue
RPUSH order:queue '{"order_id":1,"product":"Laptop","qty":1}'
RPUSH order:queue '{"order_id":2,"product":"Phone","qty":2}'

# Consumer lấy message từ queue (FIFO)
LPOP order:queue
"{\"order_id\":1,\"product\":\"Laptop\",\"qty\":1}"
```

---

## Demo 4: Set Commands

### SADD / SMEMBERS - Tập hợp không trùng lặp
```redis
SADD post:1:tags "redis" "nosql" "database" "big-data"
SADD post:2:tags "redis" "cache" "performance"

SMEMBERS post:1:tags
1) "redis"
2) "nosql"
3) "database"
4) "big-data"

SISMEMBER post:1:tags "redis"    # (integer) 1 - Có
SISMEMBER post:1:tags "python"   # (integer) 0 - Không có
SCARD post:1:tags                # (integer) 4
```

### Phép toán tập hợp
```redis
SINTER post:1:tags post:2:tags    # GIAO: "redis"

SUNION post:1:tags post:2:tags    # HỢP: redis, nosql, database, big-data, cache, performance

SDIFF post:1:tags post:2:tags     # HIỆU: nosql, database, big-data
```

---

## Demo 5: Sorted Set Commands

### ZADD / ZRANGE - Tập hợp có điểm số (ranking)
```redis
ZADD exam:scores 9.5 "Nguyen Van A"
ZADD exam:scores 8.7 "Tran Thi B"
ZADD exam:scores 9.8 "Le Van C"
ZADD exam:scores 7.5 "Pham Thi D"
ZADD exam:scores 8.2 "Hoang Van E"

# Xếp hạng từ cao đến thấp
ZREVRANGE exam:scores 0 -1 WITHSCORES
1) "Le Van C"       - 9.8
3) "Nguyen Van A"   - 9.5
5) "Tran Thi B"     - 8.7
7) "Hoang Van E"    - 8.2
9) "Pham Thi D"     - 7.5

# Top 3 sinh viên giỏi nhất
ZREVRANGE exam:scores 0 2 WITHSCORES

# Thứ hạng của 1 sinh viên
ZREVRANK exam:scores "Nguyen Van A"
(integer) 1    # Hạng 2 (index 1)

# Đếm sinh viên có điểm 8.0 - 9.5
ZCOUNT exam:scores 8.0 9.5
(integer) 3
```

---

## Demo 6: Key Management

```redis
KEYS *                     # Xem tất cả key (chỉ dùng cho dev)
EXISTS student:101         # Kiểm tra key tồn tại
TYPE student:101           # Xem kiểu dữ liệu
EXPIRE student:101 3600   # Hết hạn sau 1 giờ
TTL student:101            # Xem thời gian còn lại
DEL student:101            # Xóa key
FLUSHDB                    # Xóa database hiện tại (CẨN THẬN!)
```

---

## Demo 7: Pub/Sub (Publisher/Subscriber)

### Terminal 1 - Subscriber (người nhận)
```redis
SUBSCRIBE news
Reading messages... (press Ctrl-C to quit)
```

### Terminal 2 - Publisher (người gửi)
```redis
PUBLISH news "Breaking: Redis 8.0 released!"
PUBLISH news "Redis now supports vector search"
```

### Terminal 1 sẽ nhận được:
```
1) "message"
2) "news"
3) "Breaking: Redis 8.0 released!"
1) "message"
2) "news"
3) "Redis now supports vector search"
```

---

## Demo 8: Transaction (MULTI/EXEC)

```redis
MULTI                       # Bắt đầu transaction
SET account:A 1000          # QUEUED
SET account:B 2000          # QUEUED
DECRBY account:A 500        # QUEUED
INCRBY account:B 500        # QUEUED
EXEC                        # Thực thi tất cả (atomic)
1) OK
2) OK
3) (integer) 500
4) (integer) 2500

GET account:A    # "500"
GET account:B    # "2500"
```

---

## Demo 9: Ứng dụng thực tế

### Use Case 1: Session Store
```redis
# Lưu session khi user đăng nhập (hết hạn sau 30 phút)
SET session:abc123 '{"user_id":1,"name":"Admin","role":"admin"}' EX 1800

GET session:abc123
"{\"user_id\":1,\"name\":\"Admin\",\"role\":\"admin\"}"
```

### Use Case 2: Rate Limiting (Giới hạn request)
```redis
INCR rate:user1
EXPIRE rate:user1 60     # Reset sau 1 phút

GET rate:user1
"5"    # Còn dưới 100 -> cho phép
```

### Use Case 3: Cache database query
```redis
GET cache:products:all
(nil)   # Không có cache -> query database

# Sau khi query, lưu vào cache 5 phút
SET cache:products:all '[{"id":1,"name":"Laptop"},{"id":2,"name":"Phone"}]' EX 300

# Lần sau -> lấy từ cache (nhanh hơn)
GET cache:products:all
"[{\"id\":1,\"name\":\"Laptop\"},{\"id\":2,\"name\":\"Phone\"}]"
```

---

## Tổng kết các lệnh Redis quan trọng

| Nhóm | Lệnh | Chức năng |
|------|------|-----------|
| **String** | SET, GET, INCR, DECR, MSET, MGET | Lưu/đọc chuỗi và số |
| **Hash** | HSET, HGET, HGETALL, HDEL, HINCRBY | Lưu/đọc object |
| **List** | LPUSH, RPUSH, LPOP, RPOP, LRANGE, LLEN | Danh sách/Queue |
| **Set** | SADD, SMEMBERS, SINTER, SUNION, SDIFF | Tập hợp |
| **Sorted Set** | ZADD, ZRANGE, ZREVRANGE, ZRANK, ZCOUNT | Ranking |
| **Key** | DEL, EXISTS, EXPIRE, TTL, TYPE, KEYS | Quản lý key |
| **Pub/Sub** | SUBSCRIBE, PUBLISH, UNSUBSCRIBE | Messaging |
| **Transaction** | MULTI, EXEC, DISCARD, WATCH | Giao dịch |
| **Server** | PING, INFO, DBSIZE, FLUSHDB | Quản lý server |

# Redis Demo — BigData CH3 (Chương 3)

> Kịch bản demo đầy đủ theo nội dung slide bài giảng.
> Đại học Giao thông Vận tải (UTC) — Cao học Big Data 2026.

---

## 1. Khởi động môi trường

```bash
cd redis-demo
docker compose up -d
```

Kiểm tra Redis đã sẵn sàng:

```bash
docker exec -it redis-demo redis-cli PING
# → PONG
```

Mở RedisInsight (GUI): http://localhost:5540
- Add database → Host: `redis`, Port: `6379`

Vào Redis CLI để chạy demo:

```bash
docker exec -it redis-demo redis-cli
```

---

## 2. Demo String — SET, GET, INCR (Slide 18)

### 2.1 SET / GET cơ bản & TTL

```redis
SET name "Nguyen Van A"
GET name

# Hết hạn sau 10 giây
SET session:u1 "token" EX 10
TTL session:u1
# Đợi 10 giây...
GET session:u1
# → (nil) — đã hết hạn
```

### 2.2 INCR / DECRBY — Đếm lượt truy cập

```redis
SET page:views 0
INCR page:views
INCR page:views
INCR page:views
INCRBY page:views 10
GET page:views
# → "13"

DECRBY page:views 3
GET page:views
# → "10"
```

### 2.3 MSET / MGET — Nhiều key cùng lúc

```redis
MSET u:name "Tran Van B" u:age "25" u:major "CNTT"
MGET u:name u:age u:major
# 1) "Tran Van B"
# 2) "25"
# 3) "CNTT"
```

---

## 3. Demo Hash — HSET, HGET, HGETALL (Slide 19)

### 3.1 Thông tin sinh viên (tương tự 1 row trong RDBMS)

```redis
HSET student:101 name "Tran Van B" age 22 major "CNTT" gpa 3.5

HGET student:101 name
# → "Tran Van B"

HGETALL student:101
# 1) "name"   2) "Tran Van B"
# 3) "age"    4) "22"
# 5) "major"  6) "CNTT"
# 7) "gpa"    8) "3.5"
```

### 3.2 Cập nhật & Xóa trường

```redis
HSET student:101 gpa 3.7
HGET student:101 gpa
# → "3.7"

HDEL student:101 major
HGETALL student:101
# major đã bị xóa
```

### 3.3 Quản lý sản phẩm — HINCRBY

```redis
HSET product:1001 name "Laptop Dell" price 35000000 stock 50

# Nhập thêm 20 sản phẩm
HINCRBY product:1001 stock 20
# → (integer) 70

# Bán 5 sản phẩm
HINCRBY product:1001 stock -5
# → (integer) 65

HGETALL product:1001
```

---

## 4. Demo List — LPUSH, RPUSH, LPOP (Slide 20)

### 4.1 Danh sách công việc

```redis
LPUSH tasks "Task 3"
LPUSH tasks "Task 2"
LPUSH tasks "Task 1"

LRANGE tasks 0 -1
# 1) "Task 1"
# 2) "Task 2"
# 3) "Task 3"

RPUSH tasks "Task 4"

LRANGE tasks 0 -1
# 1) "Task 1"  2) "Task 2"  3) "Task 3"  4) "Task 4"

LPOP tasks
# → "Task 1"

RPOP tasks
# → "Task 4"

LLEN tasks
# → (integer) 2
```

### 4.2 Message Queue (FIFO)

```redis
# Producer đẩy message
RPUSH order:queue '{"order_id":1,"product":"Laptop"}'
RPUSH order:queue '{"order_id":2,"product":"Phone"}'
RPUSH order:queue '{"order_id":3,"product":"Tablet"}'

# Consumer lấy message (FIFO — lấy từ đầu)
LPOP order:queue
# → '{"order_id":1,"product":"Laptop"}'

LPOP order:queue
# → '{"order_id":2,"product":"Phone"}'

LLEN order:queue
# → (integer) 1
```

---

## 5. Demo Set & Sorted Set (Slide 21)

### 5.1 Set — Tập hợp không trùng lặp

```redis
SADD post:1:tags "redis" "nosql" "big-data"
SADD post:2:tags "redis" "cache" "performance"

SMEMBERS post:1:tags
# → "redis" "nosql" "big-data"

# Phép toán tập hợp
SINTER post:1:tags post:2:tags
# → "redis" (phần tử chung)

SUNION post:1:tags post:2:tags
# → tất cả tags

SDIFF post:1:tags post:2:tags
# → "nosql" "big-data" (chỉ có ở post:1)

SISMEMBER post:1:tags "redis"
# → (integer) 1

SCARD post:1:tags
# → (integer) 3
```

### 5.2 Sorted Set — Bảng xếp hạng điểm thi

```redis
ZADD exam:scores 9.5 "Nguyen Van A"
ZADD exam:scores 8.7 "Tran Thi B"
ZADD exam:scores 9.8 "Le Van C"
ZADD exam:scores 7.5 "Pham Van D"
ZADD exam:scores 8.2 "Hoang Thi E"

# Top 3 từ cao → thấp
ZREVRANGE exam:scores 0 2 WITHSCORES
# 1) "Le Van C"      2) "9.8"
# 3) "Nguyen Van A"  4) "9.5"
# 5) "Tran Thi B"    6) "8.7"

# Xếp hạng của "Nguyen Van A" (0-based, từ cao → thấp)
ZREVRANK exam:scores "Nguyen Van A"
# → (integer) 1  (Hạng 2)

# Đếm sinh viên có điểm từ 8.0 → 10.0
ZCOUNT exam:scores 8.0 10.0
# → (integer) 3
```

---

## 6. Demo Pub/Sub — Messaging (Slide 22)

> Cần mở 2 terminal riêng biệt.

### Terminal 1 — Subscriber

```bash
docker exec -it redis-demo redis-cli
```

```redis
SUBSCRIBE news
# Reading messages... (waiting)
```

### Terminal 2 — Publisher

```bash
docker exec -it redis-demo redis-cli
```

```redis
PUBLISH news "Redis 8.0 released!"
PUBLISH news "BigData class starts today!"
```

### Kết quả ở Terminal 1

```
1) "message"
2) "news"
3) "Redis 8.0 released!"

1) "message"
2) "news"
3) "BigData class starts today!"
```

> Nhấn `Ctrl+C` ở Terminal 1 để thoát subscribe.

---

## 7. Demo Transaction — MULTI/EXEC (Slide 22)

### 7.1 Chuyển tiền: A → B

```redis
# Khởi tạo tài khoản
SET account:A 1000
SET account:B 2000

# Bắt đầu transaction
MULTI
DECRBY account:A 500
INCRBY account:B 500
EXEC
# 1) (integer) 500
# 2) (integer) 2500

GET account:A
# → "500"
GET account:B
# → "2500"
```

### 7.2 Hủy transaction — DISCARD

```redis
SET account:C 3000

MULTI
DECRBY account:C 1000
DISCARD
# → OK (transaction bị hủy)

GET account:C
# → "3000" (không thay đổi)
```

---

## 8. Demo 3 Use Cases thực tế (Slide 23)

### 8.1 Session Management

```redis
# User đăng nhập → lưu session, hết hạn 30 phút (1800s)
SET session:abc123 '{"user_id":1,"name":"Admin","role":"admin"}' EX 1800

GET session:abc123
# → '{"user_id":1,"name":"Admin","role":"admin"}'

TTL session:abc123
# → (integer) ~1798
```

### 8.2 Rate Limiting — Giới hạn API request

```redis
# Mỗi user tối đa 100 request/phút
INCR rate:user1
EXPIRE rate:user1 60

# Giả lập nhiều request
INCR rate:user1
INCR rate:user1
INCR rate:user1

GET rate:user1
# → "4"

# Logic ứng dụng: nếu GET rate:user1 > 100 → reject request
TTL rate:user1
# → key tự hết hạn sau 60 giây, counter reset
```

### 8.3 Cache Database Query

```redis
# Bước 1: Check cache
GET cache:products
# → (nil) — cache miss → query DB

# Bước 2: Sau khi query DB, lưu kết quả vào cache 5 phút
SET cache:products '[{"id":1,"name":"Laptop"},{"id":2,"name":"Phone"}]' EX 300

# Bước 3: Lần sau check cache
GET cache:products
# → '[{"id":1,"name":"Laptop"},{"id":2,"name":"Phone"}]' — cache hit!

TTL cache:products
# → (integer) ~298
```

---

## 9. Lệnh quản lý Server (Slide 24)

```redis
PING
# → PONG

INFO server
# → Thông tin server (version, uptime, OS...)

DBSIZE
# → Số lượng keys hiện tại

KEYS *
# → Liệt kê tất cả keys (chỉ dùng trong demo, KHÔNG dùng production)

# Kiểm tra kiểu dữ liệu
TYPE name
# → string

TYPE student:101
# → hash

TYPE tasks
# → list

TYPE post:1:tags
# → set

TYPE exam:scores
# → zset
```

---

## 10. Dọn dẹp

```redis
FLUSHDB
# → Xóa tất cả keys trong database hiện tại
```

Tắt môi trường:

```bash
docker compose down
# Xóa luôn data:
docker compose down -v
```

---

## Tóm tắt lệnh theo nhóm (Slide 24)

| Nhóm | Lệnh | Chức năng |
|---|---|---|
| **String** | SET, GET, INCR, DECR, MSET, MGET | Lưu/đọc chuỗi và số |
| **Hash** | HSET, HGET, HGETALL, HDEL, HINCRBY | Lưu/đọc object |
| **List** | LPUSH, RPUSH, LPOP, RPOP, LRANGE | Danh sách / Queue |
| **Set** | SADD, SMEMBERS, SINTER, SUNION, SDIFF | Tập hợp |
| **Sorted Set** | ZADD, ZREVRANGE, ZRANK, ZCOUNT | Ranking |
| **Key** | DEL, EXISTS, EXPIRE, TTL, TYPE, KEYS | Quản lý key |
| **Pub/Sub** | SUBSCRIBE, PUBLISH, UNSUBSCRIBE | Messaging |
| **Transaction** | MULTI, EXEC, DISCARD, WATCH | Giao dịch |
| **Server** | PING, INFO, DBSIZE, FLUSHDB | Quản lý server |

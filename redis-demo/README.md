# Redis & NoSQL — Demo Lab

> Bài thực hành Chương 3 — Môn **Lưu trữ và Xử lý dữ liệu lớn**
> Cao học Big Data 2026 — ĐH Giao thông Vận tải (UTC)

---

## Yêu cầu

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (bao gồm `docker compose`)
- Terminal (macOS Terminal, Windows PowerShell, hoặc Linux shell)

## Cấu trúc thư mục

```
redis-demo/
├── docker-compose.yml   # Redis 7.4 + RedisInsight GUI
├── redis.conf           # Cấu hình Redis (persistence, memory)
├── demo-script.md       # Kịch bản demo chi tiết (chạy tay)
├── run-demo.sh          # Script tự động chạy toàn bộ demo
└── README.md            # File này
```

## Khởi động

```bash
cd redis-demo

# Khởi động Redis + RedisInsight
docker compose up -d

# Kiểm tra
docker compose ps
```

Kết quả mong đợi:

| Container | Port | Mô tả |
|---|---|---|
| `redis-demo` | `6379` | Redis Server 7.4 |
| `redis-insight` | `5540` | RedisInsight GUI |

## Cách chạy demo

### Cách 1 — Script tự động (nhanh)

Chạy toàn bộ demo một lần, xem output trên terminal:

```bash
./run-demo.sh
```

Script sẽ lần lượt demo: String → Hash → List → Set → Sorted Set → Transaction → Use Cases → Server Info.

### Cách 2 — Chạy tay từng lệnh (khuyến khích khi học)

Mở Redis CLI:

```bash
docker exec -it redis-demo redis-cli
```

Sau đó chạy từng lệnh theo kịch bản trong file [`demo-script.md`](demo-script.md).

### Cách 3 — RedisInsight GUI

Mở trình duyệt: **http://localhost:5540**

1. Click **Add Redis Database**
2. Nhập: Host = `redis`, Port = `6379`
3. Click **Add Redis Database**
4. Vào tab **Workbench** để chạy lệnh trực quan

## Nội dung demo

| # | Chủ đề | Slide | Lệnh chính |
|---|---|---|---|
| 1 | **String** | 18 | `SET` `GET` `INCR` `INCRBY` `MSET` `MGET` |
| 2 | **Hash** | 19 | `HSET` `HGET` `HGETALL` `HDEL` `HINCRBY` |
| 3 | **List** | 20 | `LPUSH` `RPUSH` `LPOP` `RPOP` `LRANGE` `LLEN` |
| 4 | **Set** | 21 | `SADD` `SMEMBERS` `SINTER` `SUNION` `SDIFF` |
| 5 | **Sorted Set** | 21 | `ZADD` `ZREVRANGE` `ZREVRANK` `ZCOUNT` |
| 6 | **Pub/Sub** | 22 | `SUBSCRIBE` `PUBLISH` |
| 7 | **Transaction** | 22 | `MULTI` `EXEC` `DISCARD` |
| 8 | **Use Cases** | 23 | Session, Rate Limiting, Cache |
| 9 | **Server** | 24 | `PING` `INFO` `DBSIZE` `TYPE` |

## Demo Pub/Sub (cần 2 terminal)

Pub/Sub không chạy được trong script tự động vì cần 2 terminal đồng thời.

**Terminal 1 — Subscriber:**

```bash
docker exec -it redis-demo redis-cli
SUBSCRIBE news
```

**Terminal 2 — Publisher:**

```bash
docker exec -it redis-demo redis-cli
PUBLISH news "Redis 8.0 released!"
PUBLISH news "BigData class starts today!"
```

Quay lại Terminal 1 sẽ thấy message hiện ra. Nhấn `Ctrl+C` để thoát.

## Cấu hình Redis

File `redis.conf` đã cấu hình sẵn:

| Cấu hình | Giá trị | Ý nghĩa |
|---|---|---|
| `port` | 6379 | Port mặc định |
| `maxmemory` | 256mb | Giới hạn RAM |
| `maxmemory-policy` | allkeys-lru | Evict key ít dùng nhất khi đầy RAM |
| `save` | 900 1 / 300 10 | RDB snapshot (persistence) |
| `appendonly` | yes | Bật AOF log (persistence) |
| `appendfsync` | everysec | Ghi AOF mỗi giây |

## Dọn dẹp

```bash
# Tắt containers
docker compose down

# Tắt + xóa data
docker compose down -v
```

## Tham khảo

- [Redis Documentation](https://redis.io/docs/)
- [Redis Commands](https://redis.io/commands/)
- [RedisInsight](https://redis.io/insight/)

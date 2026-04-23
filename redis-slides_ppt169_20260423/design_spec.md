# Redis NoSQL Database - Design Spec

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Project Name** | redis-slides |
| **Canvas Format** | PPT 16:9 (1280×720) |
| **Page Count** | 25 |
| **Design Style** | General Versatile |
| **Target Audience** | Học viên cao học, ngành Big Data, ĐH GTVT (UTC) |
| **Use Case** | Bài giảng trên lớp |
| **Created Date** | 2026-04-23 |

---

## II. Canvas Specification

| Property | Value |
| -------- | ----- |
| **Format** | PPT 16:9 |
| **Dimensions** | 1280×720 |
| **viewBox** | `0 0 1280 720` |
| **Margins** | left/right 60px, top/bottom 50px |
| **Content Area** | 1160×620 |

---

## III. Visual Theme

### Theme Style
- **Style**: General Versatile
- **Theme**: Light theme
- **Tone**: Công nghệ, học thuật, chuyên nghiệp

### Color Scheme

| Role | HEX | Purpose |
| ---- | --- | ------- |
| **Background** | `#FFFFFF` | Nền trắng |
| **Secondary bg** | `#E5F4F9` | Nền card |
| **Primary** | `#0B4DA2` | Xanh UTC — tiêu đề |
| **Accent** | `#D12B1F` | Đỏ Redis — highlight |
| **Secondary accent** | `#006AF9` | Xanh sáng — link |
| **Body text** | `#2D3748` | Chữ chính |
| **Secondary text** | `#718096` | Chú thích |
| **Tertiary text** | `#A0AEC0` | Footer |
| **Border** | `#E2E8F0` | Viền card |
| **Success** | `#2E7D32` | Tích cực |
| **Warning** | `#C62828` | Cảnh báo |

### Gradient Scheme

```xml
<linearGradient id="headerGrad" x1="0%" y1="0%" x2="100%" y2="0%">
  <stop offset="0%" stop-color="#0B4DA2"/>
  <stop offset="100%" stop-color="#006AF9"/>
</linearGradient>
```

---

## IV. Typography System

### Font Plan
**Preset**: P5 (English-primary)

| Role | Chinese | English | Fallback |
| ---- | ------- | ------- | -------- |
| **Title** | Microsoft YaHei | Arial | sans-serif |
| **Body** | Microsoft YaHei | Calibri | sans-serif |
| **Code** | - | Consolas | Monaco |
| **Emphasis** | SimHei | Arial Black | sans-serif |

**Font stack**: `'Arial', 'Microsoft YaHei', 'Calibri', sans-serif`

### Font Size Hierarchy
**Baseline**: Body = 20px

| Purpose | Size | Weight |
| ------- | ---- | ------ |
| Cover title | 56px | Bold |
| Chapter title | 40px | Bold |
| Content title | 32px | Bold |
| Subtitle | 24px | SemiBold |
| **Body** | **20px** | Regular |
| Annotation | 16px | Regular |
| Code | 16px | Regular |
| Page number | 12px | Regular |

---

## V. Layout Principles

### Page Structure
- **Header area**: 0-60px, tiêu đề trang + thanh màu
- **Content area**: 60-670px, nội dung chính
- **Footer area**: 670-720px, số trang

### Spacing Specification

| Element | Value |
| ------- | ----- |
| Card gap | 24px |
| Content block gap | 32px |
| Card padding | 24px |
| Card border radius | 12px |
| Icon-text gap | 12px |

---

## VI. Icon Usage Specification

### Source
- **Library**: `chunk` (sharp geometry style)
- **Placeholder format**: `{{icon:chunk/icon-name}}`

### Icon List

| Purpose | Icon Path | Page |
| ------- | --------- | ---- |
| Database | `chunk/database` | 01, 02 |
| Server | `chunk/server` | 03, 14 |
| Key | `chunk/key` | 04, 16 |
| Code | `chunk/code` | 15, 17-22 |
| Terminal | `chunk/terminal` | 14, 15 |
| Shield | `chunk/shield-check` | 07 |
| Layers | `chunk/layers` | 09, 10 |
| Globe | `chunk/globe` | 03 |
| Chart | `chunk/chart-bar` | 06, 08 |
| Check | `chunk/circle-checkmark` | 15 |
| List | `chunk/list` | 11, 25 |
| Grid | `chunk/grid` | 16 |
| Link | `chunk/link` | 12 |
| Lock | `chunk/lock-closed` | 07 |
| Arrow right | `chunk/arrow-right` | Multiple |
| Clock | `chunk/clock` | 17 |
| Hashtag | `chunk/hashtag` | 18 |
| Star | `chunk/star` | 21 |
| Lightning | `chunk/cloud-lightning` | 23 |
| Sync | `chunk/arrows-rotate-clockwise` | 22 |
| Folder | `chunk/folder` | 15 |
| Table | `chunk/table` | 08, 11 |
| Badge | `chunk/badge-check` | 25 |

---

## VII. Visualization Reference List

| Visualization Type | Reference Template | Used In | Purpose |
| ------------------ | ------------------ | ------- | ------- |
| comparison_table | `templates/charts/comparison_table.svg` | Slide 02, 08, 11 | Bảng so sánh NoSQL types, ACID vs Redis, RDBMS vs NoSQL |
| venn_diagram | `templates/charts/venn_diagram.svg` | Slide 05 | CAP Theorem Venn 3 vòng tròn |
| pros_cons_chart | `templates/charts/pros_cons_chart.svg` | Slide 08, 13 | ACID vs BASE, Redis vs RDBMS |
| icon_grid | `templates/charts/icon_grid.svg` | Slide 10, 16, 25 | Các loại NoSQL, kiểu dữ liệu Redis |
| numbered_steps | `templates/charts/numbered_steps.svg` | Slide 14 | Các bước cài đặt Redis |
| hub_spoke | `templates/charts/hub_spoke.svg` | Slide 03 | Redis ở trung tâm ecosystem |
| vertical_list | `templates/charts/vertical_list.svg` | Slide 04, 09 | Ưu điểm NoSQL, BASE properties |

---

## VIII. Image Resource List

Không sử dụng hình ảnh.

---

## IX. Content Outline

### Phần 1: Lý thuyết 3.1 - 3.4

#### Slide 01 - Trang bìa
- **Layout**: Single column centered
- **Title**: REDIS & NoSQL Database
- **Subtitle**: Chương 3 — Lý thuyết & Thực hành
- **Info**: ĐH Giao thông Vận tải (UTC) — Cao học Big Data — 2026

#### Slide 02 - Mục lục
- **Layout**: Two-column cards
- **Title**: Nội dung trình bày
- **Content**:
  - Phần 1: Lý thuyết 3.1-3.4 (NoSQL, CAP, ACID)
  - Phần 2: Lý thuyết 3.5-3.8 (BASE, Schemaless, NoSQL types)
  - Phần 3: Cài đặt phần mềm Redis
  - Phần 4: Demo hướng dẫn thực hành

#### Slide 03 - Giới thiệu NoSQL
- **Layout**: Hub & Spoke
- **Title**: 3.1 Giới thiệu NoSQL
- **Visualization**: hub_spoke
- **Content**:
  - NoSQL = Not Only SQL
  - Non-relational, schemaless, horizontal scaling
  - 4 loại: Key-Value, Column, Document, Graph
  - Redis = Key-Value Store thuộc nhóm CP

#### Slide 04 - Tại sao cần NoSQL?
- **Layout**: Left-right split
- **Title**: 3.2 Tại sao cần NoSQL?
- **Visualization**: vertical_list
- **Content**:
  - Trái: Hạn chế RDBMS (structured only, vertical scaling đắt, rigid schema)
  - Phải: Ưu điểm NoSQL (mọi loại dữ liệu, horizontal scaling, schemaless, Big Data)

#### Slide 05 - Định lý CAP
- **Layout**: Single column centered
- **Title**: 3.3 Định lý CAP (CAP Theorem)
- **Visualization**: venn_diagram
- **Content**:
  - C = Consistency, A = Availability, P = Partition Tolerance
  - Chỉ đạt 2/3: CA, CP, AP
  - Redis thuộc CP

#### Slide 06 - CAP — Phân loại Database
- **Layout**: Three-column cards
- **Title**: Phân loại Database theo CAP
- **Content**:
  - CA: RDBMS (MySQL, PostgreSQL)
  - CP: Redis, HBase, MongoDB, BigTable
  - AP: Cassandra, DynamoDB, Riak, CouchDB

#### Slide 07 - ACID Properties
- **Layout**: Four cards (2×2)
- **Title**: 3.4 ACID Properties
- **Content**:
  - A — Atomicity: Tất cả hoặc không gì cả
  - C — Consistency: Nhất quán trước và sau giao dịch
  - I — Isolation: Giao dịch cô lập
  - D — Durability: Bền vững, lưu vĩnh viễn

#### Slide 08 - ACID: RDBMS vs Redis
- **Layout**: Comparison table
- **Title**: So sánh ACID: RDBMS vs Redis
- **Visualization**: comparison_table
- **Content**:
  - Atomicity: Đầy đủ vs MULTI/EXEC
  - Consistency: Đầy đủ vs RDB/AOF
  - Isolation: Đầy đủ vs Single-threaded
  - Durability: Đầy đủ vs RDB/AOF tùy chọn

### Phần 2: Lý thuyết 3.5 - 3.8

#### Slide 09 - BASE Properties
- **Layout**: Vertical list
- **Title**: 3.5 BASE Properties
- **Visualization**: vertical_list
- **Content**:
  - BA — Basically Available: Luôn sẵn sàng dù có lỗi
  - S — Soft State: Dữ liệu thay đổi theo thời gian
  - E — Eventual Consistency: Nhất quán cuối cùng

#### Slide 10 - ACID vs BASE
- **Layout**: Pros & Cons
- **Title**: So sánh ACID vs BASE
- **Visualization**: pros_cons_chart
- **Content**:
  - ACID: Nhất quán ngay, bi quan, cứng nhắc, vertical
  - BASE: Eventual consistency, lạc quan, linh hoạt, horizontal

#### Slide 11 - Schemaless & NoSQL vs RDBMS
- **Layout**: Comparison table
- **Title**: 3.6-3.7 Schemaless & NoSQL vs RDBMS
- **Visualization**: comparison_table
- **Content**:
  - 7 tiêu chí: Cấu trúc, ETL, Lưu trữ, Transaction, Mở rộng, Ngôn ngữ, Trạng thái

#### Slide 12 - Các loại NoSQL Database
- **Layout**: Icon grid (2×2)
- **Title**: 3.7.3 Các loại NoSQL
- **Visualization**: icon_grid
- **Content**:
  - Key-Value: Redis, DynamoDB
  - Column-Store: Cassandra, HBase
  - Document: MongoDB, CouchDB
  - Graph: Neo4J, InfiniteGraph

#### Slide 13 - Chuyển đổi RDBMS → NoSQL
- **Layout**: Pros & Cons
- **Title**: 3.8 Khi nào dùng Redis vs RDBMS?
- **Visualization**: pros_cons_chart
- **Content**:
  - Redis: Cache, Session, Real-time, Pub/Sub, Ranking
  - RDBMS: Tài chính, JOIN phức tạp, Audit, Schema chắc chắn

### Phần 3: Cài đặt phần mềm

#### Slide 14 - Cài đặt Redis (Docker)
- **Layout**: Numbered steps
- **Title**: Cài đặt Redis bằng Docker
- **Visualization**: numbered_steps
- **Content**:
  - Bước 1: Cài Docker Desktop
  - Bước 2: docker pull redis && docker run
  - Bước 3: docker exec -it my-redis redis-cli → PING/PONG

#### Slide 15 - Cài đặt Redis (WSL/Linux/macOS)
- **Layout**: Three-column cards
- **Title**: Cài đặt Redis — Các nền tảng
- **Content**:
  - WSL2: apt install redis-server
  - macOS: brew install redis
  - Linux: apt install redis-server + systemctl

#### Slide 16 - GUI Tools & Cấu hình
- **Layout**: Left-right split
- **Title**: GUI Tools & Cấu hình cơ bản
- **Content**:
  - Trái: RedisInsight (chính thức), Another Redis Desktop Manager
  - Phải: redis.conf — port, bind, requirepass, maxmemory, persistence

### Phần 4: Demo hướng dẫn

#### Slide 17 - Kiểu dữ liệu Redis
- **Layout**: Icon grid
- **Title**: 5 kiểu dữ liệu trong Redis
- **Visualization**: icon_grid
- **Content**:
  - String: Chuỗi, số — Cache, counter
  - Hash: Field-value — User profile
  - List: Linked list — Message queue
  - Set: Không trùng — Tags
  - Sorted Set: Có điểm — Ranking

#### Slide 18 - Demo: String Commands
- **Layout**: Code block layout
- **Title**: Demo: String — SET, GET, INCR, MSET
- **Content**:
  - SET name "Nguyen Van A" → GET name
  - SET session EX 10 → TTL → hết hạn
  - INCR page:views → INCRBY/DECRBY
  - MSET/MGET nhiều key

#### Slide 19 - Demo: Hash Commands
- **Layout**: Code block layout
- **Title**: Demo: Hash — HSET, HGET, HGETALL
- **Content**:
  - HSET student:101 name age major gpa
  - HGETALL → tất cả trường
  - HINCRBY stock tăng tồn kho

#### Slide 20 - Demo: List Commands
- **Layout**: Code block layout
- **Title**: Demo: List — LPUSH, RPUSH, LPOP
- **Content**:
  - LPUSH/RPUSH thêm đầu/cuối
  - LRANGE xem danh sách
  - LPOP/RPOP lấy và xóa
  - Ứng dụng: Message Queue (FIFO)

#### Slide 21 - Demo: Set & Sorted Set
- **Layout**: Left-right split code
- **Title**: Demo: Set & Sorted Set
- **Content**:
  - Trái: SADD, SMEMBERS, SINTER/SUNION/SDIFF
  - Phải: ZADD exam:scores, ZREVRANGE top 3, ZCOUNT

#### Slide 22 - Demo: Pub/Sub & Transaction
- **Layout**: Left-right split
- **Title**: Demo: Pub/Sub & Transaction
- **Content**:
  - Trái: SUBSCRIBE news → PUBLISH news "message"
  - Phải: MULTI → SET/DECRBY/INCRBY → EXEC (atomic)

#### Slide 23 - Ứng dụng thực tế Redis
- **Layout**: Three-column cards
- **Title**: 3 Use Cases thực tế
- **Content**:
  - Session Store: SET session EX 1800
  - Rate Limiting: INCR + EXPIRE 60
  - Cache Query: GET cache → miss → SET EX 300

#### Slide 24 - Tổng kết lệnh Redis
- **Layout**: Table full-width
- **Title**: Tổng kết các lệnh Redis quan trọng
- **Content**: Bảng 9 nhóm lệnh: String, Hash, List, Set, Sorted Set, Key, Pub/Sub, Transaction, Server

#### Slide 25 - Câu hỏi ôn tập & Kết thúc
- **Layout**: Single column centered
- **Title**: Câu hỏi ôn tập
- **Content**:
  - 5 câu hỏi ôn tập chính
  - Cảm ơn — Q&A

---

## X. Speaker Notes Requirements

- **File naming**: Match SVG names (01_cover.md, 02_muc_luc.md...)
- **Style**: Formal + interactive (bài giảng)
- **Duration**: ~60 phút tổng
- **Purpose**: Instruct (giảng dạy)

---

## XI. Technical Constraints Reminder

### SVG Generation Must Follow:
1. viewBox: `0 0 1280 720`
2. Background uses `<rect>` elements
3. Text wrapping uses `<tspan>` (`<foreignObject>` FORBIDDEN)
4. Transparency uses `fill-opacity` / `stroke-opacity`; `rgba()` FORBIDDEN
5. FORBIDDEN: `clipPath`, `mask`, `<style>`, `class`, `foreignObject`
6. FORBIDDEN: `textPath`, `animate*`, `script`

### PPT Compatibility Rules:
- `<g opacity="...">` FORBIDDEN; set on each child element individually
- Inline styles only; external CSS FORBIDDEN

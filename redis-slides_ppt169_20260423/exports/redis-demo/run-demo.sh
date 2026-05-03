#!/bin/bash
# =============================================================
# Redis Demo Script — BigData CH3 (UTC 2026)
# Chạy: ./run-demo.sh
# Yêu cầu: docker compose đã up (docker compose up -d)
# =============================================================

CLI="docker exec -i redis-demo redis-cli"

section() {
  echo ""
  echo "============================================"
  echo "  $1"
  echo "============================================"
  echo ""
}

run() {
  echo "> $1"
  echo "$1" | $CLI
  echo ""
}

# ------ Cleanup ------
echo "Flushing database..."
echo "FLUSHDB" | $CLI > /dev/null

# =============================================
section "1. STRING — SET, GET, INCR (Slide 18)"
# =============================================

run 'SET name "Nguyen Van A"'
run 'GET name'

run 'SET session:u1 "token" EX 30'
run 'TTL session:u1'

run 'SET page:views 0'
run 'INCR page:views'
run 'INCR page:views'
run 'INCRBY page:views 10'
run 'GET page:views'

run 'MSET u:name "Tran Van B" u:age "25" u:major "CNTT"'
run 'MGET u:name u:age u:major'

# =============================================
section "2. HASH — HSET, HGET, HGETALL (Slide 19)"
# =============================================

run 'HSET student:101 name "Tran Van B" age 22 major "CNTT" gpa 3.5'
run 'HGET student:101 name'
run 'HGETALL student:101'

run 'HSET student:101 gpa 3.7'
run 'HGET student:101 gpa'

run 'HDEL student:101 major'
run 'HGETALL student:101'

run 'HSET product:1001 name "Laptop Dell" price 35000000 stock 50'
run 'HINCRBY product:1001 stock 20'
run 'HGETALL product:1001'

# =============================================
section "3. LIST — LPUSH, RPUSH, LPOP (Slide 20)"
# =============================================

run 'LPUSH tasks "Task 3"'
run 'LPUSH tasks "Task 2"'
run 'LPUSH tasks "Task 1"'
run 'LRANGE tasks 0 -1'

run 'RPUSH tasks "Task 4"'
run 'LRANGE tasks 0 -1'

run 'LPOP tasks'
run 'RPOP tasks'
run 'LLEN tasks'

echo "--- Message Queue (FIFO) ---"
run 'RPUSH order:queue {"order_id":1,"product":"Laptop"}'
run 'RPUSH order:queue {"order_id":2,"product":"Phone"}'
run 'LPOP order:queue'
run 'LPOP order:queue'

# =============================================
section "4. SET & SORTED SET (Slide 21)"
# =============================================

run 'SADD post:1:tags "redis" "nosql" "big-data"'
run 'SADD post:2:tags "redis" "cache" "performance"'
run 'SMEMBERS post:1:tags'

run 'SINTER post:1:tags post:2:tags'
run 'SUNION post:1:tags post:2:tags'
run 'SDIFF post:1:tags post:2:tags'
run 'SISMEMBER post:1:tags "redis"'
run 'SCARD post:1:tags'

echo "--- Sorted Set: Bang xep hang diem thi ---"
run 'ZADD exam:scores 9.5 "Nguyen Van A"'
run 'ZADD exam:scores 8.7 "Tran Thi B"'
run 'ZADD exam:scores 9.8 "Le Van C"'
run 'ZADD exam:scores 7.5 "Pham Van D"'
run 'ZADD exam:scores 8.2 "Hoang Thi E"'

run 'ZREVRANGE exam:scores 0 2 WITHSCORES'
run 'ZREVRANK exam:scores "Nguyen Van A"'
run 'ZCOUNT exam:scores 8.0 10.0'

# =============================================
section "5. TRANSACTION — MULTI/EXEC (Slide 22)"
# =============================================

run 'SET account:A 1000'
run 'SET account:B 2000'

echo "MULTI
DECRBY account:A 500
INCRBY account:B 500
EXEC" | $CLI
echo ""

run 'GET account:A'
run 'GET account:B'

# =============================================
section "6. USE CASES (Slide 23)"
# =============================================

echo "--- Session Management ---"
run 'SET session:abc123 {"user_id":1,"name":"Admin","role":"admin"} EX 1800'
run 'GET session:abc123'
run 'TTL session:abc123'

echo "--- Rate Limiting ---"
run 'SET rate:user1 0 EX 60'
run 'INCR rate:user1'
run 'INCR rate:user1'
run 'INCR rate:user1'
run 'GET rate:user1'
run 'TTL rate:user1'

echo "--- Cache ---"
run 'GET cache:products'
run 'SET cache:products [{"id":1,"name":"Laptop"},{"id":2,"name":"Phone"}] EX 300'
run 'GET cache:products'
run 'TTL cache:products'

# =============================================
section "7. SERVER INFO (Slide 24)"
# =============================================

run 'PING'
run 'DBSIZE'
run 'TYPE name'
run 'TYPE student:101'
run 'TYPE tasks'
run 'TYPE post:1:tags'
run 'TYPE exam:scores'

echo ""
echo "============================================"
echo "  DEMO HOAN TAT!"
echo "  Pub/Sub can 2 terminal rieng — xem demo-script.md"
echo "============================================"

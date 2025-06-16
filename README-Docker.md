# Rails + MySQL với Docker (sử dụng mysql2)

## Yêu cầu

- Docker Desktop đã được cài đặt
- Git Bash hoặc WSL (cho Windows)

## Cách sử dụng

### 1. Khởi động ứng dụng lần đầu

```bash
# Cấp quyền thực thi cho script
chmod +x bin/docker-setup

# Chạy script setup
./bin/docker-setup
```

### 2. Các lệnh thường dùng

#### Khởi động containers

```bash
docker-compose up -d
```

#### Dừng containers

```bash
docker-compose down
```

#### Xem logs

```bash
# Logs của Rails app
docker-compose logs -f web

# Logs của MySQL
docker-compose logs -f db
```

#### Truy cập vào container Rails

```bash
docker-compose exec web bash
```

#### Chạy Rails commands

```bash
# Tạo migration
docker-compose exec web rails generate migration CreatePosts

# Chạy migration
docker-compose exec web rails db:migrate

# Mở Rails console
docker-compose exec web rails console

# Chạy tests
docker-compose exec web rails test
```

#### Reset database

```bash
docker-compose exec web rails db:drop db:create db:migrate
```

### 3. Truy cập ứng dụng

- **Rails app:** http://localhost:3000
- **MySQL:** localhost:3306
  - Username: `rails`
  - Password: `password`
  - Database: `tanmong`

### 4. Cấu trúc Docker

- **Dockerfile:** Định nghĩa Rails container với mysql2 gem
- **docker-compose.yml:** Orchestration cho Rails + MySQL
- **Volumes:**
  - `mysql_data`: Lưu trữ dữ liệu MySQL
  - `bundle_cache`: Cache gems để build nhanh hơn

### 5. Ưu điểm của mysql2 trong Docker

- ✅ Gem chính thức và ổn định nhất cho MySQL
- ✅ Hiệu suất cao
- ✅ Tương thích tốt với Rails
- ✅ Dễ cài đặt trong môi trường Linux container

### 6. Troubleshooting

#### Container không khởi động được

```bash
# Xem logs chi tiết
docker-compose logs

# Rebuild containers
docker-compose build --no-cache
docker-compose up -d
```

#### Database connection error

```bash
# Kiểm tra MySQL container
docker-compose exec db mysql -u rails -p tanmong

# Reset database
docker-compose exec web rails db:reset
```

#### mysql2 gem build error

```bash
# Rebuild với verbose output
docker-compose build --no-cache web
```

#### Port đã được sử dụng

Thay đổi port trong `docker-compose.yml`:

```yaml
ports:
  - "3001:3000" # Thay vì 3000:3000
```

### 7. Development workflow

1. Code thay đổi sẽ tự động reload (volume mount)
2. Gems mới cần rebuild container: `docker-compose build web`
3. Database changes: `docker-compose exec web rails db:migrate`

### 8. So sánh với cài đặt local

| Cài đặt Local                  | Docker                    |
| ------------------------------ | ------------------------- |
| ❌ Khó cài mysql2 trên Windows | ✅ Dễ dàng                |
| ❌ Conflict dependencies       | ✅ Isolated environment   |
| ❌ Khác nhau giữa dev/prod     | ✅ Consistent environment |
| ❌ Setup phức tạp              | ✅ One-command setup      |

-- Delete existing test users
DELETE FROM users WHERE username IN ('testuser', 'admin');

-- Insert test user with password: test123
-- BCrypt hash generated for "test123"
INSERT INTO users (username, email, password_hash, created_at, total_score, role) VALUES
('testuser', 'test@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', CURRENT_TIMESTAMP, 0, 'USER');

-- Insert admin user with password: admin123
-- BCrypt hash generated for "admin123"
INSERT INTO users (username, email, password_hash, created_at, total_score, role) VALUES
('admin', 'admin@example.com', '$2a$10$DOwnh2Q8SizJRqKVVJvnPOX9W8zR3qLlJvvP4kVDqJvXLvKJqXFqy', CURRENT_TIMESTAMP, 0, 'ADMIN');

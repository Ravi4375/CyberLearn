-- Insert test user with encrypted password (password: "test123")
INSERT INTO users (username, email, password_hash, created_at, total_score, role) VALUES
('testuser', 'test@example.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.', CURRENT_TIMESTAMP, 0, 'USER');

-- Insert admin user with encrypted password (password: "admin123")  
INSERT INTO users (username, email, password_hash, created_at, total_score, role) VALUES
('admin', 'admin@example.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.', CURRENT_TIMESTAMP, 0, 'ADMIN');
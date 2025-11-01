-- Insert categories
INSERT INTO categories (name, description, difficulty_level) VALUES
('Broken Access Control', 'Restrictions on what authenticated users are allowed to do are not properly enforced.', 'INTERMEDIATE'),
('Cryptographic Failures', 'Failures related to cryptography, often leading to exposure of sensitive data.', 'INTERMEDIATE'),
('Injection', 'Unsanitized data is sent to an interpreter as part of a command or query.', 'INTERMEDIATE'),
('Insecure Design', 'Missing or ineffective control design.', 'ADVANCED'),
('Security Misconfiguration', 'Insecure default configurations, incomplete setups, or misconfigured HTTP headers.', 'INTERMEDIATE');

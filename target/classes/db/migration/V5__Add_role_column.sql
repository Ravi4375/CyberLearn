-- Add role column to users table
ALTER TABLE users ADD COLUMN role VARCHAR(50) DEFAULT 'USER';

-- Update existing users to have USER role
UPDATE users SET role = 'USER' WHERE role IS NULL;
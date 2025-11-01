-- Users table
CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_score INTEGER DEFAULT 0,
    current_streak INTEGER DEFAULT 0,
    last_quiz_date DATE
);

-- Categories table
CREATE TABLE categories (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(500),
    difficulty_level VARCHAR(50)
);

-- Questions table
CREATE TABLE questions (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    category_id BIGINT NOT NULL,
    question_text VARCHAR(1000) NOT NULL,
    question_type VARCHAR(50),
    difficulty VARCHAR(50),
    points INTEGER DEFAULT 10,
    code_snippet VARCHAR(2000),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Answer options table
CREATE TABLE answer_options (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    question_id BIGINT NOT NULL,
    option_text VARCHAR(500) NOT NULL,
    is_correct BOOLEAN DEFAULT FALSE,
    explanation VARCHAR(1000),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

-- Quiz sessions table (overall summary of each quiz attempt)
CREATE TABLE quiz_sessions (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    category_id BIGINT NOT NULL,
    score INTEGER NOT NULL,
    total_questions INTEGER NOT NULL,
    percentage DOUBLE NOT NULL,
    attempt_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Quiz attempts table (per-question tracking inside a session)
CREATE TABLE quiz_attempts (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    question_id BIGINT NOT NULL,
    selected_answer VARCHAR(500),
    is_correct BOOLEAN,
    attempt_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

-- Code snippets table
CREATE TABLE code_snippets (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    question_id BIGINT NOT NULL,
    code_content VARCHAR(2000) NOT NULL,
    language VARCHAR(50),
    vulnerability_type VARCHAR(100),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

-- User progress table
CREATE TABLE user_progress (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    category_completed VARCHAR(255),
    score INTEGER,
    completion_date TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

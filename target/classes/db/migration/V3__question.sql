-- Broken Access Control (category_id: 1)
INSERT INTO questions (category_id, question_text, question_type, difficulty) VALUES
(1, 'Which of the following best describes Broken Access Control?', 'MCQ', 'BEGINNER'),
(1, 'Which vulnerability allows users to access unauthorized resources by modifying URLs?', 'MCQ', 'INTERMEDIATE'),
(1, 'Explain how to enforce least privilege in modern web applications.', 'MCQ', 'ADVANCED'),
(1, 'True or False: Access control checks should be performed on the server side.', 'TRUE_FALSE', 'BEGINNER'),
(1, 'How often should access control policies be reviewed?', 'MCQ', 'INTERMEDIATE'),
(1, 'True or False: Multi-tenancy increases the complexity of access control.', 'TRUE_FALSE', 'ADVANCED'),
(1, 'A user can access restricted pages simply by guessing URLs. What is the main security issue?', 'CODE_REVIEW', 'BEGINNER'),
(1, 'A bank website lets users modify the account number in the request and view other customers’ balances. Identify the vulnerability.', 'CODE_REVIEW', 'INTERMEDIATE'),
(1, 'An online service lets users escalate their own privileges by altering their session data. What is the vulnerability?', 'CODE_REVIEW', 'ADVANCED'),
(1, 'What is the risk of failing to log failed access attempts?', 'MCQ', 'ADVANCED');

-- Cryptographic Failures (category_id: 2)
INSERT INTO questions (category_id, question_text, question_type, difficulty) VALUES
(2, 'Which of the following is an example of a cryptographic failure?', 'MCQ', 'BEGINNER'),
(2, 'What is the weakness of using MD5 for hashing passwords?', 'MCQ', 'INTERMEDIATE'),
(2, 'Describe the impact of improper certificate validation.', 'MCQ', 'ADVANCED'),
(2, 'True or False: Storing passwords in plain text is safe if the database is secure.', 'TRUE_FALSE', 'BEGINNER'),
(2, 'What is the risk of reusing encryption keys?', 'MCQ', 'INTERMEDIATE'),
(2, 'True or False: Deprecated cryptographic functions should not be used in production.', 'TRUE_FALSE', 'ADVANCED'),
(2, 'A website stores user passwords without any encryption or hashing. What is the risk?', 'CODE_REVIEW', 'BEGINNER'),
(2, 'A company uses outdated cryptographic algorithms that are known to be weak. What is the potential impact?', 'CODE_REVIEW', 'INTERMEDIATE'),
(2, 'An organization hardcodes encryption keys in their public repository. What is the vulnerability?', 'CODE_REVIEW', 'ADVANCED'),
(2, 'True or False: Cryptographic systems should undergo regular audits.', 'TRUE_FALSE', 'ADVANCED');

-- Injection (category_id: 3)
INSERT INTO questions (category_id, question_text, question_type, difficulty) VALUES
(3, 'What is an injection attack?', 'MCQ', 'BEGINNER'),
(3, 'What is the role of escaping user input?', 'MCQ', 'INTERMEDIATE'),
(3, 'Describe blind SQL injection and its risks.', 'MCQ', 'ADVANCED'),
(3, 'True or False: Input validation can help prevent injection attacks.', 'TRUE_FALSE', 'BEGINNER'),
(3, 'What is the risk of command injection in web applications?', 'MCQ', 'INTERMEDIATE'),
(3, 'True or False: Regular code reviews can help detect injection flaws.', 'TRUE_FALSE', 'ADVANCED'),
(3, 'A feedback form sends user input directly into a database query without validation. What risk does this introduce?', 'CODE_REVIEW', 'BEGINNER'),
(3, 'A web application constructs an LDAP query using untrusted user input. What could go wrong?', 'CODE_REVIEW', 'INTERMEDIATE'),
(3, 'A file upload feature does not validate file names provided by users and uses them in system operations. What vulnerability could result?', 'CODE_REVIEW', 'ADVANCED'),
(3, 'How can parameterized queries help prevent injection?', 'MCQ', 'INTERMEDIATE');

-- Insecure Design (category_id: 4)
INSERT INTO questions (category_id, question_text, question_type, difficulty) VALUES
(4, 'Which of the following is an example of insecure design?', 'MCQ', 'BEGINNER'),
(4, 'How does secure design differ from secure implementation?', 'MCQ', 'INTERMEDIATE'),
(4, 'Describe how misuse of design patterns can lead to insecurity.', 'MCQ', 'ADVANCED'),
(4, 'True or False: Security should be considered during the design phase.', 'TRUE_FALSE', 'BEGINNER'),
(4, 'Why is defense-in-depth important in application design?', 'MCQ', 'INTERMEDIATE'),
(4, 'True or False: Secure APIs require secure design from the ground up.', 'TRUE_FALSE', 'ADVANCED'),
(4, 'An app is built without considering any security requirements during planning. What is the likely outcome?', 'CODE_REVIEW', 'BEGINNER'),
(4, 'A web service does not separate user and admin functions or restrict access between them. Explain the vulnerability.', 'CODE_REVIEW', 'INTERMEDIATE'),
(4, 'A system’s design assumes users are always honest and never attempts to validate critical actions. What is the likely security flaw?', 'CODE_REVIEW', 'ADVANCED'),
(4, 'What is the risk of not performing a design threat analysis?', 'MCQ', 'ADVANCED');

-- Security Misconfiguration (category_id: 5)
INSERT INTO questions (category_id, question_text, question_type, difficulty) VALUES
(5, 'Which of the following is a security misconfiguration?', 'MCQ', 'BEGINNER'),
(5, 'What is the risk of using sample configuration files in production?', 'MCQ', 'INTERMEDIATE'),
(5, 'Explain the impact of insecure default installations.', 'MCQ', 'ADVANCED'),
(5, 'True or False: Default credentials should always be changed.', 'TRUE_FALSE', 'BEGINNER'),
(5, 'How does misconfiguration affect application security?', 'MCQ', 'INTERMEDIATE'),
(5, 'True or False: Cloud misconfigurations are a top cause of breaches.', 'TRUE_FALSE', 'ADVANCED'),
(5, 'An organization deploys a server with default admin credentials unchanged. What is the security issue?', 'CODE_REVIEW', 'BEGINNER'),
(5, 'A cloud storage bucket is left publicly accessible without access restrictions. What could happen?', 'CODE_REVIEW', 'INTERMEDIATE'),
(5, 'A backup of the production database with real customer data is left on an unsecured test server. What is the vulnerability?', 'CODE_REVIEW', 'ADVANCED'),
(5, 'Why should error messages be generic in production?', 'MCQ', 'INTERMEDIATE');

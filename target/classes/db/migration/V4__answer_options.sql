-- ===========================
-- Answer Options for Questions
-- ===========================

INSERT INTO answer_options (question_id, option_text, is_correct, explanation) VALUES
-- Broken Access Control (Q1–Q10)
(1, 'Restrictions on user actions are not properly enforced.', TRUE, 'Broken Access Control means users can perform actions beyond their permissions.'),
(1, 'Passwords are stored in plain text.', FALSE, 'This is a storage, not access control, issue.'),
(1, 'Data is not encrypted.', FALSE, 'Encryption is different from access control.'),
(1, 'The website uses the HTTP protocol.', FALSE, 'Protocol choice is not directly related to access control.'),

(2, 'IDOR (Insecure Direct Object Reference)', TRUE, 'IDOR allows unauthorized resource access through URL manipulation.'),
(2, 'SQL Injection', FALSE, 'SQL Injection targets database queries, not resource access by URL.'),
(2, 'Phishing', FALSE, 'Phishing is a social engineering attack, not a resource access vulnerability.'),
(2, 'Brute force', FALSE, 'Brute force attacks passwords, not resource access.'),

(3, 'Assign permissions based on user roles and only as needed.', TRUE, 'Least privilege means giving users only the access required for their tasks.'),
(3, 'Allow all users full access for convenience.', FALSE, 'This contradicts least privilege.'),
(3, 'Assign admin rights to all users.', FALSE, 'This increases risk and violates least privilege.'),
(3, 'Never review user permissions.', FALSE, 'Permissions should be reviewed regularly.'),

(4, 'True', TRUE, 'Server-side checks are required as client-side checks can be bypassed.'),
(4, 'False', FALSE, 'Client-side checks are insecure and can be manipulated.'),

(5, 'Quarterly', FALSE, 'Reviewing policies more frequently may be needed for high-risk systems.'),
(5, 'Annually', FALSE, 'Annual reviews may not be sufficient for dynamic environments.'),
(5, 'Whenever system changes occur', TRUE, 'Access control policies should be reviewed after system changes.'),
(5, 'Never', FALSE, 'Policies must be reviewed regularly.'),

(6, 'True', TRUE, 'Managing multiple tenants increases access control complexity.'),
(6, 'False', FALSE, 'Multi-tenancy requires more careful access separation.'),

(7, 'The application does not enforce access restrictions on URLs.', TRUE, 'Users can access restricted pages by manipulating URLs.'),
(7, 'The application loads slowly.', FALSE, 'Performance is not the issue here.'),
(7, 'The application uses cookies.', FALSE, 'Cookies are not the main concern in this scenario.'),

(8, 'Customers can see other customers’ account information.', TRUE, 'This is a direct result of missing access controls.'),
(8, 'Customers cannot update their profiles.', FALSE, 'This is unrelated to access controls.'),
(8, 'Customers must use complex passwords.', FALSE, 'Password complexity is not part of this scenario.'),

(9, 'Privilege escalation', TRUE, 'Users can gain higher privileges than intended.'),
(9, 'Password expiration', FALSE, 'Password policy is not related.'),
(9, 'Data encryption', FALSE, 'Encryption is not relevant in this case.'),

(10, 'Sensitive actions are performed without logging failures.', TRUE, 'Lack of logging can hinder detection of unauthorized attempts.'),
(10, 'No password policy is enforced.', FALSE, 'While risky, it is not the subject of this question.'),
(10, 'Users must change passwords frequently.', FALSE, 'This is unrelated to logging failed access attempts.'),

-- Cryptographic Failures (Q11–Q20)
(11, 'Storing passwords in plain text.', TRUE, 'Plain text storage is a cryptographic failure.'),
(11, 'Using strong encryption algorithms.', FALSE, 'This is best practice, not a failure.'),
(11, 'Enforcing password complexity.', FALSE, 'Password complexity is an authentication control, not cryptography.'),

(12, 'MD5 is fast and vulnerable to attacks.', TRUE, 'MD5 is insecure and can be brute-forced.'),
(12, 'MD5 is slow and secure.', FALSE, 'MD5 is fast and insecure.'),
(12, 'MD5 requires a salt.', FALSE, 'Salting is not part of the MD5 algorithm itself.'),

(13, 'Attackers can spoof certificates and intercept traffic.', TRUE, 'Improper validation enables man-in-the-middle attacks.'),
(13, 'Traffic becomes faster.', FALSE, 'Certificate validation does not affect speed.'),
(13, 'Encryption becomes stronger.', FALSE, 'Improper validation does not strengthen encryption.'),

(14, 'True', FALSE, 'Plain text storage is unsafe even with a secure database.'),
(14, 'False', TRUE, 'Passwords should always be hashed and salted.'),

(15, 'Reusing keys makes all encrypted data vulnerable if one key is compromised.', TRUE, 'Compromised keys put all data at risk.'),
(15, 'Reusing keys improves performance.', FALSE, 'Key reuse provides no security benefit.'),
(15, 'Reusing keys is required for compliance.', FALSE, 'Best practice is to rotate keys.'),

(16, 'True', TRUE, 'Deprecated cryptographic functions may have known vulnerabilities.'),
(16, 'False', FALSE, 'Deprecated functions should be avoided in production.'),

(17, 'User credentials are exposed if the database is leaked.', TRUE, 'No encryption or hashing means exposure.'),
(17, 'User sessions are longer.', FALSE, 'Session length is unrelated.'),
(17, 'Passwords are automatically rotated.', FALSE, 'No rotation is implied by storage in plain text.'),

(18, 'Attackers may decrypt sensitive data using known weaknesses.', TRUE, 'Weak algorithms are susceptible to attacks.'),
(18, 'Data is protected from all attacks.', FALSE, 'Weak algorithms provide insufficient protection.'),
(18, 'Encryption keys are easier to manage.', FALSE, 'Key management is not improved by weak algorithms.'),

(19, 'Exposing keys in a public repository allows anyone to decrypt data.', TRUE, 'Hardcoded keys in public code are a major risk.'),
(19, 'It makes code easier to read.', FALSE, 'Readability is not a security concern here.'),
(19, 'It helps with debugging.', FALSE, 'Debugging should not compromise security.'),

(20, 'True', TRUE, 'Regular audits help identify cryptographic weaknesses.'),
(20, 'False', FALSE, 'Audits are necessary for maintaining strong security.'),

-- Injection (Q21–Q30)
(21, 'An attack where user input is executed as code.', TRUE, 'Injection attacks execute malicious input as code or queries.'),
(21, 'A problem with slow network speed.', FALSE, 'Network speed is not related.'),
(21, 'An error in SSL certificate validation.', FALSE, 'SSL validation is not injection.'),

(22, 'Escaping prevents malicious characters from altering queries.', TRUE, 'Escaping user input is a key defense against injection.'),
(22, 'Escaping makes web pages load faster.', FALSE, 'Performance is unaffected by escaping.'),
(22, 'Escaping is only needed for images.', FALSE, 'All user input should be escaped, not just images.'),

(23, 'Allows attackers to extract data by sending crafted queries and analyzing responses.', TRUE, 'Blind SQL injection reveals data bit by bit.'),
(23, 'Improves SQL performance.', FALSE, 'SQL injection is an attack, not a performance optimization.'),
(23, 'Prevents data leaks.', FALSE, 'It causes data leaks.'),

(24, 'True', TRUE, 'Input validation is a primary defense against injection.'),
(24, 'False', FALSE, 'Lack of validation increases injection risk.'),

(25, 'Attackers may execute arbitrary commands on the server.', TRUE, 'Command injection allows execution of system commands.'),
(25, 'Users can log in faster.', FALSE, 'Authentication speed is unrelated to injection.'),
(25, 'Data is always encrypted.', FALSE, 'Encryption is not the issue here.'),

(26, 'True', TRUE, 'Code reviews can help detect injection vulnerabilities.'),
(26, 'False', FALSE, 'Code reviews are useful for detecting such flaws.'),

(27, 'Malicious input can compromise the database.', TRUE, 'Directly using user input in queries is dangerous.'),
(27, 'Improved data performance.', FALSE, 'Security, not performance, is affected.'),
(27, 'Faster page loads.', FALSE, 'Performance is not the subject here.'),

(28, 'LDAP queries can be manipulated to access unauthorized data.', TRUE, 'User input in LDAP queries can cause injection.'),
(28, 'LDAP makes authentication faster.', FALSE, 'Speed is not related.'),
(28, 'LDAP only works with admin accounts.', FALSE, 'LDAP serves all user authentication.'),

(29, 'An attacker may upload files that can be executed on the server.', TRUE, 'Unvalidated file names can lead to remote code execution.'),
(29, 'Files upload faster.', FALSE, 'Performance is not the concern.'),
(29, 'Only images can be uploaded.', FALSE, 'Type restrictions are not enforced in this scenario.'),

(30, 'Parameterized queries separate code from data and prevent injection.', TRUE, 'They ensure user input cannot alter query structure.'),
(30, 'They make queries run faster.', FALSE, 'Performance is not the focus.'),
(30, 'They are only useful for SELECT statements.', FALSE, 'All queries can benefit from parameterization.'),

-- Insecure Design (Q31–Q40)
(31, 'Lack of security considerations during system design.', TRUE, 'Ignoring security during design leads to insecure applications.'),
(31, 'Using strong encryption.', FALSE, 'Encryption is a best practice, not an insecure design.'),
(31, 'Regular code reviews.', FALSE, 'Reviews strengthen security.'),

(32, 'Secure design considers threats and mitigations before implementation.', TRUE, 'Designing securely means anticipating risks.'),
(32, 'Secure design skips code reviews.', FALSE, 'Code reviews are essential in secure development.'),
(32, 'Secure implementation comes before secure design.', FALSE, 'Design should come first.'),

(33, 'Misusing patterns can create unexpected vulnerabilities.', TRUE, 'Design patterns must be applied carefully.'),
(33, 'Patterns always improve security.', FALSE, 'Not all patterns are secure by default.'),
(33, 'Patterns are not used in design.', FALSE, 'Patterns are commonly used.'),

(34, 'True', TRUE, 'Security requirements should be considered at the design stage.'),
(34, 'False', FALSE, 'Delaying security increases risk.'),

(35, 'Defense-in-depth provides multiple layers of security.', TRUE, 'Multiple controls reduce risk of a single point of failure.'),
(35, 'It slows down attackers.', FALSE, 'While true, this is not a design principle.'),
(35, 'It is not needed if one control is strong.', FALSE, 'All controls can fail.'),

(36, 'True', TRUE, 'APIs need to be designed securely from the outset.'),
(36, 'False', FALSE, 'Security is required at all stages.'),

(37, 'Security flaws are likely to be present.', TRUE, 'Skipping security planning results in vulnerabilities.'),
(37, 'The app will always be fast.', FALSE, 'Performance does not indicate security.'),
(37, 'The app will have many users.', FALSE, 'Popularity is unrelated to security.'),

(38, 'User and admin functions should be clearly separated.', TRUE, 'Separation prevents privilege escalation.'),
(38, 'Users and admins can always access the same resources.', FALSE, 'Access should be controlled by role.'),
(38, 'No separation is needed for security.', FALSE, 'Separation is a fundamental security practice.'),

(39, 'Assuming users are honest exposes the system to abuse.', TRUE, 'Design should expect malicious actions.'),
(39, 'Trusting users is always safe.', FALSE, 'Trust but verify.'),
(39, 'Validating actions wastes resources.', FALSE, 'Validation is essential for security.'),

(40, 'Not performing threat analysis leaves vulnerabilities unaddressed.', TRUE, 'Threat analysis identifies and helps mitigate risks.'),
(40, 'It makes design faster.', FALSE, 'Speed does not ensure security.'),
(40, 'Threat analysis is optional.', FALSE, 'It is essential in security design.'),

-- Security Misconfiguration (Q41–Q50)
(41, 'Leaving default configurations unchanged.', TRUE, 'Default settings often have weak security.'),
(41, 'Applying all security patches.', FALSE, 'Patching improves security.'),
(41, 'Disabling unused services.', FALSE, 'Disabling unused services is a good practice.'),

(42, 'Sample files may leave test settings or credentials in production.', TRUE, 'Sample files are not meant for production use.'),
(42, 'Sample files are always secure.', FALSE, 'They may not be production-hardened.'),
(42, 'Sample files improve performance.', FALSE, 'Performance is unrelated.'),

(43, 'Default installations may expose unnecessary features.', TRUE, 'Insecure defaults can lead to vulnerabilities.'),
(43, 'Default installations are always secure.', FALSE, 'They often require hardening.'),
(43, 'Default installations are faster.', FALSE, 'Speed does not equal security.'),

(44, 'True', TRUE, 'Default credentials are a common attack vector.'),
(44, 'False', FALSE, 'Credentials should always be changed.'),

(45, 'Misconfigurations can expose sensitive data or functionality.', TRUE, 'Incorrect settings can lead to security breaches.'),
(45, 'They improve reliability.', FALSE, 'Reliability is not security.'),
(45, 'Misconfigurations are rare.', FALSE, 'They are common.'),

(46, 'True', TRUE, 'Cloud misconfiguration is a leading cause of breaches.'),
(46, 'False', FALSE, 'Cloud misconfiguration risk is well established.'),

(47, 'Attackers can easily gain administrative access.', TRUE, 'Default admin credentials are widely known.'),
(47, 'No risk if the server is not connected to the internet.', FALSE, 'Local attacks are still possible.'),
(47, 'Default credentials are always strong.', FALSE, 'Defaults are often weak or public.'),

(48, 'Anyone can access or modify the data.', TRUE, 'Publicly accessible storage can result in data leaks.'),
(48, 'Data is encrypted by default.', FALSE, 'Encryption is not implied.'),
(48, 'Access is audited.', FALSE, 'Audit does not prevent unauthorized access.'),

(49, 'Sensitive data can be stolen if the test server is compromised.', TRUE, 'Backups should never be left unsecured.'),
(49, 'Test servers are always secure.', FALSE, 'They are often less protected than production.'),
(49, 'No risk if the data is old.', FALSE, 'All real data must be protected.'),

(50, 'Generic error messages reveal less information to attackers.', TRUE, 'Detailed errors can leak system details.'),
(50, 'Detailed error messages are best for users.', FALSE, 'Details aid attackers more than users.');



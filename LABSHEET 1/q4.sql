CREATE TABLE audit_logs (
    log_id INT PRIMARY KEY,
    `action` TEXT,
    created_at TIMESTAMP
);
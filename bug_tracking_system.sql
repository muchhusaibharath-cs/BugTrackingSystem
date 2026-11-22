-- Bug Tracking System database reconstructed from the Phase 2 report
-- and aligned with the supplied Phase 3 Hibernate entity.
CREATE DATABASE IF NOT EXISTS bug_tracking_system
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE bug_tracking_system;

CREATE TABLE IF NOT EXISTS users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  role VARCHAR(30) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS projects (
  project_id INT AUTO_INCREMENT PRIMARY KEY,
  project_name VARCHAR(100) NOT NULL,
  description VARCHAR(255),
  start_date DATE,
  status VARCHAR(30)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS bugs (
  bug_id INT AUTO_INCREMENT PRIMARY KEY,
  bug_title VARCHAR(150) NOT NULL,
  description VARCHAR(1000),
  priority VARCHAR(20),
  status VARCHAR(30),
  reported_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  project_id INT,
  reported_by INT,
  assigned_to INT,
  CONSTRAINT fk_bugs_project FOREIGN KEY (project_id)
    REFERENCES projects(project_id),
  CONSTRAINT fk_bugs_reporter FOREIGN KEY (reported_by)
    REFERENCES users(user_id),
  CONSTRAINT fk_bugs_assignee FOREIGN KEY (assigned_to)
    REFERENCES users(user_id)
) ENGINE=InnoDB;

-- Demo account: admin@bugtracking.local / Admin@123
-- Password stored as SHA-256 because LoginServlet compares SHA2(?, 256).
INSERT INTO users (name,email,password,role)
SELECT 'System Admin','admin@bugtracking.local',SHA2('Admin@123',256),'Admin'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email='admin@bugtracking.local');

INSERT INTO projects (project_name,description,start_date,status)
SELECT 'Bug Tracking System','Project used for tracking software defects',CURDATE(),'In Progress'
WHERE NOT EXISTS (SELECT 1 FROM projects WHERE project_name='Bug Tracking System');

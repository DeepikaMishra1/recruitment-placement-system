-- RPMS Database Schema
CREATE DATABASE IF NOT EXISTS recruitment_db;
USE recruitment_db;

-- 1. Candidates Table
CREATE TABLE IF NOT EXISTS candidates (
    candidate_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    mobile VARCHAR(15) NOT NULL,
    qualification VARCHAR(50) NOT NULL,
    college VARCHAR(100) NOT NULL,
    passing_year INT NOT NULL,
    percentage DECIMAL(5,2) NOT NULL,
    backlog_count INT DEFAULT 0,
    primary_tech VARCHAR(50) NOT NULL,
    profile_status VARCHAR(20) DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Companies Table
CREATE TABLE IF NOT EXISTS companies (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    industry VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL,
    hr_name VARCHAR(100) NOT NULL,
    hr_email VARCHAR(100) NOT NULL,
    status VARCHAR(20) DEFAULT 'ACTIVE'
);

-- 3. Jobs Table
CREATE TABLE IF NOT EXISTS jobs (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT,
    job_code VARCHAR(50) UNIQUE NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    openings INT NOT NULL,
    min_package DECIMAL(5,2),
    max_package DECIMAL(5,2),
    min_percentage DECIMAL(5,2) NOT NULL,
    max_backlogs INT NOT NULL,
    required_tech VARCHAR(50) NOT NULL,
    job_status VARCHAR(20) DEFAULT 'OPEN',
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

-- 4. Applications Table
CREATE TABLE IF NOT EXISTS applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    candidate_id INT,
    job_id INT,
    application_status VARCHAR(30) DEFAULT 'APPLIED',
    applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (candidate_id) REFERENCES candidates(candidate_id),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);
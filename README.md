# Bug Tracking System

## Project Overview

The Bug Tracking System is a Java-based web application developed as part of the Advanced Java Technology (AJT) project. It allows users to report, view, update and delete software bugs through a web-based interface.

The application integrates Java technologies with a MySQL database and is deployed on the Railway cloud platform.

## Live Application

https://bugtrackingsystem-production.up.railway.app

## Technologies Used

- Java
- JSP (JavaServer Pages)
- Jakarta Servlets
- JDBC
- Hibernate ORM
- Spring Framework
- JSTL
- MySQL
- HTML and CSS
- Maven
- Apache Tomcat
- GitHub
- Railway

## Project Features

- User login and authentication
- Session-based dashboard access
- Bug reporting
- Viewing reported bugs
- Bug priority selection
- Bug status management
- Bug deletion
- User logout
- Cloud database connectivity

## Database Design

The MySQL database contains three tables:

| Table | Purpose |
|---|---|
| users | Stores user accounts and authentication information |
| projects | Stores project information |
| bugs | Stores reported bugs, priorities, statuses and reporting dates |

## CRUD Operations

| Operation | Function | Test Result |
|---|---|---|
| Create | Report a new bug | Passed |
| Read | View reported bugs | Passed |
| Update | Change bug status | Passed |
| Delete | Delete a reported bug | Passed |

## Project Structure

- BugTrackingSystem/ — Maven application source code
- src/main/java/ — Java classes, servlets, models and configuration
- src/main/resources/ — Hibernate configuration
- src/main/webapp/ — JSP pages and web resources
- pom.xml — Maven dependencies and build configuration
- bug_tracking_system.sql — MySQL database setup script

## Local Installation

1. Clone or download this repository.
2. Open the BugTrackingSystem Maven project in NetBeans.
3. Configure MySQL and import the database setup script.
4. Ensure user passwords are stored in the format expected by the login servlet.
5. Configure the local database connection.
6. Build the project using Maven.
7. Deploy the application using Apache Tomcat.

## Cloud Deployment

The application is deployed using Railway with a separate MySQL database service.

Database connectivity is configured through the following environment variables:

- MYSQLHOST
- MYSQLPORT
- MYSQLDATABASE
- MYSQLUSER
- MYSQLPASSWORD

Both JDBC and Hibernate support local and Railway database configurations.

## Testing and Verification

The following features were successfully tested on the deployed application:

- User authentication
- Dashboard access
- Bug creation
- Bug retrieval
- Bug status updates
- Bug deletion
- User logout
- MySQL database record verification

## Conclusion

The Bug Tracking System demonstrates Java web application development, database integration, CRUD operations, user authentication and cloud deployment.

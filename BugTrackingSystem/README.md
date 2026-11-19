# Bug Tracking System

A Java web application built with Maven, Jakarta EE 10, Servlets, JSP, MySQL, Hibernate ORM, Spring, and JSTL.

## Requirements
- JDK 11 or later
- Apache Maven
- Apache Tomcat 10.1+ (Jakarta EE 10 compatible)
- MySQL Server / XAMPP

## Database setup
1. Start MySQL.
2. Open phpMyAdmin and create/import the database named `bug_tracking_system`.
3. Import the SQL backup supplied separately with this project. The source code expects the database name `bug_tracking_system`.
4. The current JDBC configuration in `src/main/java/com/bugtracking/config/DBConnection.java` uses `localhost:3306`, username `root`, and a blank password. Change these values if your MySQL setup differs.

## Build
From this folder, run:

```bash
mvn clean package
```

The WAR file will be generated in `target/`.

## Deploy
Deploy the generated WAR to a Jakarta-compatible Tomcat 10.1+ server, then open the application context in a browser. In NetBeans, configure Tomcat as the project server and use Run.

## Main source locations
- `src/main/java/` – Java classes, servlets, configuration, services, and model
- `src/main/webapp/` – JSP pages and web application resources
- `src/main/resources/` – Hibernate configuration
- `pom.xml` – Maven dependencies and build configuration

## Notes
- Keep the SQL database backup alongside the source ZIP when submitting the project.
- Do not include Maven's generated `target/` directory in the source-code ZIP; it is recreated during the build.

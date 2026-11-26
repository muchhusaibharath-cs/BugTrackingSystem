package com.bugtracking.config;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {

    private static final SessionFactory sessionFactory =
            buildSessionFactory();

    private static SessionFactory buildSessionFactory() {

        try {
            Configuration config = new Configuration()
                    .configure("hibernate.cfg.xml");

            String host = System.getenv("MYSQLHOST");
            String port = System.getenv("MYSQLPORT");
            String database = System.getenv("MYSQLDATABASE");
            String user = System.getenv("MYSQLUSER");
            String password = System.getenv("MYSQLPASSWORD");

            // Use Railway database when deployed
            if (host != null && port != null
                    && database != null && user != null
                    && password != null) {

                String url = "jdbc:mysql://" + host + ":"
                        + port + "/" + database;

                config.setProperty(
                        "hibernate.connection.url", url);

                config.setProperty(
                        "hibernate.connection.username", user);

                config.setProperty(
                        "hibernate.connection.password", password);

                System.out.println("Using Railway MySQL database");

            } else {
                System.out.println("Using local MySQL database");
            }

            return config.buildSessionFactory();

        } catch (Throwable ex) {
            System.err.println(
                    "Hibernate SessionFactory creation failed: " + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static void shutdown() {
        if (sessionFactory != null) {
            sessionFactory.close();
        }
    }
}

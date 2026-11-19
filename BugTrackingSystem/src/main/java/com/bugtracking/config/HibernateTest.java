package com.bugtracking.config;

import com.bugtracking.model.Bug;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import java.util.List;

public class HibernateTest {

    public static void main(String[] args) {

        Session session = null;
        SessionFactory factory = null;

        try {
            factory = HibernateUtil.getSessionFactory();
            session = factory.openSession();

            List<Bug> bugs = session
                    .createQuery("FROM Bug", Bug.class)
                    .getResultList();

            System.out.println("Hibernate ORM is working!");
            System.out.println("Total bugs in database: " + bugs.size());

        } catch (Exception e) {
            System.out.println("Hibernate test failed!");
            e.printStackTrace();

        } finally {
            if (session != null) {
                session.close();
            }
            if (factory != null) {
                factory.close();
            }
        }
    }
}
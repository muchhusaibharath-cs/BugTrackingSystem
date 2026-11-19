
package com.bugtracking.service;

import com.bugtracking.model.Bug;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BugService {

    private final SessionFactory sessionFactory;

    public BugService(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public String getMessage() {
        return "Spring Dependency Injection is working inside Bug Tracking System!";
    }

    public int getTotalBugs() {
        try (Session session = sessionFactory.openSession()) {

            List<Bug> bugs = session
                    .createQuery("FROM Bug", Bug.class)
                    .getResultList();

            return bugs.size();
        }
    }
}

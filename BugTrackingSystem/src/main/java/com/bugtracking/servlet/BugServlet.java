
package com.bugtracking.servlet;

import com.bugtracking.config.HibernateUtil;
import com.bugtracking.model.Bug;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;

@WebServlet("/reportBug")
public class BugServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");
            return;
        }

        String title = request.getParameter("bugTitle");
        String description = request.getParameter("description");
        String priority = request.getParameter("priority");

        // Server-side validation
        if (title == null || description == null || priority == null) {
            response.sendRedirect(
                    request.getContextPath() + "/reportBug.jsp?error=1");
            return;
        }

        title = title.trim();
        description = description.trim();

        if (title.length() < 3 || title.length() > 100
                || description.length() < 10
                || description.length() > 1000
                || !("Low".equals(priority)
                || "Medium".equals(priority)
                || "High".equals(priority))) {

            response.sendRedirect(
                    request.getContextPath() + "/reportBug.jsp?error=1");
            return;
        }

        Session hibernateSession = null;
        Transaction transaction = null;

        try {
            hibernateSession =
                    HibernateUtil.getSessionFactory().openSession();

            transaction = hibernateSession.beginTransaction();

            Bug bug = new Bug();
            bug.setBugTitle(title);
            bug.setDescription(description);
            bug.setPriority(priority);
            bug.setStatus("Open");
            bug.setProjectId(1);
            bug.setReportedBy(
                    (Integer) session.getAttribute("userId"));

            hibernateSession.persist(bug);

            transaction.commit();

            response.sendRedirect(
                    request.getContextPath() + "/reportBug.jsp?success=1");

        } catch (Exception e) {

            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }

            throw new ServletException("Unable to save bug report", e);

        } finally {

            if (hibernateSession != null) {
                hibernateSession.close();
            }
        }
    }
}


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

@WebServlet("/deleteBug")
public class DeleteBugServlet extends HttpServlet {

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

        String bugIdText = request.getParameter("bugId");

        if (bugIdText == null || !bugIdText.matches("\\d+")) {
            response.sendRedirect(
                    request.getContextPath() + "/viewBugs?error=1");
            return;
        }

        Session hibernateSession = null;
        Transaction transaction = null;

        try {
            int bugId = Integer.parseInt(bugIdText);

            hibernateSession =
                    HibernateUtil.getSessionFactory().openSession();

            transaction = hibernateSession.beginTransaction();

            Bug bug = hibernateSession.get(Bug.class, bugId);

            if (bug != null) {
                hibernateSession.remove(bug);
                transaction.commit();

                response.sendRedirect(
                        request.getContextPath() + "/viewBugs?deleted=1");
            } else {
                transaction.rollback();

                response.sendRedirect(
                        request.getContextPath() + "/viewBugs?error=1");
            }

        } catch (Exception e) {

            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }

            throw new ServletException("Unable to delete bug", e);

        } finally {

            if (hibernateSession != null) {
                hibernateSession.close();
            }
        }
    }
}


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

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/viewBugs")
public class ViewBugsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");
            return;
        }

        List<Map<String, Object>> bugs = new ArrayList<>();

        try (Session hibernateSession =
                HibernateUtil.getSessionFactory().openSession()) {

            List<Bug> bugList = hibernateSession
                    .createQuery("FROM Bug b ORDER BY b.bugId DESC",
                            Bug.class)
                    .getResultList();

            for (Bug item : bugList) {

                Map<String, Object> bug = new LinkedHashMap<>();

                bug.put("bugId", item.getBugId());
                bug.put("title", item.getBugTitle());
                bug.put("description", item.getDescription());
                bug.put("priority", item.getPriority());
                bug.put("status", item.getStatus());
                bug.put("reportedDate", item.getReportedDate());

                bugs.add(bug);
            }

            request.setAttribute("bugs", bugs);

            request.getRequestDispatcher("/viewBugs.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Unable to retrieve bugs", e);
        }
    }
}

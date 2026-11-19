
package com.bugtracking.servlet;

import com.bugtracking.service.BugService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import java.io.IOException;

@WebServlet("/springTest")
public class SpringTestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        WebApplicationContext context =
                WebApplicationContextUtils.getRequiredWebApplicationContext(
                        getServletContext());

        BugService bugService = context.getBean(BugService.class);

        response.setContentType("text/html;charset=UTF-8");

        response.getWriter().println("<h2>"
                + bugService.getMessage() + "</h2>");

        response.getWriter().println("<p>Total bugs in database: "
                + bugService.getTotalBugs() + "</p>");
    }
}

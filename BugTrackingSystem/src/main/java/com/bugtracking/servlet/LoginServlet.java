
package com.bugtracking.servlet;

import com.bugtracking.config.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String sql = "SELECT user_id, name, role FROM users "
                   + "WHERE email = ? AND password = SHA2(?, 256)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    HttpSession session = request.getSession();

                    session.setAttribute("userId", rs.getInt("user_id"));
                    session.setAttribute("userName", rs.getString("name"));
                    session.setAttribute("userRole", rs.getString("role"));

                    response.sendRedirect(
                        request.getContextPath() + "/dashboard.jsp");
                } else {
                    request.setAttribute("error",
                            "Invalid email or password!");

                    request.getRequestDispatcher("/login.jsp")
                           .forward(request, response);
                }
            }

        } catch (Exception e) {
            throw new ServletException("Login failed", e);
        }
    }
}
